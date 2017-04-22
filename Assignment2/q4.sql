-- Grader report

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q4;

-- You must not change this table definition.
CREATE TABLE q4 (
	assignment_id integer,
	username varchar(25), 
	num_marked integer, 
	num_not_marked integer,
	min_mark real,
	max_mark real
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
(SELECT RawMark.assignment_id, group_id, (mark/total)*100 AS percentage
	FROM RawMark, FullMark
	WHERE RawMark.assignment_id = FullMark.assignment_id);

DROP VIEW IF EXISTS Max_And_Min CASCADE;
CREATE VIEW Max_And_Min AS
(SELECT assignment_id, username, max(percentage) AS max_mark, min(percentage) AS min_mark
	FROM PercentageMark NATURAL JOIN Grader
	GROUP BY assignment_id, username);

DROP VIEW IF EXISTS Marked CASCADE;
CREATE VIEW Marked AS
(SELECT assignment_id, username, count(*) AS num_marked
	FROM AssignmentGroup NATURAL JOIN Grader NATURAL LEFT JOIN Result
	WHERE mark IS NOT NULL
	GROUP BY assignment_id, username);

DROP VIEW IF EXISTS Not_Marked CASCADE;
CREATE VIEW Not_Marked AS
(SELECT assignment_id, username, count(*) AS num_not_marked
	FROM AssignmentGroup NATURAL JOIN Grader NATURAL LEFT JOIN Result
	WHERE mark IS NULL
	GROUP BY assignment_id, username);

-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q4
(SELECT assignment_id, username, COALESCE(num_marked, 0), COALESCE(num_not_marked, 0), min_mark, max_mark
	FROM Max_And_Min NATURAL LEFT JOIN Marked NATURAL LEFT JOIN Not_Marked);
	-- put a final query here so that its results will go into the table.