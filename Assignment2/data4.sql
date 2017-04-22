-- If there is already any data in these tables, empty it out.

TRUNCATE TABLE Result CASCADE;
TRUNCATE TABLE Grade CASCADE;
TRUNCATE TABLE RubricItem CASCADE;
TRUNCATE TABLE Grader CASCADE;
TRUNCATE TABLE Submissions CASCADE;
TRUNCATE TABLE Membership CASCADE;
TRUNCATE TABLE AssignmentGroup CASCADE;
TRUNCATE TABLE Required CASCADE;
TRUNCATE TABLE Assignment CASCADE;
TRUNCATE TABLE MarkusUser CASCADE;


-- Now insert data from scratch.

INSERT INTO MarkusUser VALUES ('i1', 'iln1', 'ifn1', 'instructor');
INSERT INTO MarkusUser VALUES ('s1', 'sln1', 'sfn1', 'student');
INSERT INTO MarkusUser VALUES ('s2', 'sln2', 'sfn2', 'student');
INSERT INTO MarkusUser VALUES ('s3', 'sln3', 'sfn3', 'student');
INSERT INTO MarkusUser VALUES ('s4', 'sln4', 'sfn4', 'student');
INSERT INTO MarkusUser VALUES ('s5', 'sln5', 'sfn5', 'student');
INSERT INTO MarkusUser VALUES ('s6', 'sln6', 'sfn6', 'student');
INSERT INTO MarkusUser VALUES ('s7', 'sln7', 'sfn7', 'student');
INSERT INTO MarkusUser VALUES ('s8', 'sln8', 'sfn8', 'student');
INSERT INTO MarkusUser VALUES ('t1', 'tln1', 'tfn1', 'TA');
INSERT INTO MarkusUser VALUES ('t2', 'tln2', 'tfn2', 'TA');
INSERT INTO MarkusUser VALUES ('t3', 'tln3', 'tfn3', 'TA');
INSERT INTO Assignment VALUES (1000, 'a1', '2017-02-08 20:00', 1, 2);
INSERT INTO Assignment VALUES (1001, 'a2', '2017-02-08 20:20', 1, 2);
INSERT INTO Required VALUES (1000, 'A1.pdf');
INSERT INTO Required VALUES (1001, 'A2.pdf');

INSERT INTO AssignmentGroup VALUES (2000, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2001, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2002, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2003, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2004, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2005, 1001, 'repo_url');

INSERT INTO Membership VALUES ('s1', 2000);
INSERT INTO Membership VALUES ('s2', 2000);
INSERT INTO Membership VALUES ('s3', 2001);
INSERT INTO Membership VALUES ('s4', 2002);
INSERT INTO Membership VALUES ('s5', 2002);
INSERT INTO Membership VALUES ('s6', 2003);
INSERT INTO Membership VALUES ('s7', 2004);
INSERT INTO Membership VALUES ('s8', 2005);

INSERT INTO Submissions VALUES (3000, 'A1.pdf', 's1', 2000, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3001, 'A1.pdf', 's3', 2001, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3002, 'A1.pdf', 's4', 2002, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3003, 'A1.pdf', 's6', 2003, '2017-02-08 19:59');

INSERT INTO Grader VALUES (2000, 't1');
INSERT INTO Grader VALUES (2001, 't1');
INSERT INTO Grader VALUES (2002, 't1');
INSERT INTO Grader VALUES (2003, 't1');
INSERT INTO Grader VALUES (2004, 't1');
INSERT INTO Grader VALUES (2005, 't2');

INSERT INTO RubricItem VALUES (4000, 1000, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4001, 1000, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4002, 1001, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4003, 1001, 'tester', 12, 0.75);

INSERT INTO Grade VALUES (2000, 4000, 3);
INSERT INTO Grade VALUES (2000, 4001, 9);
INSERT INTO Grade VALUES (2001, 4000, 4);
INSERT INTO Grade VALUES (2001, 4001, 12);
INSERT INTO Grade VALUES (2002, 4000, 2);
INSERT INTO Grade VALUES (2002, 4001, 6);
INSERT INTO Grade VALUES (2003, 4000, 4);
INSERT INTO Grade VALUES (2003, 4001, 12);

INSERT INTO Result VALUES (2004, 7, true);
--INSERT INTO Result VALUES (2000, 7, true);
INSERT INTO Result VALUES (2001, 8, true);
INSERT INTO Result VALUES (2002, 4, true);
INSERT INTO Result VALUES (2003, 9, true);
