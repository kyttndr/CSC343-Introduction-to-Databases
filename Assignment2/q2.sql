-- Getting soft

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q2;

-- You must not change this table definition.
CREATE TABLE q2 (
	ta_name varchar(100),
	average_mark_all_assignments real,
	mark_change_first_last real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)

-- Grader who has graded on every assignment
DROP VIEW IF EXISTS GradedAll CASCADE;
CREATE VIEW GradedAll AS
SELECT username
FROM Grader G, AssignmentGroup AG
WHERE G.group_id = AG.group_id
GROUP BY username
HAVING count(DISTINCT AG.assignment_id) = (SELECT count(*) FROM Assignment);

-- Graded at least 10 groups on each assignment

DROP VIEW IF EXISTS AtLeastTen CASCADE;
CREATE VIEW AtLeastTen AS
SELECT username
FROM GRADER G, RESULT R, AssignmentGroup AG
WHERE G.group_id = R.group_id AND G.group_id = AG.group_id AND R.group_id = AG.group_id
GROUP BY assignment_id, username
HAVING count(G.group_id) >= 10;


-- total mark for assignments
DROP VIEW IF EXISTS OutOf CASCADE;
CREATE VIEW OutOf AS
SELECT assignment_id, sum(weight*out_of) total
FROM RubricItem
GROUP BY assignment_id;

-- raw marks Graders have made
DROP VIEW IF EXISTS TotalMark CASCADE;
CREATE VIEW TotalMark AS
SELECT assignment_id, mark, username
FROM Result, Grader, AssignmentGroup
WHERE Result.group_id = Grader.group_id AND Result.group_id = AssignmentGroup.group_id AND Grader.group_id = AssignmentGroup.group_id;

-- percentage mark
DROP VIEW IF EXISTS PercentMark CASCADE;
CREATE VIEW PercentMark AS
SELECT TotalMark.assignment_id, (mark/total)*100 percentage, username
FROM TotalMark, OutOf
WHERE TotalMark.assignment_id = OutOf.assignment_id;

-- average percentage mark
DROP VIEW IF EXISTS AveragePercentageMarkBefore CASCADE;
CREATE VIEW AveragePercentageMarkBefore AS
SELECT assignment_id, avg(percentage) averagePercentage, username
FROM PercentMark
GROUP BY assignment_id, username;

-- add due date
DROP VIEW IF EXISTS AveragePercentageMark CASCADE;
CREATE VIEW AveragePercentageMark AS
SELECT Assignment.assignment_id, averagePercentage, username, due_date
FROM AveragePercentageMarkBefore, Assignment
WHERE Assignment.assignment_id = AveragePercentageMarkBefore.assignment_id;

-- Graders who have consistently been giving higher average grades over time
DROP VIEW IF EXISTS GiveHigher CASCADE;
CREATE VIEW GiveHigher AS
SELECT DISTINCT A1.username
FROM AveragePercentageMark A1
WHERE A1.averagePercentage < ALL(
	SELECT A2.averagePercentage
	FROM AveragePercentageMark A2
	WHERE A2.due_date > A1.due_date AND A2.username = A1.username);

-- average percentage throughout all asignments
DROP VIEW IF EXISTS AverageAll CASCADE;
CREATE VIEW AverageAll AS
SELECT username, avg(averagePercentage) averageAcross
FROM AveragePercentageMark NATURAL JOIN GiveHigher
GROUP BY username;

-- Graders first average grade
DROP VIEW IF EXISTS FirstAverage CASCADE;
CREATE VIEW FirstAverage AS
SELECT A1.username, A1.averagePercentage firstAverage
FROM AveragePercentageMark A1
WHERE A1.due_date < ALL(
	SELECT A2.due_date
	FROM AveragePercentageMark A2
	WHERE A1.username = A2.username AND A1.assignment_id <> A2.assignment_id);

-- Graders last average grade
DROP VIEW IF EXISTS LastAverage CASCADE;
CREATE VIEW LastAverage AS
SELECT A1.username, A1.averagePercentage lastAverage
FROM AveragePercentageMark A1
WHERE A1.due_date > ALL(
	SELECT A2.due_date
	FROM AveragePercentageMark A2
	WHERE A1.username = A2.username AND A1.assignment_id <> A2.assignment_id);

-- Get results
DROP VIEW IF EXISTS Results CASCADE;
CREATE VIEW Results AS
SELECT FirstAverage.username, AverageAll.averageAcross average_mark_all_assignments, (lastAverage - firstAverage) mark_change_first_last
FROM FirstAverage, LastAverage, AverageAll
WHERE FirstAverage.username = LastAverage.username AND FirstAverage.username = AverageAll.username AND LastAverage.username = AverageAll.username;

-- Get results with first two conditions
DROP VIEW IF EXISTS ResultsAfter CASCADE;
CREATE VIEW ResultsAfter AS
SELECT Results.username, average_mark_all_assignments, mark_change_first_last
FROM Results, GradedAll, AtLeastTen
WHERE Results.username = GradedAll.username AND Results.username = AtLeastTen.username AND GradedAll.username = AtLeastTen.username;

-- Get Final Results with first and surnames
DROP VIEW IF EXISTS FinalResults CASCADE;
CREATE VIEW FinalResults AS
SELECT DISTINCT (firstname || ' ' || surname) ta_name, average_mark_all_assignments, mark_change_first_last
FROM ResultsAfter, MarkusUser
WHERE ResultsAfter.username = MarkusUser.username;

-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q2(
	SELECT *
	FROM FinalResults); 
	-- put a final query here so that its results will go into the table. 