-- Solo superior

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q3;

-- You must not change this table definition.
CREATE TABLE q3 (
	assignment_id integer,
	description varchar(100), 
	num_solo integer, 
	average_solo real,
	num_collaborators integer, 
	average_collaborators real, 
	average_students_per_submission real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)

-- Students working alone
DROP VIEW IF EXISTS WorkingAlone CASCADE;
CREATE VIEW WorkingAlone AS
SELECT group_id, count(username) numberWorkingAlone
FROM Membership
GROUP BY group_id
HAVING count(username) = 1;

-- Raw mark of students working alone
DROP VIEW IF EXISTS TotalAloneMark CASCADE;
CREATE VIEW TotalAloneMark AS
SELECT Assignment.assignment_id, WorkingAlone.group_id, numberWorkingAlone, mark, description
FROM WorkingAlone, Result, AssignmentGroup, Assignment
WHERE WorkingAlone.group_id = Result.group_id AND WorkingAlone.group_id = AssignmentGroup.group_id AND Result.group_id = AssignmentGroup.group_id
      AND AssignmentGroup.assignment_id = Assignment.assignment_id;

-- total mark for assignments
DROP VIEW IF EXISTS OutOf CASCADE;
CREATE VIEW OutOf AS
SELECT assignment_id, sum(weight*out_of) total
FROM RubricItem
GROUP BY assignment_id;

-- mark as a percentage for students working alone
DROP VIEW IF EXISTS AlonePercentMark CASCADE;
CREATE VIEW AlonePercentMark AS
SELECT TotalAloneMark.assignment_id, group_id, (mark/total)*100 AS percentage, numberWorkingAlone, description
FROM TotalAloneMark, OutOf
WHERE TotalAloneMark.assignment_id = OutOf.assignment_id;

-- average mark for each assignment of students working alone
DROP VIEW IF EXISTS AverageAloneMarkBefore CASCADE;
CREATE VIEW AverageAloneMarkBefore AS
SELECT assignment_id, avg(percentage) AS averagePercentageAlone
FROM AlonePercentMark
GROUP BY assignment_id; 

-- get back number and description
DROP VIEW IF EXISTS AverageAloneMark CASCADE;
CREATE VIEW AverageAloneMark AS
SELECT AverageAloneMarkBefore.assignment_id, averagePercentageAlone, numberWorkingAlone, description
FROM AverageAloneMarkBefore, AlonePercentMark
WHERE AverageAloneMarkBefore.assignment_id = AlonePercentMark.assignment_id;

-- students working in groups
DROP VIEW IF EXISTS WorkingInGroup CASCADE;
CREATE VIEW WorkingInGroup AS
SELECT group_id, count(username) numberWorkingInGroups, count(group_id) numberofGroups
FROM Membership
GROUP BY group_id
HAVING count(username) > 1;

-- Raw mark of groups
DROP VIEW IF EXISTS TotalGroupMark CASCADE;
CREATE VIEW TotalGroupMark AS
SELECT Assignment.assignment_id, numberWorkingInGroups, numberofGroups, mark, description
FROM WorkingInGroup, Result, AssignmentGroup, Assignment
WHERE WorkingInGroup.group_id = Result.group_id AND WorkingInGroup.group_id = AssignmentGroup.group_id AND Result.group_id = AssignmentGroup.group_id
      AND AssignmentGroup.assignment_id = Assignment.assignment_id;

-- mark as a percentage for groups
DROP VIEW IF EXISTS GroupPercentMark CASCADE;
CREATE VIEW GroupPercentMark AS
SELECT TotalGroupMark.assignment_id, (mark/total)*100 AS percentage, numberWorkingInGroups, numberofGroups, description
FROM TotalGroupMark, OutOf
WHERE TotalGroupMark.assignment_id = OutOf.assignment_id;

-- average mark for groups
DROP VIEW IF EXISTS AverageGroupMarkBefore CASCADE;
CREATE VIEW AverageGroupMarkBefore AS
SELECT assignment_id, avg(percentage) AS averagePercentageGroup
FROM GroupPercentMark
GROUP BY assignment_id; 

-- get back numbers and description
DROP VIEW IF EXISTS AverageGroupMark CASCADE;
CREATE VIEW AverageGroupMark AS
SELECT AverageGroupMarkBefore.assignment_id, averagePercentageGroup, numberWorkingInGroups, numberofGroups, description
FROM AverageGroupMarkBefore, GroupPercentMark
WHERE AverageGroupMarkBefore.assignment_id = GroupPercentMark.assignment_id; 

-- combined results

DROP VIEW IF EXISTS Results CASCADE;
CREATE VIEW Results AS
SELECT AverageAloneMark.assignment_id, AverageAloneMark.description, numberWorkingAlone AS num_solo, averagePercentageAlone AS average_solo, numberWorkingInGroups AS num_collaborators, 
       averagePercentageGroup AS average_collaborators, CAST((numberWorkingAlone+numberWorkingInGroups) AS FLOAT)/(numberWorkingAlone+numberofGroups) AS average_students_per_group
FROM AverageAloneMark FULL JOIN AverageGroupMark ON AverageAloneMark.assignment_id = AverageGroupMark.assignment_id;
-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q3 (
	SELECT *
	FROM Results);
	-- put a final query here so that its results will go into the table.