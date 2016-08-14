SET ECHO ON
SET LINESIZE 180
SET PAGESIZE 180

-- #4
CREATE TABLE STU
  (STU_ID       NUMBER(9) CONSTRAINT STU_ID_pk PRIMARY KEY,
   STU_NAME     CHAR(20)  CONSTRAINT STU_NAME_nn NOT NULL,
   STU_ADDRESS  VARCHAR2(20),
   STU_MAJOR    VARCHAR2(10)
   );
   
DESC STU;
   
CREATE TABLE INSTRUCTOR
  (INST_ID      NUMBER(3) CONSTRAINT INST_ID_pk PRIMARY KEY,
   INST_NAME    CHAR(20)  CONSTRAINT INST_NAME_nn NOT NULL,
   INST_OFFICE  VARCHAR2(4)
   );
   
DESC INSTRUCTOR;
   
CREATE TABLE COURSE
  (COURSE_ID     VARCHAR2(7) CONSTRAINT COURSE_ID_pk PRIMARY KEY,
   COURSE_TITLE  VARCHAR2(30),
   INST_ID       NUMBER(3),
   FOREIGN KEY (INST_ID)
      REFERENCES INSTRUCTOR (INST_ID)
  );
  
DESC COURSE;

CREATE TABLE REGISTRATION
  (STU_ID       NUMBER(9),
   COURSE_ID    VARCHAR2(7),
   STU_COURSE_GRADE  CHAR(1)  CHECK (STU_COURSE_GRADE IN ('A', 'B', 'C', 'D', 'F')),
   PRIMARY KEY (STU_ID, COURSE_ID)
   );
   
DESC REGISTRATION;

-- #5
INSERT INTO STU
  VALUES (268300458, 'Williams', '208 Brooks', 'CIS');
INSERT INTO STU
  VALUES (543291073,'Baker','104 Philips','Acct');
INSERT INTO STU
  VALUES (695381127,'White','208 Brooks','Math');
  
SELECT * FROM STU;

INSERT INTO INSTRUCTOR
  VALUES (301,'Codd','B104');
INSERT INTO INSTRUCTOR
  VALUES (451,'Parsons','B317');
INSERT INTO INSTRUCTOR
  VALUES (255,'Miller','H310');
INSERT INTO INSTRUCTOR
  VALUES (518,'Bennett','B212');
INSERT INTO INSTRUCTOR
  VALUES (622,'Hilbert','M301');
  
SELECT * FROM INSTRUCTOR;
  
INSERT INTO COURSE
  VALUES ('CIS 350', 'Database', 301);
INSERT INTO COURSE
  VALUES ('CIS 465', 'Systems Anal', 451);
INSERT INTO COURSE
  VALUES ('Acc 201', 'Fund of Acctg.', 255);
INSERT INTO COURSE
  VALUES ('Mkt 300', 'Into to Mktg', 518);
INSERT INTO COURSE
  VALUES ('Mth 202', 'College algebra', 622);
  
SELECT * FROM COURSE;

INSERT INTO REGISTRATION
  VALUES (268300458, 'CIS 350', 'A');
INSERT INTO REGISTRATION
  VALUES (268300458, 'CIS 465', 'B');
INSERT INTO REGISTRATION
  VALUES (543291073, 'CIS 350', 'C');
INSERT INTO REGISTRATION
  VALUES (543291073, 'Acc 201', 'B');
INSERT INTO REGISTRATION
  VALUES (543291073, 'Mkt 300', 'A');
INSERT INTO REGISTRATION
  VALUES (695381127, 'Mth 202', 'B');
INSERT INTO REGISTRATION
  VALUES (695381127, 'Acc 201', 'A');
  
SELECT * FROM REGISTRATION; 

-- BONUS!
SELECT STU.STU_ID, STU.STU_NAME, STU.STU_ADDRESS, STU.STU_MAJOR, COURSE.COURSE_ID, COURSE.COURSE_TITLE, INSTRUCTOR.INST_ID, INSTRUCTOR.INST_NAME, INSTRUCTOR.INST_OFFICE, REGISTRATION.STU_COURSE_GRADE
FROM STU
INNER JOIN REGISTRATION
  ON STU.STU_ID = REGISTRATION.STU_ID
INNER JOIN COURSE
  ON REGISTRATION.COURSE_ID = COURSE.COURSE_ID
INNER JOIN INSTRUCTOR
  ON COURSE.INST_ID = INSTRUCTOR.INST_ID;
  
SET ECHO OFF


