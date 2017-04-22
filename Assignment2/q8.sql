-- Never solo by choice

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q8;

-- You must not change this table definition.
CREATE TABLE q8 (
	username varchar(25),
	group_average real,
	solo_average real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS Never_Alone CASCADE;
CREATE VIEW Never_Alone AS
(SELECT DISTINCT username
	FROM Submissions AS S1
	WHERE NOT EXISTS (SELECT S2.group_id
						FROM (Submissions NATURAL JOIN AssignmentGroup NATURAL JOIN Assignment) AS S2
						WHERE S2.group_max > 1 AND S1.username = S2.username
						GROUP BY S2.group_id
						HAVING count(*) = 1));

DROP VIEW IF EXISTS Should_Submit CASCADE;
CREATE VIEW Should_Submit AS
(SELECT username, assignment_id
	FROM (SELECT username FROM Submissions) AS S, (SELECT assignment_id FROM Assignment) AS A);

DROP VIEW IF EXISTS Not_Submits CASCADE;
CREATE VIEW Not_Submits AS
((SELECT * FROM Should_Submit)
EXCEPT 
(SELECT username, assignment_id
	FROM Submissions NATURAL JOIN AssignmentGroup
	GROUP BY username, assignment_id));

DROP VIEW IF EXISTS Submit_Every CASCADE;
CREATE VIEW Submit_Every AS 
(SELECT * FROM Never_Alone
EXCEPT 
SELECT DISTINCT username FROM Not_Submits);

-- total mark for an assignment
DROP VIEW IF EXISTS FullMark CASCADE;
CREATE VIEW FullMark AS
(SELECT assignment_id, sum(out_of * weight) AS total
	FROM RubricItem
	GROUP BY assignment_id);

-- raw mark for all assignments
DROP VIEW IF EXISTS RawMarkNIncomplete CASCADE;
CREATE VIEW RawMarkNIncomplete AS
(SELECT assignment_id, AssignmentGroup.group_id, mark
	FROM AssignmentGroup FULL JOIN Result ON AssignmentGroup.group_id = Result.group_id);

-- take into account all assignments
DROP VIEW IF EXISTS RawMark CASCADE;
CREATE VIEW RawMark AS
(SELECT Assignment.assignment_id, group_id, mark
	FROM Assignment FULL JOIN RawMarkNIncomplete ON Assignment.assignment_id = RawMarkNIncomplete.assignment_id);

-- percentage mark for all groups
DROP VIEW IF EXISTS PercentageMark CASCADE;
CREATE VIEW PercentageMark AS
(SELECT RawMark.assignment_id, group_id, (mark/total)*100 percentage
	FROM RawMark, FullMark
	WHERE RawMark.assignment_id = FullMark.assignment_id);

DROP VIEW IF EXISTS Group_Average CASCADE;
CREATE VIEW Group_Average AS
(SELECT username, avg(percentage) AS group_average
	FROM PercentageMark NATURAL JOIN Submit_Every NATURAL JOIN Membership NATURAL JOIN Assignment
	WHERE group_max > 1
	GROUP BY username);

DROP VIEW IF EXISTS Solo_Average CASCADE;
CREATE VIEW Solo_Average AS
(SELECT username, avg(percentage) AS solo_average
	FROM PercentageMark NATURAL JOIN Submit_Every NATURAL JOIN Membership NATURAL JOIN Assignment
	WHERE group_max = 1
	GROUP BY username);

-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q8
(SELECT username, group_average, solo_average
	FROM Submit_Every NATURAL LEFT JOIN Group_Average NATURAL LEFT JOIN Solo_Average);
	-- put a final query here so that its results will go into the table.