DROP SCHEMA IF EXISTS job CASCADE;
CREATE SCHEMA job;
SET search_path TO job;

-- The possible values of 'what'
CREATE TYPE skills AS ENUM ('SQL', 'Scheme', 'Python', 'R', 'LaTeX');

-- The possibilites for degree levels
CREATE TYPE degreeLevels AS ENUM ('certificate', 'undergraduate', 'professional', 'masters', 'doctoral');

-- The possible values for 'level', and 'importance'
CREATE DOMAIN score AS smallint 
   DEFAULT NULL
   CHECK (VALUE >= 1 and VALUE <= 5);

CREATE TABLE Posting (
	pID integer PRIMARY KEY NOT NULL,
	position varchar(50) NOT NULL
);

CREATE TABLE Question (
	qID integer PRIMARY KEY NOT NULL,
	question varchar(100) NOT NULL,
	UNIQUE (question)
);

CREATE TABLE Questions (
	pID integer REFERENCES Posting,
	qID integer REFERENCES Question,
	-- Additional constraint
	PRIMARY KEY(pID, qID)
);

CREATE TABLE RequiredSkills (
	pID integer REFERENCES Posting,
	what skills NOT NULL,
	level score NOT NULL,
	importance score NOT NULL,
	-- Additional constraint
	PRIMARY KEY(pID, what)
);

CREATE TABLE Interview (
	rID integer REFERENCES Resume,
	pID integer REFERENCES Posting,
	sID integer REFERENCES Interviewer,
	InterviewTime timestamp NOT NULL,
	location varchar(40) NOT NULL,
	-- Additional constraint
	iID integer PRIMARY KEY NOT NULL, 
	UNIQUE (rID, InterviewTime)
	UNIQUE (sID, InterviewTime)
);

CREATE TABLE Interviewer (
	sID integer PRIMARY KEY,
	forename varchar(20) NOT NULL,
	surname varchar(20) NOT NULL,
	honorific varchar(20) NOT NULL,
	title varchar(20) NOT NULL
);

CREATE TABLE Assessment (
	iID integer PRIMARY KEY REFERENCES Interview,
 	techProficiency integer NOT NULL,
	communication integer NOT NULL,
	enthusiasm integer NOT NULL,
	collegiality integer
);

CREATE TABLE Answers (
	iID integer REFERENCES Interview,
	pID integer REFERENCES Posting,
	qID integer REFERENCES Question,
	answer varchar(100) NOT NULL,
	PRIMARY KEY(iID, pID, qID)
	FOREIGN KEY iID REFERENCES Interview
	FOREIGN KEY (pID, qID) REFERENCES Questions(pID, qID)
);

CREATE TABLE Resume (
  rID varchar(25) PRIMARY KEY,
  summary text
);

CREATE TABLE ResumeHonours (
  rID varchar(25) REFERENCES Resume,
  honorific varchar(25),
  -- Additional Constraint
  PRIMARY KEY(rID, honorific)
);

CREATE TABLE ResumeTitles (
  rID varchar(25) REFERENCES Resume,
  title varchar(25),
  -- Additional Constraint
  PRIMARY KEY(rID, title)
);

CREATE TABLE Identification (
  rID varchar(25) PRIMARY KEY REFERENCES Resume,
  surname varchar(25) NOT NULL,
  forename varchar(25) NOT NULL,
  DOB varchar(25) NOT NULL,
  citizenship varchar(25) NOT NULL,
  address varchar(25) NOT NULL,
  telephone varchar(25) NOT NULL,
  email varchar(25) NOT NULL
);

CREATE TABLE Degree (
  rID varchar(25) REFERENCES Resume,
  degreeName varchar(25) NOT NULL,
  institution varchar(25) NOT NULL,
  honours boolean DEFAULT false,
  level degreeLevels NOT NULL,
  startDate date NOT NULL,
  endDate date NOT NULL,
  -- Additional Constraint
  PRIMARY KEY(rID, degreeName),
  CHECK(endDate > startDate)
);

CREATE TABLE Majors (
  rID varchar(25) REFERENCES Resume,
  major varchar(25) NOT NULL,
  -- Additional Constraint
  PRIMARY KEY(rID, major)
);

CREATE TABLE Minors (
  rID varchar(25) REFERENCES Resume,
  minor varchar(25),
  -- Additional Constraint
  PRIMARY KEY(rID, minor)
);

CREATE TABLE Experience (
  rID varchar(25) REFERENCES Resume,
  where varchar(25) NOT NULL,
  startDate date NOT NULL,
  endDate date NOT NULL,
  -- Additional Constraint
  PRIMARY KEY(rID, where),
  CHECK(endDate > startDate)
);

CREATE TABLE ExperienceTitles (
  rID varchar(25) REFERENCES Resume,
  where varchar(25) NOT NULL REFERENCES Experience,
  title varchar(25) NOT NULL,
  -- Additional Constraint
  PRIMARY KEY(rID, where, title),
  FOREIGN KEY(rID, where) REFERENCES Experience(rID, where)
);

CREATE TABLE ExperienceDescription (
  rID varchar(25) REFERENCES Resume,
  where varchar(25) NOT NULL REFERENCES Experience,
  description text NOT NULL,
  -- Additional Constraint
  PRIMARY KEY(rID, where),
  FOREIGN KEY(rID, where) REFERENCES Experience(rID, where)
);

CREATE TABLE ExperienceSkills (
  rID varchar(25) REFERENCES Resume,
  where varchar(25) REFERENCES Experience,
  what skills NOT NULL,
  level score NOT NULL
  -- Additional Constraint
  PRIMARY KEY(rID, where, what),
  FOREIGN KEY(rID, where) REFERENCES Experience(rID, where)
);
