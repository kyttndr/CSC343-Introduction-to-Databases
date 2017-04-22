-- Uneven workloads

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q5;

-- You must not change this table definition.
CREATE TABLE q5 (
	assignment_id integer,
	username varchar(25), 
	num_assigned integer
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)

-- 
DROP VIEW IF EXISTS NumberAssigned CASCADE;
CREATE VIEW NumberAssigned AS
SELECT assignment_id, username, count(Grader.group_id) num_assigned
FROM Grader, AssignmentGroup
WHERE Grader.group_id = AssignmentGroup.group_id
GROUP BY assignment_id, username;

DROP VIEW IF EXISTS RangeGreaterAssignments CASCADE;
CREATE VIEW RangeGreaterAssignments AS
SELECT N1.assignment_id
FROM NumberAssigned N1
GROUP BY N1.assignment_id
HAVING ((
	SELECT DISTINCT max(num_assigned)
	FROM NumberAssigned N2
	WHERE N1.assignment_id = N2.assignment_id)
	-
   (SELECT DISTINCT min(num_assigned)
	FROM NumberAssigned N3
	WHERE N1.assignment_id = N3.assignment_id)) > 10;

DROP VIEW IF EXISTS Results CASCADE;
CREATE VIEW Results AS
SELECT RangeGreaterAssignments.assignment_id, username, num_assigned
FROM NumberAssigned, RangeGreaterAssignments
WHERE NumberAssigned.assignment_id = RangeGreaterAssignments.assignment_id; 

--DROP VIEW IF EXISTS Difference CASCADE;
--CREATE VIEW Difference AS
--SELECT N1.assignment_id, N1.username, numberOfGroups 
--FROM NumberAssigned N1
--WHERE ((SELECT DISTINCT numberOfGroups
--	   FROM NumberAssigned N2
--	   WHERE N1.assignment_id = N2.assignment_id AND N1.username = N2.username
--	   HAVING(numberOfGroups >= ALL (SELECT numberOfGroups
--	   								   FROM NumberAssigned N3)))
--	 - (SELECT DISTINCT count(group_id)
--	   	FROM NumberAssigned N4
--	   	WHERE N1.assignment_id = N4.assignment_id AND N1.username = N4.username
--	   	HAVING(count(group_id) <= ALL (SELECT count(group_id)
--	   								   FROM NumberAssigned N5))))
--	   > 10;



-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q5(
	SELECT *
	FROM Results); 
	-- put a final query here so that its results will go into the table.