CREATE TABLE DETAILSS(
REGNO VARCHAR(11),
NAME VARCHAR(20)NOT NULL,
DOB DATE NOT NULL,
PHONE NUMBER(11) NOT NULL,
GENDER CHAR(1)NOT NULL,
CID VARCHAR(2)NOT NULL,
CNAME VARCHAR(11)NOT NULL,
INS_ID VARCHAR(11)NOT NULL,
INS_NAME VARCHAR(11)NOT NULL,
INS_OFFICE VARCHAR(11)NOT NULL,
CONSTRAINT USERDETAILss_PK PRIMARY KEY (regno)
);



INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14MO1','KENNY',TO_DATE('12-JAN-1996', 'DD/MM/YYYY'),12345,'M','C1','DBMS','I1','QUASI TECH','G123');
INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14MO5','MARY',TO_DATE('10-JUN-1995', 'DD/MM/YYYY'),12367,'F','C1','DBMS','I1','QUASI TECH','G123');
INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14MO7','RALPH',TO_DATE('10-JUL-1996', 'DD/MM/YYYY'),12898,'M','C1','DBMS','I2','VALEO TECH','G127');
INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14MO1','KENNY',TO_DATE('12-JAN-1996', 'DD/MM/YYYY'),12345,'M','C3','DS','I5','FXC TECH','G125');
INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14BO1','RACHEL',TO_DATE('10-APR-1995', 'DD/MM/YYYY'),23456,'F','C3','DS','I5','FXC TECH','G125');
INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14MO9','STEVE',TO_DATE('23-OCT-1995', 'DD/MM/YYYY'),34567,'M','C4','OS','I5','FXC TECH','G125');
INSERT INTO DETAILSS(REGNO,NAME,DOB,PHONE,GENDER,CID,CNAME,INS_ID,INS_NAME,INS_OFFICE)VALUES('14BO3','WARNER',TO_DATE('20-JUL-1996', 'DD/MM/YYYY'),23456,'M','C4','OS','I5','FXC TECH','G125');




----2NF-----

CREATE TABLE DETAILSS1(
REGNO VARCHAR(11)PRIMARY KEY,
NAME VARCHAR(20)NOT NULL,
DOB DATE NOT NULL,
PHONE NUMBER(11) NOT NULL,
GENDER CHAR(1)NOT NULL,
CONSTRAINT FK_DETAILSS1
FOREIGN KEY (REGNO)
REFERENCES DETAILSS(REGNO)
);

DESC DETAILSS1;
DROP TABLE DETAILSS1;



INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14MO1','KENNY',TO_DATE('12-JAN-1996', 'DD/MM/YYYY'),12345,'M');
INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14MO5','MARY',TO_DATE('10-JUN-1995', 'DD/MM/YYYY'),12367,'F');
INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14MO7','RALPH',TO_DATE('10-JUL-1996', 'DD/MM/YYYY'),12898,'M');
INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14MO1','KENNY',TO_DATE('12-JAN-1996', 'DD/MM/YYYY'),12345,'M');
INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14BO1','RACHEL',TO_DATE('10-APR-1995', 'DD/MM/YYYY'),23456,'F');
INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14MO9','STEVE',TO_DATE('23-OCT-1995', 'DD/MM/YYYY'),34567,'M');
INSERT INTO DETAILSS1(REGNO,NAME,DOB,PHONE,GENDER)VALUES('14BO3','WARNER',TO_DATE('20-JUL-1996', 'DD/MM/YYYY'),23456,'M');




CREATE TABLE DETAILSS2(
CID VARCHAR(2)PRIMARY KEY,
CNAME VARCHAR(11)NOT NULL

);



INSERT INTO DETAILSS2(CID,CNAME)VALUES('C1','DBMS');
INSERT INTO DETAILSS2(CID,CNAME)VALUES('C3','DS');
INSERT INTO DETAILSS2(CID,CNAME)VALUES('C4','OS');





CREATE TABLE DETAILSS3(
INS_ID VARCHAR(11)PRIMARY KEY,
INS_NAME VARCHAR(11)NOT NULL,
INS_OFFICE VARCHAR(11)NOT NULL
);




INSERT INTO DETAILSS3(INS_ID,INS_NAME,INS_OFFICE)VALUES('I1','QUASI TECH','G123');
INSERT INTO DETAILSS3(INS_ID,INS_NAME,INS_OFFICE)VALUES('I2','VALEO TECH','G127');
INSERT INTO DETAILSS3(INS_ID,INS_NAME,INS_OFFICE)VALUES('I5','FXC TECH','G125');



----3NF-------


--THERE IS NO TRANSITIVE DEPENDENCIES FOR NON-PRIME ATTRIBUTES



-----BCNF-----

CREATE TABLE DETAILSS4(
REGNO VARCHAR(11)NOT NULL,
NAME VARCHAR(20)NOT NULL,
GENDER CHAR(1),
CONSTRAINT DETAILSS4_PK PRIMARY KEY (REGNO)
);




INSERT INTO DETAILSS4(REGNO,NAME,GENDER)VALUES('14MO1','KENNY','M');
INSERT INTO DETAILSS4(REGNO,NAME,GENDER)VALUES('14MO5','MARY','F');
INSERT INTO DETAILSS4(REGNO,NAME,GENDER)VALUES('14MO7','RALPH','M');
INSERT INTO DETAILSS4(REGNO,NAME,GENDER)VALUES('14BO1','RACHEL','F');
INSERT INTO DETAILSS4(REGNO,NAME,GENDER)VALUES('14MO9','STEVE','M');
INSERT INTO DETAILSS4(REGNO,NAME,GENDER)VALUES('14BO3','WARNER','M');



CREATE TABLE DETAILSS5(
REGNO VARCHAR(11)NOT NULL,
DOB DATE NOT NULL,
CONSTRAINT FK_REGNO
FOREIGN KEY(REGNO)
REFERENCES DETAILSS4(REGNO)
);




INSERT INTO DETAILSS5(REGNO,DOB)VALUES('14MO1',TO_DATE('12-JAN-1996', 'DD/MM/YYYY'));
INSERT INTO DETAILSS5(REGNO,DOB)VALUES('14MO5',TO_DATE('10-JUN-1995', 'DD/MM/YYYY'));
INSERT INTO DETAILSS5(REGNO,DOB)VALUES('14MO7',TO_DATE('10-JUL-1996', 'DD/MM/YYYY'));
INSERT INTO DETAILSS5(REGNO,DOB)VALUES('14BO1',TO_DATE('10-APR-1995', 'DD/MM/YYYY'));
INSERT INTO DETAILSS5(REGNO,DOB)VALUES('14MO9',TO_DATE('23-OCT-1995', 'DD/MM/YYYY'));
INSERT INTO DETAILSS5(REGNO,DOB)VALUES('14BO3',TO_DATE('20-JUL-1996', 'DD/MM/YYYY'));




CREATE TABLE DETAILSS6(
REGNO VARCHAR(11),
PHONE NUMBER(11) NOT NULL,
CONSTRAINT FK_REGNUM
FOREIGN KEY(REGNO)
REFERENCES DETAILSS4(REGNO)
);


INSERT INTO DETAILSS6(REGNO,PHONE)VALUES('14MO1',12345);
INSERT INTO DETAILSS6(REGNO,PHONE)VALUES('14MO5',12367);
INSERT INTO DETAILSS6(REGNO,PHONE)VALUES('14MO7',12898);
INSERT INTO DETAILSS6(REGNO,PHONE)VALUES('14BO1',23456);
INSERT INTO DETAILSS6(REGNO,PHONE)VALUES('14MO9',34567);
INSERT INTO DETAILSS6(REGNO,PHONE)VALUES('14BO3',23456);



CREATE TABLE DETAILSS7(
CID VARCHAR(2)PRIMARY KEY,
CNAME VARCHAR(11)NOT NULL
);




INSERT INTO DETAILSS7(CID,CNAME)VALUES('C1','DBMS');
INSERT INTO DETAILSS7(CID,CNAME)VALUES('C3','DS');
INSERT INTO DETAILSS7(CID,CNAME)VALUES('C4','OS');




CREATE TABLE DETAILSS8(
INS_ID VARCHAR(11)PRIMARY KEY,
INS_NAME VARCHAR(11)NOT NULL
);




INSERT INTO DETAILSS8(INS_ID,INS_NAME)VALUES('I1','QUASI TECH');
INSERT INTO DETAILSS8(INS_ID,INS_NAME)VALUES('I2','VALEO TECH');
INSERT INTO DETAILSS8(INS_ID,INS_NAME)VALUES('I5','FXC TECH');



CREATE TABLE DETAILSS9(
INS_ID VARCHAR(11),
INS_OFFICE VARCHAR(11)NOT NULL,
CONSTRAINT FK_INS_ID
FOREIGN KEY(INS_ID)
REFERENCES DETAILSS8(INS_ID)
);





INSERT INTO DETAILSS9(INS_ID,INS_OFFICE)VALUES('I1','G123');
INSERT INTO DETAILSS9(INS_ID,INS_OFFICE)VALUES('I2','G127');
INSERT INTO DETAILSS9(INS_ID,INS_OFFICE)VALUES('I5','G125');