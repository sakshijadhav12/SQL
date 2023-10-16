use studentDb;
create table STUDENT(
Id int,
fname varchar(50),
lname varchar(50),
Address varchar(70)
);
insert into STUDENT
values(101 ,'abc','ghk','badalpur east'),
(102,'sffg','ghj','navi mumbai ');
select * from STUDENT;
ALTER TABLE STUDENT
ALTER COLUMN Id int NOT NULL;
insert into STUDENT
values(null,'abc','ghk','badalpur east');
ALTER TABLE STUDENT 
ALTER COLUMN Id INT PRIMARY KEY;
ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_Id PRIMARY KEY (Id);
insert into STUDENT
values(101,'abc','ghk','badalpur east');
insert into STUDENT
values(103,'abc','ghk','badalpur east');
CREATE TABLE Marks (
    studentid INT NOT NULL,
    english INT,
    science INT,
    maths INT,
    Id INT,
    FOREIGN KEY (Id) REFERENCES STUDENT(Id)
);
INSERT INTO Marks (studentid, english, science, maths)
VALUES (101, 90, 85, 92),
       (102, 88, 91, 89),
       (103, 92, 87, 94);
SELECT * FROM Marks;
SELECT * FROM STUDENT;

ALTER TABLE STUDENT
ADD age INT,
    phoneno INT UNIQUE;
ALTER TABLE STUDENT
ADD age INT,
    phoneno INT ;
UPDATE STUDENT 
SET phoneno = 56565789
WHERE Id =103 ;
ALTER TABLE STUDENT
ADD CONSTRAINT ph_no UNIQUE (phoneno);
ALTER TABLE Marks
ADD CONSTRAINT Ck_english CHECK (english >= 0 AND english <= 100);
UPDATE Marks
Set english= 18
WHERE studentid = 103;

Select * from Marks;
UPDATE Marks
Set english= 108
WHERE studentid = 103;
ALTER TABLE Marks
ADD CONSTRAINT Ck_mats CHECK (maths>= 0 AND maths <= 100);
ALTER TABLE Marks
ADD CONSTRAINT Ck_sci CHECK (science>= 0 AND science <= 100);
UPDATE Marks
Set maths= 108
WHERE studentid = 103;
ALTER table STUDENT
ADD schoolname VARCHAR(100) DEFAULT ('AVM');
SELECT * FROM STUDENT;
UPDATE STUDENT
SET schoolname = 'AVM'
WHERE  schoolname = null;
CREATE UNIQUE INDEX My_inx
ON STUDENT(id,fname);
DELETE FROM STUDENT
WHERE id = 102;