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
INSERT INTO MarkusUser VALUES ('s9', 'sln5', 'sfn5', 'student');
INSERT INTO MarkusUser VALUES ('s10', 'sln6', 'sfn6', 'student');
INSERT INTO MarkusUser VALUES ('s11', 'sln7', 'sfn7', 'student');
INSERT INTO MarkusUser VALUES ('s12', 'sln8', 'sfn8', 'student');
INSERT INTO MarkusUser VALUES ('s13', 'sln8', 'sfn8', 'student');
INSERT INTO MarkusUser VALUES ('t1', 'tln1', 'tfn1', 'TA');
INSERT INTO MarkusUser VALUES ('t2', 'tln2', 'tfn2', 'TA');


INSERT INTO Assignment VALUES (1000, 'a1', '2017-02-08 20:00', 1, 20);
INSERT INTO Assignment VALUES (1001, 'a2', '2017-02-08 20:01', 1, 20);

INSERT INTO Required VALUES (1000, 'A1.pdf');

INSERT INTO AssignmentGroup VALUES (2000, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2001, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2002, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2003, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2004, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2005, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2006, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2007, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2008, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2009, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3000, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3001, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3002, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3003, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3004, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3005, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3006, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3007, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3008, 1001, 'repo_url');
INSERT INTO AssignmentGroup VALUES (3009, 1001, 'repo_url');


INSERT INTO Membership VALUES ('s1', 2000);
INSERT INTO Membership VALUES ('s2', 2000);
INSERT INTO Membership VALUES ('s3', 2001);
INSERT INTO Membership VALUES ('s4', 2002);
INSERT INTO Membership VALUES ('s5', 2002);
INSERT INTO Membership VALUES ('s6', 2003);
INSERT INTO Membership VALUES ('s7', 2004);
INSERT INTO Membership VALUES ('s8', 2005);
INSERT INTO Membership VALUES ('s9', 2006);
INSERT INTO Membership VALUES ('s10', 2007);
INSERT INTO Membership VALUES ('s11', 2008);
INSERT INTO Membership VALUES ('s12', 2009);
INSERT INTO Membership VALUES ('s13', 2009);
INSERT INTO Membership VALUES ('s1', 3000);
INSERT INTO Membership VALUES ('s2', 3000);
INSERT INTO Membership VALUES ('s3', 3001);
INSERT INTO Membership VALUES ('s4', 3002);
INSERT INTO Membership VALUES ('s5', 3002);
INSERT INTO Membership VALUES ('s6', 3003);
INSERT INTO Membership VALUES ('s7', 3004);
INSERT INTO Membership VALUES ('s8', 3005);
INSERT INTO Membership VALUES ('s9', 3006);
INSERT INTO Membership VALUES ('s10', 3007);
INSERT INTO Membership VALUES ('s11', 3008);
INSERT INTO Membership VALUES ('s12', 3009);
INSERT INTO Membership VALUES ('s13', 3009);



INSERT INTO Submissions VALUES (3000, 'A1.pdf', 's1', 2000, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3001, 'A1.pdf', 's3', 2001, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3002, 'A1.pdf', 's4', 2002, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3003, 'A1.pdf', 's6', 2003, '2017-02-08 19:59');


INSERT INTO Grader VALUES (2000, 't1');
INSERT INTO Grader VALUES (2001, 't1');
INSERT INTO Grader VALUES (2002, 't1');
INSERT INTO Grader VALUES (2003, 't1');
INSERT INTO Grader VALUES (2004, 't1');
INSERT INTO Grader VALUES (2005, 't1');
INSERT INTO Grader VALUES (2006, 't1');
INSERT INTO Grader VALUES (2007, 't1');
INSERT INTO Grader VALUES (2008, 't1');
INSERT INTO Grader VALUES (2009, 't1');
INSERT INTO Grader VALUES (3000, 't1');
INSERT INTO Grader VALUES (3001, 't1');
INSERT INTO Grader VALUES (3002, 't1');
INSERT INTO Grader VALUES (3003, 't1');
INSERT INTO Grader VALUES (3004, 't1');
INSERT INTO Grader VALUES (3005, 't1');
INSERT INTO Grader VALUES (3006, 't1');
INSERT INTO Grader VALUES (3007, 't1');
INSERT INTO Grader VALUES (3008, 't1');
INSERT INTO Grader VALUES (3009, 't1');




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

/*INSERT INTO Membership VALUES ('s1', 2000);
INSERT INTO Membership VALUES ('s2', 2000);
INSERT INTO Membership VALUES ('s3', 2001);
INSERT INTO Membership VALUES ('s4', 2002);
INSERT INTO Membership VALUES ('s5', 2002);
INSERT INTO Membership VALUES ('s6', 2003);
INSERT INTO Membership VALUES ('s7', 2004);
INSERT INTO Membership VALUES ('s8', 2005);
INSERT INTO Membership VALUES ('s9', 2006);
INSERT INTO Membership VALUES ('s10', 2007);
INSERT INTO Membership VALUES ('s11', 2008);
INSERT INTO Membership VALUES ('s12', 2009);
INSERT INTO Membership VALUES ('s13', 2009);*/



INSERT INTO Result VALUES (2000, 7, true);
INSERT INTO Result VALUES (2001, 7, true);
INSERT INTO Result VALUES (2002, 8, true);
INSERT INTO Result VALUES (2003, 4, true);
INSERT INTO Result VALUES (2004, 9, true);
INSERT INTO Result VALUES (2005, 8, true);
INSERT INTO Result VALUES (2006, 2, true);
INSERT INTO Result VALUES (2007, 3, true);
INSERT INTO Result VALUES (2008, 9, true);
INSERT INTO Result VALUES (2009, 9, true);
INSERT INTO Result VALUES (3000, 7, true);
INSERT INTO Result VALUES (3001, 7, true);
INSERT INTO Result VALUES (3002, 8, true);
INSERT INTO Result VALUES (3003, 4, true);
INSERT INTO Result VALUES (3004, 9, true);
INSERT INTO Result VALUES (3005, 8, true);
INSERT INTO Result VALUES (3006, 2, true);
INSERT INTO Result VALUES (3007, 3, true);
INSERT INTO Result VALUES (3008, 9, true);
INSERT INTO Result VALUES (3009, 10, true);
