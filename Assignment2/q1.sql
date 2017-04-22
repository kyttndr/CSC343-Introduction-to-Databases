-- Distributions

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q1;

-- You must not change this table definition.
CREATE TABLE q1 (
	assignment_id integer,
	average_mark_percent real, 
	num_80_100 integer, 
	num_60_79 integer, 
	num_50_59 integer, 
	num_0_49 integer
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)

-- total mark for an assignment
DROP VIEW IF EXISTS FullMark CASCADE;
CREATE VIEW FullMark AS
(SELECT assignment_id, sum(out_of * weight) AS total
FROM RubricItem
GROUP BY assignment_id);

-- raw mark for all assignments
DROP VIEW IF EXISTS RawMarkNIncomplete CASCADE;
CREATE VIEW RawMarkNIncomplete AS
SELECT assignment_id, AssignmentGroup.group_id, mark
FROM AssignmentGroup FULL JOIN Result ON AssignmentGroup.group_id = Result.group_id;

-- take into account all assignments
DROP VIEW IF EXISTS RawMark CASCADE;
CREATE VIEW RawMark AS
SELECT Assignment.assignment_id, group_id, mark
FROM Assignment FULL JOIN RawMarkNIncomplete ON Assignment.assignment_id = RawMarkNIncomplete.assignment_id;

-- percentage mark for all groups
DROP VIEW IF EXISTS PercentageMark CASCADE;
CREATE VIEW PercentageMark AS
SELECT RawMark.assignment_id, group_id, (mark/total)*100 percentage
FROM RawMark, FullMark
WHERE RawMark.assignment_id = FullMark.assignment_id;

-- average percentage mark
DROP VIEW IF EXISTS AveragePercentageMark CASCADE;
CREATE VIEW AveragePercentageMark AS
SELECT assignment_id, avg(percentage) average_mark_percent
FROM PercentageMark
GROUP BY assignment_id;

-- count of number of groups who got 80+
DROP VIEW IF EXISTS EightyPlus CASCADE;
CREATE VIEW EightyPlus as
(SELECT assignment_id, count(percentage) num_80_100
FROM (Assignment
NATURAL LEFT JOIN
(SELECT *
FROM PercentageMark
WHERE percentage >= 80 AND percentage <= 100) AS Group_80_100)
GROUP BY assignment_id);

-- count of number of groups who got 60+
DROP VIEW IF EXISTS SixtyPlus CASCADE;
CREATE VIEW SixtyPlus as
(SELECT assignment_id, count(percentage) num_60_79
FROM (Assignment
NATURAL LEFT JOIN
(SELECT *
FROM PercentageMark
WHERE percentage >= 60 AND percentage <= 79) AS Group_60_79)
GROUP BY assignment_id);

-- count of number of groups who got 50+
DROP VIEW IF EXISTS FiftyPlus CASCADE;
CREATE VIEW FiftyPlus as
(SELECT assignment_id, count(percentage) num_50_59
FROM (Assignment
NATURAL LEFT JOIN
(SELECT *
FROM PercentageMark
WHERE percentage >= 50 AND percentage <= 59) AS Group_50_59)
GROUP BY assignment_id);

-- count of number of groups who got 0+
DROP VIEW IF EXISTS ZeroPlus CASCADE;
CREATE VIEW ZeroPlus as
(SELECT assignment_id, count(percentage) num_0_49
FROM (Assignment
NATURAL LEFT JOIN
(SELECT *
FROM PercentageMark
WHERE percentage >= 0 AND percentage <= 49) AS Group_0_49z)
GROUP BY assignment_id);
-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q1
(SELECT assignment_id, average_mark_percent, COALESCE(num_80_100, 0), COALESCE(num_60_79, 0), COALESCE(num_50_59, 0), COALESCE(num_0_49, 0)
	FROM AveragePercentageMark NATURAL JOIN EightyPlus NATURAL JOIN SixtyPlus NATURAL JOIN FiftyPlus NATURAL JOIN ZeroPlus);  
	-- put a final query here so that its results will go into the table.