-- Steady work

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q6;

-- You must not change this table definition.
CREATE TABLE q6 (
	group_id integer,
	first_file varchar(25),
	first_time timestamp,
	first_submitter varchar(25),
	last_file varchar(25),
	last_time timestamp, 
	last_submitter varchar(25),
	elapsed_time interval
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS Time_Output CASCADE;
CREATE VIEW Time_Output AS
(SELECT group_id, min(submission_date) AS first_time, max(submission_date) AS last_time, (max(submission_date) - min(submission_date)) AS elapsed_time
	FROM Submissions NATURAL JOIN Assignment NATURAL JOIN AssignmentGroup
	WHERE description = 'A1'
	GROUP BY group_id);

DROP VIEW IF EXISTS All_A1_Group CASCADE;
CREATE VIEW All_A1_Group AS
(SELECT group_id 
	FROM AssignmentGroup NATURAL JOIN Assignment
	WHERE description = 'A1');

DROP VIEW IF EXISTS First CASCADE;
CREATE VIEW First AS
(SELECT Submissions.group_id AS group_id, Submissions.file_name AS first_file, Submissions.username AS first_submitter
	FROM Time_Output, Submissions
	WHERE Time_Output.group_id = Submissions.group_id AND Time_Output.first_time = Submissions.submission_date);

DROP VIEW IF EXISTS Last CASCADE;
CREATE VIEW Last AS
(SELECT Submissions.group_id AS group_id, Submissions.file_name AS last_file, Submissions.username AS last_submitter
	FROM Time_Output, Submissions
	WHERE Time_Output.group_id = Submissions.group_id AND Time_Output.last_time = Submissions.submission_date);

-- Define views for your intermediate steps here.

-- Final answer.
INSERT INTO q6
(SELECT group_id, first_file, first_time::timestamp, first_submitter, last_file, last_time::timestamp, last_submitter, elapsed_time
	FROM Time_Output NATURAL JOIN First NATURAL JOIN Last NATURAL RIGHT JOIN All_A1_Group);
	-- put a final query here so that its results will go into the table.