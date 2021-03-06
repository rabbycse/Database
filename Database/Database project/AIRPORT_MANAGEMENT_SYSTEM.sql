-- Airport Management System --
-- DB Design Spring 2019--

CREATE TABLE CITY
(CNAME VARCHAR2(15) NOT NULL,
STATE VARCHAR2(15), 
COUNTRY VARCHAR(30),
PRIMARY KEY(CNAME));


-- Insering values of Table: CITY--
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES ('Dhaka','Dhaka','Bangladesh');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Louisville','Kentucky','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES ('Fort Worth','Texas','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Sylhet','Sylhet','Bangladesh');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Coxs Bazar','Coxs Bazar','Bangladesh');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('San Francisco', 'California', 'United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Frankfurt','Hesse','Germany');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Houston','Texas','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('New York City','New York','United States');
INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES('Tampa', 'Florida', 'United States');

CREATE TABLE AIRPORT
(AP_NAME VARCHAR2(100) NOT NULL,
STATE VARCHAR2(15), 
COUNTRY VARCHAR(30),
CNAME VARCHAR2(15),
PRIMARY KEY(AP_NAME),
FOREIGN KEY(CNAME) REFERENCES CITY(CNAME) ON DELETE CASCADE);

--Insering values for Table: AIRPORT--

INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Hazrat Shahjalal International Airport','Dhaka','Bangladesh','Dhaka');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Louisville International Airport','Kentucky','United States','Louisville');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Dallas/Fort Worth International Airport','Texas','United States','Fort Worth');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Osmani International Airport','Sylhet','Bangladesh','Sylhet');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Coxs Bazar International Airport','Coxs Bazar','Bangladesh','Coxs Bazar');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('San Francisco International Airport','California', 'United States','San Francisco');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Frankfurt Airport','Hesse','Germany','Frankfurt');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('George Bush Intercontinental Airport','Texas','United States','Houston');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('John F. Kennedy International Airport','New York','United States','New York City');
INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES('Tampa International Airport','Florida', 'United States','Tampa');


CREATE TABLE AIRLINE
(AIRLINEID VARCHAR(3) NOT NULL,
AL_NAME VARCHAR2(50),
THREE_DIGIT_CODE VARCHAR(3),
PRIMARY KEY(AIRLINEID));

-- Insering values for Table: AIRLINE --

INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('BG','Biman Bangladesh Airlines','098');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('AA','American Airlines','001');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('LH','Lufthansa', '220');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('BA','British Airways','125');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('QR','Qatar Airways','157');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('9W','Jet Airways','589');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('EK','Emirates','176');
INSERT INTO AIRLINE (AIRLINEID, AL_NAME, THREE_DIGIT_CODE) VALUES('EY','Ethiad Airways','607');

CREATE TABLE CONTAINS
(AIRLINEID VARCHAR(3) NOT NULL,
AP_NAME VARCHAR2(100) NOT NULL,
PRIMARY KEY(AIRLINEID, AP_NAME),
FOREIGN KEY(AIRLINEID) REFERENCES AIRLINE(AIRLINEID) ON DELETE CASCADE,
FOREIGN KEY(AP_NAME) REFERENCES AIRPORT(AP_NAME) ON DELETE CASCADE);

-- Insering values into Table: Contains--

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','Louisville International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','George Bush Intercontinental Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','San Francisco International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AA','Tampa International Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Hazrat Shahjalal International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','Dallas/Fort Worth International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Osmani International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Coxs Bazar International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('AI','George Bush Intercontinental Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Coxs Bazar International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','Frankfurt Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','San Francisco International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('LH','Dallas/Fort Worth International Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Coxs Bazar  International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Hazrat Shahjalal International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','Frankfurt Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BA','San Francisco International Airport');

INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('BG','Hazrat Shahjalal International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Dallas/Fort Worth International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','John F. Kennedy International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Tampa International Airport');
INSERT INTO CONTAINS (AIRLINEID, AP_NAME) VALUES('QR','Louisville International Airport');

CREATE TABLE FLIGHT
(FLIGHT_CODE VARCHAR(10) NOT NULL,
SOURCE VARCHAR(3),
DESTINATION VARCHAR(3),
ARRIVAL VARCHAR2(10),
DEPARTURE VARCHAR2(10),
STATUS VARCHAR(10),
DURATION VARCHAR2(30),
FLIGHTTYPE VARCHAR(10),
LAYOVER_TIME VARCHAR2(30),
NO_OF_STOPS INT,
AIRLINEID VARCHAR(3),
PRIMARY KEY(FLIGHT_CODE),
FOREIGN KEY(AIRLINEID) REFERENCES AIRLINE(AIRLINEID) ON DELETE CASCADE);


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('AI2014','DAC','DFW','02:10','03:15','On-time','24hr','Connecting',3,1,'AI');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('QR2305','DAC','DFW','13:00','13:55','Delayed','21hr','Non-stop',0,0,'QR');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('EY1234','JFK','TPA','19:20','20:05','On-time','16hrs','Connecting',5,2,'EY');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('LH9876','JFK','DAC','05:50','06:35','On-time','18hrs','Non-stop',0,0,'LH');

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('BA1689','FRA','ZYL','10:20','10:55','On-time','14hrs','Non-stop',0,0,'BA');

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('AA4367','SFO','FRA','18:10','18:55','On-time','21hrs','Non-stop',0,0,'AA');

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('QR1902','DAC','IAH','22:00','22:50','Delayed','28hrs','Non-stop',5,1,'QR');

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('BA3056','DAC','DFW','02:15','02:55','On-time','29hrs','Connecting',3,1,'BA');

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('EK3456','DAC','SFO','18:50','19:40','On-time','30hrs','Non-stop',0,0,'EK');

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('9W2334','IAH','CXB','23:00','13:45','On-time','23hrs','Direct',0,0,'9W');

CREATE TABLE PASSENGER1
(PID INT NOT NULL,
PASSPORTNO VARCHAR(10) NOT NULL,
PRIMARY KEY(PID, PASSPORTNO));

-- Insering values in table: PASSENGER1--
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(1,'A1234568');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(2,'B9876541');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(3,'C2345698');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(4,'D1002004');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(5,'X9324666');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(6,'B8765430');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(7,'J9801235');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(8,'A1122334');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(9,'Q1243567');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(10,'S1243269');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(11,'E3277889');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(12,'K3212322');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(13,'P3452390');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(14,'W7543336');
INSERT INTO PASSENGER1(PID, PASSPORTNO) VALUES(15,'R8990566');

CREATE TABLE PASSENGER2
(PASSPORTNO VARCHAR(10) NOT NULL,
FNAME VARCHAR2(20),
M VARCHAR(1),
LNAME VARCHAR2(20),
ADDRESS VARCHAR2(100),
PHONE INT,
AGE INT,
SEX VARCHAR(1),
PRIMARY KEY(PASSPORTNO));

--iNSERTING VALUES IN TABLE: PASSENGER2--
INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('A1234568','GOLAM','M','RABBANI','West Raja Bazar Tejgon, Dhaka 1215',8801723910526,22,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('B9876541','ZANNATUL','FERDOUS','MOU','W MALIBAGH, DHAKA 1205',8801632564343,21,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('C2345698','FARHANA','A','AFRIN','WEST RAJA BAZAR TEJGON, DHAKA 1215',880182267280,30,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('D1002004','SHIMUL','S','PARVEZ','NEW ELEPHANT ROAD, DHAKA 1205',880180367266,23,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('X9324666','RASHID','B','ARIF','SHAHBAGH, DHAKA 1206, BANGLADESH',8801704360125,28,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('B8765430','ERINA','P','KABIR','SHAMOLI BANGLA RESORT,DHAKA 1207,BANGLADESH',8801666190505,30,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('J9801235','TAZEEN','D','EHSAN','SHUKRABAD,DHANMONDI,DHAKA,BANGLADESH',880180369290,29,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('A1122334','SHUBORNA','S','PAOUL','WEST RAJA BAZAR TEJGON, DHAKA 1215',880194335126,25,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('Q1243567','MEHEDI','M','HASAN','WEST RAJA BAZAR TEJGON, DHAKA 1215',8801727626643,22,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('S1243269','MOSIUR','A','WEST RAJA BAZAR TEJGON, DHAKA 1215',8801504568903,60,'M');


INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('E3277889','MAHMUDUL','A','HASAN','WEST RAJA BAZAR TEJGON, DHAKA 1215',9724569986,10,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('K3212322','ROBIN','B','ISLAM','WEST RAJA BAZAR TEJGON, DHAKA 1215',9024569226,15,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('P3452390','RUBEL','V','HOSEN','W MALIBAGH, DHAKA 1205',9734567800,10,'M');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('W7543336','KANIZ','P','FATEMA','W MALIBAGH, DHAKA 1205',4624569986,55,'F');

INSERT INTO PASSENGER2(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('R8990566','AVRO','T','HASAN','MIRPUR 10, DHAKA 1205',4724512343,10,'M');

CREATE TABLE PASSENGER3
(PID INT NOT NULL,
FLIGHT_CODE VARCHAR(10),
PRIMARY KEY(PID),
FOREIGN KEY(FLIGHT_CODE) REFERENCES FLIGHT(FLIGHT_CODE) ON DELETE CASCADE);

-- INSERTING VALUES INTO TABLE: PASSENGER3--

INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(1,'BG2014');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(2,'LH9876');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(3,'9W2334');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(4,'QR1902');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(5,'EY1234');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(6,'BA3056');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(7,'9W2334');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(8,'AA4367');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(9,'QR1902');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(10,'EK3456');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(11,'BA1689');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(12,'QR1902');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(13,'BG2014');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(14,'BA1689');
INSERT INTO PASSENGER3(PID, FLIGHT_CODE) VALUES(15,'QR2305');



CREATE TABLE EMPLOYEE1
(SSN INT NOT NULL,
FNAME VARCHAR2(20),
M VARCHAR(1),
LNAME VARCHAR2(20),
ADDRESS VARCHAR2(100),
PHONE INT,
AGE INT,
SEX VARCHAR(1),
JOBTYPE VARCHAR2(30),
ASTYPE VARCHAR2(30),
ETYPE VARCHAR2(30),
SHIFT VARCHAR2(20),
POSITION VARCHAR2(30),
AP_NAME VARCHAR2(100),
PRIMARY KEY(SSN),
FOREIGN KEY(AP_NAME) REFERENCES AIRPORT(AP_NAME) ON DELETE CASCADE);

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(123456789,'LINDA','M','GOODMAN','731 Fondren, Houston, TX',4356789345, 35, 'F','ADMINISTRATIVE SUPPORT','RECEPTIONIST','','','','Louisville International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(333445555,'JOHNY','N','PAUL','638 Voss, Houston, TX',9834561995, 40, 'M','ADMINISTRATIVE SUPPORT','SECRETARY','','','','Louisville International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(999887777,'JAMES','P','BOND','3321 Castle, Spring, TX',9834666995, 50, 'M','ENGINEER','','RADIO ENGINEER','','','Louisville International Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(987654321,'SHERLOCK','A','HOLMES','123 TOP HILL, SAN Francisco,CA',8089654321, 47, 'M','TRAFFIC MONITOR','','','DAY','','San Francisco International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(666884444,'SHELDON','A','COOPER','345 CHERRY PARK, HESSE,GERMANY',1254678903, 55, 'M','TRAFFIC MONITOR','','NIGHT','','','Frankfurt Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(453453453,'RAKIBUL','B','ISLAM','COXS BAZAR, COXS BAZAR,BANGLADESH',4326789031, 35, 'M','AIRPORT AUTHORITY','','','','MANAGER','Coxs Bazar International Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(987987987,'NIKITA','C','PAUL','110 SYNERGY PARK, DALLAS,TX',5678904325, 33, 'F','ENGINEER','','AIRPORT CIVIL ENGINEER','','','Dallas/Fort Worth International Airport');


INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(888665555,'IMTIAJ','R','ALNAFIS','SYLHET, SYLHET, Bangladesh',8566778890, 39, 'M','ADMINISTRATIVE SUPPORT','DATA ENTRY WORKER','','','','Osmani International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(125478909,'PRATIK','T','GOMES','334 VITRUVIAN PARK, ALBANY, NY',4444678903, 56, 'M','TRAFFIC MONITOR','','DAY','','','John F. Kennedy International Airport');

INSERT INTO EMPLOYEE1(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AP_NAME)
VALUES(324567897,'ASADUL','P','ISLAM','Dhaka, Bangladesh',2244658909, 36, 'M','TRAFFIC MONITOR','','DAY','','','Hazrat Shahjalal International Airport');


CREATE TABLE EMPLOYEE2
(JOBTYPE VARCHAR2(30) NOT NULL,
SALARY INT,
PRIMARY KEY(JOBTYPE));

--INSERTING VALUES INTO TABLE: EMPLOYEE2--
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('ADMINISTRATIVE SUPPORT',50000);
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('ENGINEER',70000);
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('TRAFFIC MONITOR',80000);
INSERT INTO EMPLOYEE2(JOBTYPE, SALARY)VALUES('AIRPORT AUTHORITY',90000);


CREATE TABLE SERVES
(SSN INT NOT NULL,
PID INT NOT NULL,
PASSPORTNO VARCHAR(10) NOT NULL,
PRIMARY KEY(SSN, PID, PASSPORTNO),
FOREIGN KEY(SSN) REFERENCES EMPLOYEE1(SSN) ON DELETE CASCADE,
FOREIGN KEY(PID, PASSPORTNO) REFERENCES PASSENGER1(PID, PASSPORTNO) ON DELETE CASCADE);

-- INSERTING VALUES INTO TABLE: SERVES--
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,1,'A1234568');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,15,'R8990566');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,9,'Q1243567');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,4,'D1002004');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,13,'P3452390');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(333445555,10,'S1243269');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(333445555,12,'K3212322');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,12,'K3212322');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,7,'J9801235');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,7,'J9801235');

CREATE TABLE TICKET1
(TICKET_NUMBER INT NOT NULL,
SOURCE VARCHAR(3),
DESTINATION VARCHAR(3),
DATE_OF_BOOKING DATE,
DATE_OF_TRAVEL DATE,
SEATNO VARCHAR(5),
CLASS VARCHAR2(15),
DATE_OF_CANCELLATION DATE,
PID INT,
PASSPORTNO VARCHAR(10),
FOREIGN KEY(PID, PASSPORTNO) REFERENCES PASSENGER1(PID, PASSPORTNO) ON DELETE CASCADE);

--INSERTING INTO TABLE: TICKET1--
INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(0011234111122,'DAC','DFW','11-MAY-19','','15-DEC-19','32A','ECONOMY',1,'A1234568');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(0984567222299,'JFK','DAC','11-JUN-19','10-DEC-19','20-DEC-19','45D','ECONOMY',2,'B9876541');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1768901333273,'IAH','ZYL','21-AUG-19','','25-DEC-19','1A','BUSINESS',3,'C2345698');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(5890987441464,'IXC','IAH','10-AUG-19','','12-JAN-19','20C','FIRST-CLASS',4,'D1002004');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1577654664266,'JFK','TPA','13-JUN-19','','10-DEC-19','54E','ECONOMY',5,'X9324666');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(2206543545545,'DAC','DFW','11-NOV-19','','12-FEB-20','43B','ECONOMY',6,'B8765430');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(7064321779737,'IAH','CXB','15-NOV-19','','25-DEC-19','27B','FIRST-CLASS',7,'J9801235');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1571357215116,'SFO','FRA','15-OCT-19','','18-DEC-19','34E','ECONOMY',8,'A1122334');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1570864987655,'CXB','IAH','12-NOV-19','','30-DEC-19','54C','ECONOMY',9,'Q1243567');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1579283997799,'DAC','SFO','22-JAN-19','','15-DEC-19','38A','ECONOMY',10,'S1243269');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1255701876107,'FRA','ZYL','19-OCT-19','','31-DEC-19','57F','ECONOMY',11,'E3277889');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1251334499699,'CXB','IAH','20-NOV-19','','12-JAN-20','45D','ECONOMY',12,'K3212322');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1258776199490,'DAC','DFW','13-MAY-19','25-MAY-19','15-DEC-19','37C','ECONOMY',13,'P3452390');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(5891155114477,'FRA','ZYL','26-JUN-19','','23-DEC-19','55C','ECONOMY',14,'W7543336');

INSERT INTO TICKET1(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(5893069766787,'DAC','DFW','11-AUG-19','','22-DEC-19','33F','ECONOMY',15,'R8990566');


CREATE TABLE TICKET2
(DATE_OF_BOOKING DATE NOT NULL,
SOURCE VARCHAR(3) NOT NULL,
DESTINATION VARCHAR(3) NOT NULL,
CLASS VARCHAR2(15) NOT NULL,
PRICE INT,
PRIMARY KEY(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS));

-- INSERTING VALUES INTO TICKET2--
INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-MAY-19','DAC','DFW','ECONOMY',95000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-JUN-19','JFK','DAC','ECONOMY',100000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('21-AUG-19','IAH','CXB','BUSINESS',200000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('10-AUG-19','CXB','IAH','FIRST-CLASS',150000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('13-JUN-19','JFK','TPA','ECONOMY',98000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-NOV-19','DAC','DFW','ECONOMY',125000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('15-NOV-19','IAH','ZYL','FIRST-CLASS',195000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('15-OCT-19','SFO','FRA','ECONOMY',170000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('12-NOV-19','CXB','IAH','ECONOMY',140000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('22-JAN-19','DAC','SFO','ECONOMY',45000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('19-OCT-19','FRA','ZYL','ECONOMY',100000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('20-NOV-19','CXB','IAH','ECONOMY',120000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('13-MAY-19','DAC','DFW','ECONOMY',65000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('26-JUN-19','FRA','ZYL','ECONOMY',80000);

INSERT INTO TICKET2(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-AUG-19','DAC','DFW','ECONOMY',98000);

CREATE TABLE TICKET3
(DATE_OF_CANCELLATION DATE NOT NULL,
SURCHARGE INT,
PRIMARY KEY(DATE_OF_CANCELLATION));

-- INSERTING VALUES INTO TABLE: TICKET3--

INSERT INTO TICKET3(DATE_OF_CANCELLATION, SURCHARGE) VALUES('10-DEC-16',75000);
INSERT INTO TICKET3(DATE_OF_CANCELLATION, SURCHARGE) VALUES('25-MAY-16',25000);

-- Stored Procedure for Details of economy class passengers with destination DFW'--
CREATE OR REPLACE PROCEDURE DFWECONOMYPASSENGERS AS 
CURSOR ECOPASSDETAILS is
select al.AL_NAME,fl.FLIGHT_CODE,p2.FNAME,p2.LNAME,p2.PASSPORTNO,t.CLASS,t.DATE_OF_TRAVEL,t.DESTINATION,t.SOURCE,t.SEATNO,t.TICKET_NUMBER from Airline al,Flight fl,PASSENGER1 p1,PASSENGER2 p2 ,PASSENGER3 p3,TICKET1 t
where al.AIRLINEID = fl.AIRLINEID
and  p1.PID= p3.PID
and  p1.PASSPORTNO =p2.PASSPORTNO
and fl.FLIGHT_CODE = p3.FLIGHT_CODE
and t.PASSPORTNO = p2.PASSPORTNO
and t.CLASS='ECONOMY' and t.DESTINATION='DFW';
 
PASSDETAILS ECOPASSDETAILS%rowtype;
 
BEGIN
 
Open ECOPASSDETAILS ;
   LOOP
    fetch ECOPASSDETAILS into PASSDETAILS;
     EXIT WHEN ECOPASSDETAILS%NOTFOUND;
   dbms_output.put_line (PASSDETAILS.AL_NAME || '  ' || PASSDETAILS.FLIGHT_CODE || '  ' || PASSDETAILS.FNAME || '  ' || PASSDETAILS.LNAME|| '  ' ||PASSDETAILS.PASSPORTNO || '  ' || PASSDETAILS.CLASS || '  ' || PASSDETAILS.SOURCE || '  ' || PASSDETAILS.SEATNO || '  ' || PASSDETAILS.TICKET_NUMBER);
   
    END LOOP;
     close ECOPASSDETAILS;
 END DFWECONOMYPASSENGERS;
 
 --Testing in sql developer: Oracle db--
 SET SERVEROUTPUT ON
 exec DFWECONOMYPASSENGERS();

-- Stored Procedure for flight details by status --
CREATE OR REPLACE PROCEDURE FLIGHTSBYSTATUS 
(
  IN_STATUS IN VARCHAR2
) AS 
 
CURSOR fSTATUS is
select  distinct f.FLIGHT_CODE ,al.AL_NAME ,f.ARRIVAL,f.departure,f.SOURCE,f.DESTINATION,f.STATUS,f.FLIGHTTYPE from Airline al ,Airport ap,flight f
where al.AIRLINEID=f.AIRLINEID
and  f.STATUS =IN_STATUS;
 
FlightStatus fSTATUS%rowtype;
  
BEGIN
  Open fSTATUS ;
   LOOP
    fetch fSTATUS into FlightStatus;
     EXIT WHEN fSTATUS%NOTFOUND;
   dbms_output.put_line (FlightStatus.FLIGHT_CODE || '  ' || FlightStatus.AL_NAME || '  ' || FlightStatus.ARRIVAL || '  ' || FlightStatus.departure|| '  ' ||FlightStatus.Source || '  ' || FlightStatus.DESTINATION || '  ' || FlightStatus.STATUS || '  ' || FlightStatus.FLIGHTTYPE);
   
    END LOOP;
     close fSTATUS;
END FLIGHTSBYSTATUS;
 
 --Testing in sql developer: Oracle db--
SET SERVEROUTPUT ON 
exec FLIGHTSBYSTATUS('Delayed');
-- or--
SET SERVEROUTPUT ON 
exec FLIGHTSBYSTATUS('On-time');
 

-- Trigger, when flight is delayed it is logged into different table--

CREATE OR REPLACE TRIGGER DELAYEDFLIGHTS 
AFTER INSERT ON FLIGHT 
FOR EACH ROW 
DECLARE

BEGIN
    if updating('STATUS')
    then
       insert into delayed_flights (FLIGHT_CODE, SOURCE, DESTINATION , AIRLINEID ,report_time) values(:new.flight_code,:new.source,:new.destination,:new.airlineid,sysdate);
end if;
 
END;

-- This is audit table for this trigger--
 CREATE TABLE "DELAYED_FLIGHTS" 
   (           "FLIGHT_CODE" VARCHAR2(20 BYTE), 
                "DESTINATION" VARCHAR2(20 BYTE), 
                "SOURCE" VARCHAR2(20 BYTE), 
                "AIRLINEID" VARCHAR2(20 BYTE), 
                "REPORT_TIME" DATE
   );
 

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('AI127','DAC','DFW','02:10','03:15','Delayed','24hr','Connecting',3,1,'AI');



--TRIGGER TO UPDATE SALARY OF AN EMPLOYEE DEPENDING ON JOBTYPE--

CREATE OR REPLACE TRIGGER UPDATEDSalary AFTER
  INSERT OR
  UPDATE OF SALARY ON EMPLOYEE2
  FOR EACH ROW;
DECLARE 
JOBTYPE EMPLOYEE2.JOBTYPE%TYPE
BEGIN
  CASE
    WHEN (JOBTYPE= 'Administrative Support') THEN
      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.10;
    WHEN (JOBTYPE= 'ENGINEER') THEN
      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.05;
    WHEN (JOBTYPE= 'TRAFFIC MONITOR') THEN
      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.25;
    WHEN (JOBTYPE= 'AIRPORT AUTHORITY') THEN
      UPDATE EMPLOYEE2 SET SALARY=SALARY+SALARY*.45;
  END CASE; 
END;


-- TRIGGER TO UPDATE 'TICKET_PRICE_HISTORY' TABLE WHEN THE PRICE OF AN AIR TICKET IS UPDATED IN TICKET2 TABLE--

-- CREATING TABLE TICKET_PRICE_HISTORY--

CREATE TABLE TICKET_PRICE_HISTORY
(DATE_OF_BOOKING DATE NOT NULL,
SOURCE VARCHAR(3) NOT NULL,
DESTINATION VARCHAR(3) NOT NULL,
CLASS VARCHAR2(15) NOT NULL,
PRICE INT,
PRIMARY KEY(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS));

-- CREATE A TRIGGER TICKET_PRICE_HISTORY --

CREATE OR REPLACE TRIGGER TICKET_PRICE_HISTORY
BEFORE UPDATE OF PRICE
ON TICKET2
FOR EACH ROW

BEGIN
INSERT INTO TICKET_PRICE_HISTORY 
VALUES(:OLD.DATE_OF_BOOKING, :OLD.SOURCE, :OLD:DESTINATION, :OLD.CLASS, :OLD.PRICE);

END;

--LET'S UPDATE A PRICE OR FARE OF AN AIR TICKET --

UPDATE TICKET2
SET PRICE=150000
WHERE DATE_OF_BOOKING ='24-MAR-19'
AND SOURCE='DAC'
AND DESTINATION='DFW'
AND CLASS='ECONOMY'

