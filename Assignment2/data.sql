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
INSERT INTO MarkusUser VALUES ('t1', 'tln1', 'tfn1', 'TA');
INSERT INTO MarkusUser VALUES ('t2', 'tln2', 'tfn2', 'TA');
INSERT INTO MarkusUser VALUES ('t3', 'tln3', 'tfn3', 'TA');
INSERT INTO MarkusUser VALUES ('s1', 'sln1', 'sfn1', 'student');
INSERT INTO MarkusUser VALUES ('s2', 'sln2', 'sfn2', 'student');
INSERT INTO MarkusUser VALUES ('s3', 'sln3', 'sfn3', 'student');
INSERT INTO MarkusUser VALUES ('s4', 'sln4', 'sfn4', 'student');
INSERT INTO MarkusUser VALUES ('s5', 'sln5', 'sfn5', 'student');
INSERT INTO MarkusUser VALUES ('s6', 'sln6', 'sfn6', 'student');
INSERT INTO MarkusUser VALUES ('s7', 'sln7', 'sfn7', 'student');
INSERT INTO MarkusUser VALUES ('s8', 'sln8', 'sfn8', 'student');
INSERT INTO MarkusUser VALUES ('s9', 'sln9', 'sfn9', 'student');
INSERT INTO MarkusUser VALUES ('s10', 'sln10', 'sfn10', 'student');
INSERT INTO MarkusUser VALUES ('s11', 'sln11', 'sfn11', 'student');
INSERT INTO MarkusUser VALUES ('s12', 'sln12', 'sfn12', 'student');
INSERT INTO MarkusUser VALUES ('s13', 'sln13', 'sfn13', 'student');
INSERT INTO MarkusUser VALUES ('s14', 'sln14', 'sfn14', 'student');
INSERT INTO MarkusUser VALUES ('s15', 'sln15', 'sfn15', 'student');
INSERT INTO MarkusUser VALUES ('s16', 'sln16', 'sfn16', 'student');
INSERT INTO MarkusUser VALUES ('s17', 'sln17', 'sfn17', 'student');
INSERT INTO MarkusUser VALUES ('s18', 'sln18', 'sfn18', 'student');
INSERT INTO MarkusUser VALUES ('s19', 'sln19', 'sfn19', 'student');
INSERT INTO MarkusUser VALUES ('s20', 'sln20', 'sfn20', 'student');
INSERT INTO MarkusUser VALUES ('s21', 'sln21', 'sfn21', 'student');
INSERT INTO MarkusUser VALUES ('s22', 'sln22', 'sfn22', 'student');
INSERT INTO MarkusUser VALUES ('s23', 'sln23', 'sfn23', 'student');
INSERT INTO MarkusUser VALUES ('s24', 'sln24', 'sfn24', 'student');
INSERT INTO MarkusUser VALUES ('s25', 'sln25', 'sfn25', 'student');
INSERT INTO MarkusUser VALUES ('s26', 'sln26', 'sfn26', 'student');
INSERT INTO MarkusUser VALUES ('s27', 'sln27', 'sfn27', 'student');
INSERT INTO MarkusUser VALUES ('s28', 'sln28', 'sfn28', 'student');
INSERT INTO MarkusUser VALUES ('s29', 'sln29', 'sfn29', 'student');
INSERT INTO MarkusUser VALUES ('s30', 'sln30', 'sfn30', 'student');
INSERT INTO MarkusUser VALUES ('s31', 'sln31', 'sfn31', 'student');
INSERT INTO MarkusUser VALUES ('s32', 'sln32', 'sfn32', 'student');
INSERT INTO MarkusUser VALUES ('s33', 'sln33', 'sfn33', 'student');
INSERT INTO MarkusUser VALUES ('s34', 'sln34', 'sfn34', 'student');
INSERT INTO MarkusUser VALUES ('s35', 'sln35', 'sfn35', 'student');
INSERT INTO MarkusUser VALUES ('s36', 'sln36', 'sfn36', 'student');
INSERT INTO MarkusUser VALUES ('s37', 'sln37', 'sfn37', 'student');
INSERT INTO MarkusUser VALUES ('s38', 'sln38', 'sfn38', 'student');
INSERT INTO MarkusUser VALUES ('s39', 'sln39', 'sfn39', 'student');
INSERT INTO MarkusUser VALUES ('s40', 'sln40', 'sfn40', 'student');
INSERT INTO MarkusUser VALUES ('s41', 'sln41', 'sfn41', 'student');
INSERT INTO MarkusUser VALUES ('s42', 'sln42', 'sfn42', 'student');
INSERT INTO MarkusUser VALUES ('s43', 'sln43', 'sfn43', 'student');
INSERT INTO MarkusUser VALUES ('s44', 'sln44', 'sfn44', 'student');
INSERT INTO MarkusUser VALUES ('s45', 'sln45', 'sfn45', 'student');
INSERT INTO MarkusUser VALUES ('s46', 'sln46', 'sfn46', 'student');
INSERT INTO MarkusUser VALUES ('s47', 'sln47', 'sfn47', 'student');
INSERT INTO MarkusUser VALUES ('s48', 'sln48', 'sfn48', 'student');
INSERT INTO MarkusUser VALUES ('s49', 'sln49', 'sfn49', 'student');
INSERT INTO MarkusUser VALUES ('s50', 'sln50', 'sfn50', 'student');
INSERT INTO MarkusUser VALUES ('s51', 'sln51', 'sfn51', 'student');
INSERT INTO MarkusUser VALUES ('s52', 'sln52', 'sfn52', 'student');
INSERT INTO MarkusUser VALUES ('s53', 'sln53', 'sfn53', 'student');
INSERT INTO MarkusUser VALUES ('s54', 'sln54', 'sfn54', 'student');
INSERT INTO MarkusUser VALUES ('s55', 'sln55', 'sfn55', 'student');
INSERT INTO MarkusUser VALUES ('s56', 'sln56', 'sfn56', 'student');
INSERT INTO MarkusUser VALUES ('s57', 'sln57', 'sfn57', 'student');
INSERT INTO MarkusUser VALUES ('s58', 'sln58', 'sfn58', 'student');
INSERT INTO MarkusUser VALUES ('s59', 'sln59', 'sfn59', 'student');
INSERT INTO MarkusUser VALUES ('s60', 'sln60', 'sfn60', 'student');
INSERT INTO MarkusUser VALUES ('s62', 'sln62', 'sfn62', 'student');
INSERT INTO MarkusUser VALUES ('s63', 'sln63', 'sfn63', 'student');
INSERT INTO MarkusUser VALUES ('s64', 'sln64', 'sfn64', 'student');


INSERT INTO Assignment VALUES (1000, 'A1', '2017-02-08 20:00', 1, 3);
INSERT INTO Assignment VALUES (2000, 'A2', '2017-02-09 20:00', 1, 1);
INSERT INTO Assignment VALUES (3000, 'A3', '2017-02-08 20:00', 1, 3);

INSERT INTO Required VALUES (1000, 'A1.pdf');
INSERT INTO Required VALUES (1000, 'A1.txt');
INSERT INTO Required VALUES (2000, 'A2.pdf');
INSERT INTO Required VALUES (3000, 'A3.pdf');

INSERT INTO AssignmentGroup VALUES (2000, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2001, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2002, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2003, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2004, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2005, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2006, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2007, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2008, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2009, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2010, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2011, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2012, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2013, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2014, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2015, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2016, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2017, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2018, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2019, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2020, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2021, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2022, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2023, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2024, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2025, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2026, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2027, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2028, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2029, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2030, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2031, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2032, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2033, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2034, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2035, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2036, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2037, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2038, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2039, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2040, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2041, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2042, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2043, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2044, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2045, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2046, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2047, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2048, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2049, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2050, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2051, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2052, 2000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2054, 3000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2055, 1000, 'repo_url');
INSERT INTO AssignmentGroup VALUES (2056, 3000, 'repo_url');

INSERT INTO Membership VALUES ('s1', 2000);
INSERT INTO Membership VALUES ('s2', 2001);
INSERT INTO Membership VALUES ('s3', 2002);
INSERT INTO Membership VALUES ('s4', 2003);
INSERT INTO Membership VALUES ('s5', 2003);
INSERT INTO Membership VALUES ('s6', 2003);
INSERT INTO Membership VALUES ('s7', 2004);
INSERT INTO Membership VALUES ('s8', 2004);
INSERT INTO Membership VALUES ('s9', 2004);
INSERT INTO Membership VALUES ('s10', 2005);
INSERT INTO Membership VALUES ('s11', 2005);
INSERT INTO Membership VALUES ('s12', 2005);
INSERT INTO Membership VALUES ('s13', 2006);
INSERT INTO Membership VALUES ('s14', 2006);
INSERT INTO Membership VALUES ('s15', 2007);
INSERT INTO Membership VALUES ('s16', 2008);
INSERT INTO Membership VALUES ('s17', 2009);
INSERT INTO Membership VALUES ('s18', 2010);
INSERT INTO Membership VALUES ('s19', 2011);
INSERT INTO Membership VALUES ('s20', 2012);
INSERT INTO Membership VALUES ('s21', 2013);
INSERT INTO Membership VALUES ('s22', 2014);
INSERT INTO Membership VALUES ('s23', 2015);
INSERT INTO Membership VALUES ('s24', 2016);
INSERT INTO Membership VALUES ('s25', 2017);
INSERT INTO Membership VALUES ('s26', 2018);
INSERT INTO Membership VALUES ('s27', 2019);
INSERT INTO Membership VALUES ('s28', 2020);
INSERT INTO Membership VALUES ('s29', 2021);
INSERT INTO Membership VALUES ('s30', 2022);
INSERT INTO Membership VALUES ('s31', 2023);
INSERT INTO Membership VALUES ('s32', 2024);
INSERT INTO Membership VALUES ('s33', 2025);
INSERT INTO Membership VALUES ('s34', 2026);
INSERT INTO Membership VALUES ('s35', 2027);
INSERT INTO Membership VALUES ('s36', 2028);
INSERT INTO Membership VALUES ('s37', 2029);
INSERT INTO Membership VALUES ('s38', 2030);
INSERT INTO Membership VALUES ('s39', 2031);
INSERT INTO Membership VALUES ('s40', 2032);
INSERT INTO Membership VALUES ('s41', 2033);
INSERT INTO Membership VALUES ('s42', 2034);
INSERT INTO Membership VALUES ('s43', 2035);
INSERT INTO Membership VALUES ('s44', 2036);
INSERT INTO Membership VALUES ('s45', 2037);
INSERT INTO Membership VALUES ('s46', 2038);
INSERT INTO Membership VALUES ('s47', 2039);
INSERT INTO Membership VALUES ('s48', 2040);
INSERT INTO Membership VALUES ('s49', 2041);
INSERT INTO Membership VALUES ('s50', 2042);
INSERT INTO Membership VALUES ('s51', 2043);
INSERT INTO Membership VALUES ('s52', 2044);
INSERT INTO Membership VALUES ('s53', 2045);
INSERT INTO Membership VALUES ('s54', 2046);
INSERT INTO Membership VALUES ('s55', 2047);
INSERT INTO Membership VALUES ('s56', 2048);
INSERT INTO Membership VALUES ('s57', 2049);
INSERT INTO Membership VALUES ('s58', 2050);
INSERT INTO Membership VALUES ('s59', 2051);
INSERT INTO Membership VALUES ('s60', 2052);
INSERT INTO Membership VALUES ('s4', 2054);
INSERT INTO Membership VALUES ('s62', 2054);
INSERT INTO Membership VALUES ('s63', 2055);
INSERT INTO Membership VALUES ('s64', 2055);
INSERT INTO Membership VALUES ('s63', 2056);
INSERT INTO Membership VALUES ('s64', 2056);

INSERT INTO Submissions VALUES (3000, 'A1.pdf', 's1', 2000, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3001, 'A1.pdf', 's13', 2006, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3002, 'A1.txt', 's14', 2006, '2017-02-08 19:59');
INSERT INTO Submissions VALUES (3004, 'A2.pdf', 's4', 2054, '2017-02-09 19:59');
INSERT INTO Submissions VALUES (3005, 'A3.pdf', 's4', 2003, '2017-02-09 19:59');

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
INSERT INTO Grader VALUES (2010, 't1');
INSERT INTO Grader VALUES (2011, 't1');
INSERT INTO Grader VALUES (2012, 't1');
INSERT INTO Grader VALUES (2013, 't1');
INSERT INTO Grader VALUES (2014, 't1');
INSERT INTO Grader VALUES (2015, 't1');
INSERT INTO Grader VALUES (2016, 't1');
INSERT INTO Grader VALUES (2017, 't1');
INSERT INTO Grader VALUES (2018, 't1');
INSERT INTO Grader VALUES (2019, 't1');
INSERT INTO Grader VALUES (2020, 't1');
INSERT INTO Grader VALUES (2021, 't1');
INSERT INTO Grader VALUES (2022, 't1');
INSERT INTO Grader VALUES (2023, 't1');
INSERT INTO Grader VALUES (2024, 't1');
INSERT INTO Grader VALUES (2025, 't1');
INSERT INTO Grader VALUES (2026, 't1');
INSERT INTO Grader VALUES (2027, 't1');
INSERT INTO Grader VALUES (2028, 't1');
INSERT INTO Grader VALUES (2029, 't1');
INSERT INTO Grader VALUES (2030, 't1');
INSERT INTO Grader VALUES (2031, 't1');
INSERT INTO Grader VALUES (2032, 't1');
INSERT INTO Grader VALUES (2033, 't2');
INSERT INTO Grader VALUES (2034, 't2');
INSERT INTO Grader VALUES (2035, 't2');
INSERT INTO Grader VALUES (2036, 't2');
INSERT INTO Grader VALUES (2037, 't2');
INSERT INTO Grader VALUES (2038, 't2');
INSERT INTO Grader VALUES (2039, 't2');
INSERT INTO Grader VALUES (2040, 't2');
INSERT INTO Grader VALUES (2041, 't2');
INSERT INTO Grader VALUES (2042, 't2');
INSERT INTO Grader VALUES (2043, 't2');
INSERT INTO Grader VALUES (2044, 't2');
INSERT INTO Grader VALUES (2045, 't2');
INSERT INTO Grader VALUES (2046, 't2');
INSERT INTO Grader VALUES (2047, 't2');
INSERT INTO Grader VALUES (2048, 't2');
INSERT INTO Grader VALUES (2049, 't2');
INSERT INTO Grader VALUES (2050, 't2');
INSERT INTO Grader VALUES (2051, 't2');
INSERT INTO Grader VALUES (2052, 't2');
INSERT INTO Grader VALUES (2054, 't2');
INSERT INTO Grader VALUES (2055, 't1');

INSERT INTO RubricItem VALUES (4000, 1000, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4001, 1000, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4002, 2000, 'style', 2, 0.5);
INSERT INTO RubricItem VALUES (4003, 2000, 'tester', 6, 0.5);
INSERT INTO RubricItem VALUES (4004, 3000, 'style', 8, 0.6);
INSERT INTO RubricItem VALUES (4005, 3000, 'tester', 10, 0.4);

INSERT INTO Grade VALUES (2000, 4000, 3);
INSERT INTO Grade VALUES (2000, 4001, 9);
INSERT INTO Grade VALUES (2001, 4002, 1);
INSERT INTO Grade VALUES (2001, 4003, 4.4);
INSERT INTO Grade VALUES (2002, 4004, 8);
INSERT INTO Grade VALUES (2002, 4005, 10);
INSERT INTO Grade VALUES (2003, 4000, 3);
INSERT INTO Grade VALUES (2003, 4001, 9);
INSERT INTO Grade VALUES (2004, 4000, 3);
INSERT INTO Grade VALUES (2004, 4001, 9);
INSERT INTO Grade VALUES (2005, 4000, 3);
INSERT INTO Grade VALUES (2005, 4001, 9);
INSERT INTO Grade VALUES (2006, 4000, 3);
INSERT INTO Grade VALUES (2006, 4001, 9);
INSERT INTO Grade VALUES (2007, 4000, 3);
INSERT INTO Grade VALUES (2007, 4001, 9);
INSERT INTO Grade VALUES (2008, 4000, 3);
INSERT INTO Grade VALUES (2008, 4001, 9);
INSERT INTO Grade VALUES (2009, 4000, 3);
INSERT INTO Grade VALUES (2009, 4001, 9);
INSERT INTO Grade VALUES (2010, 4000, 3);
INSERT INTO Grade VALUES (2010, 4001, 9);
INSERT INTO Grade VALUES (2011, 4000, 3);
INSERT INTO Grade VALUES (2011, 4001, 9);
INSERT INTO Grade VALUES (2012, 4002, 1);
INSERT INTO Grade VALUES (2012, 4003, 4.4);
INSERT INTO Grade VALUES (2013, 4002, 1);
INSERT INTO Grade VALUES (2013, 4003, 4.4);
INSERT INTO Grade VALUES (2014, 4002, 1);
INSERT INTO Grade VALUES (2014, 4003, 4.4);
INSERT INTO Grade VALUES (2015, 4002, 1);
INSERT INTO Grade VALUES (2015, 4003, 4.4);
INSERT INTO Grade VALUES (2016, 4002, 1);
INSERT INTO Grade VALUES (2016, 4003, 4.4);
INSERT INTO Grade VALUES (2017, 4002, 1);
INSERT INTO Grade VALUES (2017, 4003, 4.4);
INSERT INTO Grade VALUES (2018, 4002, 1);
INSERT INTO Grade VALUES (2018, 4003, 4.4);
INSERT INTO Grade VALUES (2019, 4002, 1);
INSERT INTO Grade VALUES (2019, 4003, 4.4);
INSERT INTO Grade VALUES (2020, 4002, 1);
INSERT INTO Grade VALUES (2020, 4003, 4.4);
INSERT INTO Grade VALUES (2021, 4004, 8);
INSERT INTO Grade VALUES (2021, 4005, 10);
INSERT INTO Grade VALUES (2022, 4004, 8);
INSERT INTO Grade VALUES (2022, 4005, 10);
INSERT INTO Grade VALUES (2023, 4004, 8);
INSERT INTO Grade VALUES (2023, 4005, 10);
INSERT INTO Grade VALUES (2024, 4004, 8);
INSERT INTO Grade VALUES (2024, 4005, 10);
INSERT INTO Grade VALUES (2025, 4004, 8);
INSERT INTO Grade VALUES (2025, 4005, 10);
INSERT INTO Grade VALUES (2026, 4004, 8);
INSERT INTO Grade VALUES (2026, 4005, 10);
INSERT INTO Grade VALUES (2027, 4004, 8);
INSERT INTO Grade VALUES (2027, 4005, 10);
INSERT INTO Grade VALUES (2028, 4004, 8);
INSERT INTO Grade VALUES (2028, 4005, 10);
INSERT INTO Grade VALUES (2029, 4004, 8);
INSERT INTO Grade VALUES (2029, 4005, 10);

INSERT INTO Result VALUES (2000, 12, true);
INSERT INTO Result VALUES (2001, 5.4, true);
INSERT INTO Result VALUES (2002, 18, true);
INSERT INTO Result VALUES (2003, 12, true);
INSERT INTO Result VALUES (2004, 12, true);
INSERT INTO Result VALUES (2005, 12, true);
INSERT INTO Result VALUES (2006, 12, true);
INSERT INTO Result VALUES (2007, 12, true);
INSERT INTO Result VALUES (2008, 12, true);
INSERT INTO Result VALUES (2009, 12, true);
INSERT INTO Result VALUES (2010, 12, true);
INSERT INTO Result VALUES (2011, 12, true);
INSERT INTO Result VALUES (2012, 5.4, true);
INSERT INTO Result VALUES (2013, 5.4, true);
INSERT INTO Result VALUES (2014, 5.4, true);
INSERT INTO Result VALUES (2015, 5.4, true);
INSERT INTO Result VALUES (2016, 5.4, true);
INSERT INTO Result VALUES (2017, 5.4, true);
INSERT INTO Result VALUES (2018, 5.4, true);
INSERT INTO Result VALUES (2019, 5.4, true);
INSERT INTO Result VALUES (2020, 5.4, true);
INSERT INTO Result VALUES (2021, 18, true);
INSERT INTO Result VALUES (2022, 18, true);
INSERT INTO Result VALUES (2023, 18, true);
INSERT INTO Result VALUES (2024, 18, true);
INSERT INTO Result VALUES (2025, 18, true);
INSERT INTO Result VALUES (2026, 18, true);
INSERT INTO Result VALUES (2027, 18, true);
INSERT INTO Result VALUES (2028, 18, true);
INSERT INTO Result VALUES (2029, 18, true);
