-- High coverage

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q7;

-- You must not change this table definition.
CREATE TABLE q7 (
	ta varchar(100)
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS Grader_Info CASCADE;
CREATE VIEW Grader_Info AS
(SELECT username, group_id, assignment_id
	FROM Grader NATURAL JOIN AssignmentGroup);

DROP VIEW IF EXISTS Every_Assignment CASCADE;
CREATE VIEW Every_Assignment AS
(SELECT username AS ta
	FROM (SELECT DISTINCT username, assignment_id
			FROM Grader_Info) AS Grader_And_Assignment
	GROUP BY username
	HAVING count(*) = (SELECT count(*)
						FROM Assignment));

DROP VIEW IF EXISTS Grader_And_Student CASCADE;
CREATE VIEW Grader_And_Student AS
(SELECT DISTINCT Grader_Info.username AS ta, Membership.username AS student
	FROM Grader_Info, Membership
	WHERE Grader_Info.group_id = Membership.group_id);

DROP VIEW IF EXISTS Every_Group CASCADE;
CREATE VIEW Every_Group AS
(SELECT ta
	FROM Grader_And_Student
	GROUP BY ta
	HAVING count(*) = (SELECT count(*)
						FROM MarkusUser
						WHERE type = 'student'));

-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q7
(SELECT ta
FROM Every_Assignment)
INTERSECT
(SELECT ta
FROM Every_Group);
	-- put a final query here so that its results will go into the table.