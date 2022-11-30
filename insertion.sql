PURGE RECYCLEBIN;
/SET SERVEROUTPUT ON;/
declare
    is_true number;
begin
    select count(*) 
    INTO IS_TRUE
    from user_tables where table_name='STATE';
    IF IS_TRUE > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE STATE';
    END IF;
END;
/
declare
    is_true number;
begin
    select count(*) 
    INTO IS_TRUE
    from user_tables where table_name='PARTY';
    IF IS_TRUE > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE PARTY';
    END IF;
END;
/

declare
    is_true number;
begin
    select count(*) 
    INTO IS_TRUE
    from user_tables where table_name='CONSTITUENCY';
    IF IS_TRUE > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE CONSTITUENCY';
    END IF;
END;
/
declare
    is_true number;
begin
    select count(*) 
    INTO IS_TRUE
    from user_tables where table_name='PEOPLE';
    IF IS_TRUE > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE PEOPLE';
    END IF;
END;
/



CREATE TABLE STATE(
STATE_ID INT NOT NULL PRIMARY KEY, 
STATE_NAME VARCHAR(255) UNIQUE NOT NULL ); 

CREATE TABLE PARTY(
PARTY_ID INT NOT NULL PRIMARY KEY, 
PARTY_NAME VARCHAR(255) UNIQUE NOT NULL , 
PARTY_ADDRESS VARCHAR(255) UNIQUE NOT NULL, 
CONTACT_NUMBER VARCHAR(255) UNIQUE NOT NULL, 
EMAIL VARCHAR(255) UNIQUE NOT NULL); 


CREATE TABLE CONSTITUENCY(
CONSTITUENCY_ID INT NOT NULL PRIMARY KEY, 
CONSTITUENCY_NAME VARCHAR(255) UNIQUE NOT NULL, 
STATE_ID REFERENCES STATE(STATE_ID)); 

CREATE TABLE PEOPLE(
U_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR2(255) NOT NULL, 
LAST_NAME VARCHAR2(50) NOT NULL, 
AGE INT NOT NULL, 
DOB DATE NOT NULL, 
ADDRESS VARCHAR2(255) NOT NULL, 
CONTACT_NUMBER VARCHAR2(255) NOT NULL, 
EMAIL VARCHAR2(255) NOT NULL, 
CRIMINAL_RECORD VARCHAR(255), 
CONSTITUENCY_ID  REFERENCES CONSTITUENCY(CONSTITUENCY_ID),
PARENT_NAME VARCHAR2(255) NOT NULL, 
GENDER VARCHAR(20) NOT NULL
); 




--> Data Insertion

Insert into STATE Values(1,'TELANGANA')	;
Insert into STATE Values(2,'MAHARASTRA');

Insert into PARTY values(1,'SHIVSENA','MUMBAI','1234567890','SENA@SENA.COM');
Insert into PARTY values(2,'BJP','AMBEBAD','2345678910','BJP@BJP.COM');
Insert into PARTY values(3,'CONGRESS','DELHI','2835678901','CNG@CNG.COM');

Insert into CONSTITUENCY values(1,'HYDERABAD',1);
Insert into CONSTITUENCY values(2,'MUMBAI',2);
Insert into CONSTITUENCY values(3,'NASHIK',2);
Insert into CONSTITUENCY values(4,'KHAMMAM',1);



Insert into PEOPLE Values (1,'Ram','Raja',39,'10-Jun-1983','SECUNDERABAD','1234567890','ram@gmail.com',NULL,1,'GANDHI','M');
Insert into PEOPLE Values (2,'Abhishek','Mehta',27,'	16-May-1995	','DADAR','9984737642','abhi@gmail.com',NULL,2,'MANAV','F');
Insert into PEOPLE Values (3,'Mayank','Kumar',22,'	20-Jul-2000	','BHADRACHALAM','9845673892','maya@gmail.com',NULL,4,'ADITYA','F');
Insert into PEOPLE Values (4,'Shahzad','Gupta',27,'	27-Dec-1994	','DADAR','9984638573','shahzad@gmail.com',NULL,2,'LAKSHMAN','F');
Insert into PEOPLE Values (5,'Nishi','Hussain',56,'	7-Jun-1966	','ILLENDU','9384672946','nishi@gmail.com',NULL,4,'NEIL','F');
Insert into PEOPLE Values (6,'Shreya','Verma',25,'	30-Jan-1997	','BANJARAHILLS','8493846578','shreya@gmail.com','Traffic violation',1,'Suresh','F');
Insert into PEOPLE Values (7,'Manoj','Joshi',51,'	20-May-1971	','SHASTRINAGAR','9847367236','manoj@gmail.com',NULL,3,'Manoj','M');
Insert into PEOPLE Values (8,'Harshit','Maurya',28,'	13-Sep-1994	','DADAR','9856374567','harshit@gmail.com',NULL,2,'Ali','M');
Insert into PEOPLE Values (9,'Geeta','Tanwar',41,'	8-Sep-1981	','ILLENDU','9867426350','geeta@gmail.com',NULL,4,'Balkrishna','F');
Insert into PEOPLE Values (10,'Dharmender','Negi',57,'	26-May-1965	','TARNAKA','9785047832','dharmender@gmail.com',NULL,1,'Ganesh','M');
Insert into PEOPLE Values (11,'Nitin ','Singh',19,'	5-Jul-2003	','SHASTRINAGAR','9845678302','nitin @gmail.com',NULL,3,'Sudhir','M');
Insert into PEOPLE Values (12,'Saurabh ','Kumar',38,'	25-May-1984	','BHADRACHALAM','7689403280','saurabh @gmail.com',NULL,4,'Gopal','M');
Insert into PEOPLE Values (13,'Soniya ','Singh',52,'	10-Feb-1970	','JUHU','7589302792','soniya @gmail.com',NULL,2,'Rahul','F');
Insert into PEOPLE Values (14,'Shubham','Verma',46,'	23-Jun-1976	','SECUNDERABAD','8573902347','shubham@gmail.com',NULL,1,'Nitin','M');
Insert into PEOPLE Values (15,'Shrushti','Shah',30,'	26-Feb-1992	','SHASTRINAGAR','9473028473','shrushti@gmail.com',NULL,3,'Vinod','F');
Insert into PEOPLE Values (16,'Rahul','Dayani',46,'	9-Apr-1976	','SHASTRINAGAR','8679302856','rahul@gmail.com',NULL,3,'Subhash','M');
Insert into PEOPLE Values (17,'Geeta','Mehta',50,'	24-Feb-1972	','JUHU','6578490375','geeta@gmail.com',NULL,2,'Pramod','F');
Insert into PEOPLE Values (18,'Narayan ','Ram',16,'	1-Jun-2006	','BANJARAHILLS','6578490346','narayan @gmail.com','Robbery',1,'Praful','M');
Insert into PEOPLE Values (19,'Seeta','Mahesh',33,'	14-Jun-1989	','BHUMNAGAR','7586904756','seeta@gmail.com',NULL,3,'Pankaj','F');
Insert into PEOPLE Values (20,'Meena','Maurya',41,'	13-Mar-1981	','DADAR','7586904756','meena@gmail.com',NULL,2,'Tarak','F');
Insert into PEOPLE Values (21,'Geeta','Suresh',16,'	31-May-2006	','BHADRACHALAM','9856749037','geeta@gmail.com',NULL,4,'Mahesh','F');
Insert into PEOPLE Values (22,'Mahesh','Rai',60,'	11-Jan-1962	','BANJARAHILLS','7589409679','mahesh@gmail.com','Murder',1,'Suresh','M');
Insert into PEOPLE Values (23,'Gautam','Singh',23,'	3-Mar-1999	','JUHU','9780486950','gautam@gmail.com',NULL,2,'Manoj','M');
Insert into PEOPLE Values (24,'Rohit','Saraf',53,'	26-May-1969	','DADAR','8697047568','rohit@gmail.com',NULL,2,'Kuldeep','M');
Insert into PEOPLE Values (25,'Maan','Singh',24,'	24-Nov-1997	','BHADRACHALAM','8675904756','maan@gmail.com',NULL,4,'Manav','M');
Insert into PEOPLE Values (26,'Shyam','Dev',32,'	8-Jun-1990	','SHASTRINAGAR','8697856470','shyam@gmail.com','Property Scam',3,'Rahul','M');
Insert into PEOPLE Values (27,'Rahul','Verma',39,'	2-Mar-1983	','BANJARAHILLS','9678595940','rahul@gmail.com',NULL,1,'Jagdish','M');
Insert into PEOPLE Values (28,'Kuldeep','Haran',33,'	24-Mar-1989	','BHUMNAGAR','8697056749','kuldeep@gmail.com','Robbery',3,'Sanket','M');
Insert into PEOPLE Values (29,'Mansi','Shenoy',49,'	12-Jan-1973	','BHADRACHALAM','8697056789','mansi@gmail.com',NULL,4,'Ram','F');
Insert into PEOPLE Values (30,'Saurabh ','Jagtap',26,'	6-Apr-1996	','TARNAKA','9780576890','saurabh @gmail.com',NULL,1,'Anand','M');
Insert into PEOPLE Values (31,'Pravin ','Nadar',26,'	9-Jan-1996	','TARNAKA','9780579499','pravin @gmail.com',NULL,1,'Subhash','M');
Insert into PEOPLE Values (32,'Mohit','Shah',58,'	11-Nov-1964	','SECUNDERABAD','8697950496','mohit@gmail.com',NULL,1,'Naman','M');
Insert into PEOPLE Values (33,'Rameen','Tungekar',26,'	25-Jun-1996	','ILLENDU','6769505055','rameen@gmail.com',NULL,4,'Laksh','F');
Insert into PEOPLE Values (34,'Rashi','Raut',37,'	31-Aug-1985	','DADAR','9786058568','rashi@gmail.com','Property Scam',2,'Vinit','F');
Insert into PEOPLE Values (35,'Naman','Jain',26,'	10-Aug-1996	','SECUNDERABAD','9687056789','naman@gmail.com',NULL,1,'Mohit','M');
Insert into PEOPLE Values (36,'Rahul','Tejwani',52,'	8-Feb-1970	','DADAR','9586790576','rahul@gmail.com',NULL,2,'Shekhar','M');
Insert into PEOPLE Values (37,'Vrushali','Menthe',51,'	10-Jul-1971	','ILLENDU','9780567890','vrushali@gmail.com',NULL,4,'Sushant','F');
Insert into PEOPLE Values (38,'Monalika','Pradhan',30,'	7-Aug-1992	','SECUNDERABAD','8675048575','monalika@gmail.com',NULL,1,'Shreyas','F');
Insert into PEOPLE Values (39,'Krishna','Jha',57,'	24-Aug-1965	','JUHU','6774576855','krishna@gmail.com','Traffic violation',2,'Shahrukh','M');
Insert into PEOPLE Values (40,'Akhilesh','Dongre',29,'	12-Feb-1993	','BHADRACHALAM','9596878686','akhilesh@gmail.com',NULL,4,'Salman','M');
Insert into PEOPLE Values (41,'Ujjwal','Singh',35,'	27-Aug-1987	','ILLENDU','8687548586','ujjwal@gmail.com',NULL,4,'Meet','M');
Insert into PEOPLE Values (42,'Manisha','Karki',36,'	29-May-1986	','SECUNDERABAD','7547586689','manisha@gmail.com',NULL,1,'Hemant','F');
Insert into PEOPLE Values (43,'Samradni','Pathari',39,'	14-Sep-1983	','BHADRACHALAM','7548758689','samradni@gmail.com',NULL,4,'Vinod','F');
Insert into PEOPLE Values (44,'Aishwarya','Adduri',23,'	7-Aug-1999	','TARNAKA','7568594090','aishwarya@gmail.com',NULL,1,'Manit','F');
Insert into PEOPLE Values (45,'Jyothi','Rao',45,'	8-Nov-1977	','MANIKONDA','9785684347','jyothi@gmail.com','Mugging',4,'Manik','F');
Insert into PEOPLE Values (46,'Chakradhar','Grandhi',29,'	31-Jan-1993	','JUHU','9785685968','chakradhar@gmail.com',NULL,2,'Abhijit','M');
Insert into PEOPLE Values (47,'Shubham','Idekar',49,'	16-Aug-1973	','ILLENDU','9786596586','shubham@gmail.com',NULL,4,'Rao','M');
Insert into PEOPLE Values (48,'Praful','Mehta',21,'	1-Feb-2001	','BANJARAHILLS','8796955759','praful@gmail.com',NULL,1,'Sumit','M');
Insert into PEOPLE Values (49,'Shruti','Singh',52,'	21-Jul-1970	','JUHU','7667675894','shruti@gmail.com',NULL,2,'Ramesh','F');
Insert into PEOPLE Values (50,'Surekha','Lokhande',18,'	20-Sep-2004	','ILLENDU','8796869696','surekha@gmail.com','Mugging',4,'Meghdut','F');
Insert into PEOPLE Values (51,'Ankita','Guzar',19,'	15-Feb-2003	','TARNAKA','7886876896','ankita@gmail.com',NULL,1,'Ramnath','F');
Insert into PEOPLE Values (52,'Tanvi','Apte',46,'	10-Dec-1975	','SECUNDERABAD','7976776585','tanvi@gmail.com',NULL,1,'Nikhil','F');
Insert into PEOPLE Values (53,'Nikhil','Shinde',38,'	15-Jun-1984	','BANJARAHILLS','9787686585','nikhil@gmail.com',NULL,1,'Manas','M');
Insert into PEOPLE Values (54,'Shreyas','Pradhan',25,'	4-Aug-1997	','ILLENDU','9768767788','shreyas@gmail.com',NULL,4,'Karan','M');
Insert into PEOPLE Values (55,'Sanket','Mahajan',33,'	24-Jul-1989	','TARNAKA','9687896588','sanket@gmail.com','Traffic Violation',1,'Kartik','M');
Insert into PEOPLE Values (56,'Arun','Gharat',46,'	8-Jun-1976	','BHUMNAGAR','8675669888','arun@gmail.com',NULL,3,'Vishwanath','M');
Insert into PEOPLE Values (57,'Krupa','Shah',57,'	30-Jul-1965	','BHADRACHALAM','9786879869','krupa@gmail.com',NULL,4,'Bhairav','F');
Insert into PEOPLE Values (58,'Fenil','Jain',56,'	9-Feb-1966	','TARNAKA','6778978978','fenil@gmail.com',NULL,1,'Shyam','M');
Insert into PEOPLE Values (59,'Ketaki','Pathak',56,'	6-Jun-1966	','ILLENDU','8968679787','ketaki@gmail.com',null,4,'Nakul','F');


