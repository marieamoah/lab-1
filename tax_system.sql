CREATE SCHEMA MNEOA04982022;
USE MNEOA04982022;

CREATE TABLE DEPARTMENT(
DepartmentNo SMALLINT NOT NULL,
DName VARCHAR (33),
Tax_typecollected VARCHAR (30),
PRIMARY KEY (DepartmentNo)
);

CREATE TABLE EMPLOYEES(
Employee_ID SMALLINT NOT NULL,
FName VARCHAR(20),
LName VARCHAR(20),
Username VARCHAR(20),
PssWord VARCHAR(15) NOT NULL,
Employeetype CHAR(20) NOT NULL CHECK( Employeetype IN ('TAX COLLECTOR', 'NON-TAX COLLECTOR')),
TaxPayer_Workswith CHAR(40),
Department VARCHAR (33),
Phone_no VARCHAR (15),
Email VARCHAR (40),
Salary decimal(10,0),
DepartmentNo SMALLINT,
PRIMARY KEY(Employee_ID),
FOREIGN KEY (DepartmentNo) references DEPARTMENT(DepartmentNo) ON DELETE CASCADE
);

CREATE TABLE INDIVIDUAL_TaxPayer(
TaxPayer_ID SMALLINT NOT NULL,
fname VARCHAR(20),
lname VARCHAR(20),
UserName VARCHAR(20),
PssWord VARCHAR(15) NOT NULL,
sex CHAR NOT NULL CHECK(sex IN ('M','F')),
location VARCHAR(30),
email VARCHAR(40),
phone_number VARCHAR(15),
DOB DATE NOT NULL,
residence_status VARCHAR(15) NOT NULL CHECK(residence_status IN ('RESIDENT','NON-RESIDENT')),
Employee_ID SMALLINT,
PRIMARY KEY (TaxPayer_ID),
FOREIGN KEY (Employee_ID) references EMPLOYEES (Employee_ID) ON DELETE CASCADE
);

CREATE TABLE COMPANIES(
Company_ID SMALLINT,
Cname VARCHAR(40),
Location VARCHAR (30),
CType VARCHAR (20),
Email VARCHAR (40),
Employee_ID SMALLINT,
PRIMARY KEY (Company_ID),
FOREIGN KEY (Employee_ID) references EMPLOYEES(Employee_ID) ON DELETE CASCADE
);

CREATE TABLE RECORDS(  
PayerName Varchar(40),
AmounttobePaid INT,
Amount_Paid DECIMAL(10,0),
Amount_Owing DECIMAL(10,0)
);

CREATE TABLE RECORDSDEPARTMENT( 
DepartmentNo SMALLINT,
DName VARCHAR (33), 
Date_recorded DATE,
Time_recorded TIME,
FOREIGN KEY (DepartmentNo) references DEPARTMENT(DepartmentNo) ON DELETE CASCADE
);

