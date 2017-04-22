-- A1 report

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q10;

-- You must not change this table definition.
CREATE TABLE q10 (
	group_id integer,
	mark real,
	compared_to_average real,
	status varchar(5)
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
(SELECT RawMark.assignment_id, group_id, (mark/total)*100 percentage
	FROM RawMark, FullMark
	WHERE RawMark.assignment_id = FullMark.assignment_id);

DROP VIEW IF EXISTS Mark CASCADE;
CREATE VIEW Mark AS
(SELECT group_id, percentage AS mark
	FROM PercentageMark NATURAL JOIN Assignment
	WHERE description = 'A1');

DROP VIEW IF EXISTS A1_Average CASCADE;
CREATE VIEW A1_Average AS
(SELECT avg(mark) AS average_mark
	FROM Mark);

DROP VIEW IF EXISTS Compare CASCADE;
CREATE VIEW Compare AS
(SELECT group_id, (mark - average_mark) AS compared_to_average
	FROM Mark, A1_Average);

DROP VIEW IF EXISTS Status CASCADE;
CREATE VIEW Status AS
(SELECT group_id, CASE
					 WHEN compared_to_average > 0 THEN 'above'
	                 WHEN compared_to_average = 0 THEN 'at'
	                 WHEN compared_to_average < 0 THEN 'below'
	                 ELSE NULL
       			  END AS status
	FROM Compare);

-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q10
(SELECT group_id, mark, compared_to_average, status
	FROM Mark NATURAL JOIN Compare NATURAL JOIN Status);
	-- put a final query here so that its results will go into the table.
