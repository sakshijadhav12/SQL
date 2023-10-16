use DB;
create table StudentsInfo
(
RollNo int primary key ,
FName varchar(50),
Lname varchar (50),
PhoneNo Bigint);
Insert INTO StudentsInfo(RollNo,FName ,LName,PhoneNo)
values(1,'Ross','geller',8669592970),
(2,'joey','tribbiani',7878784545),
(3,'reachel','green',343434342567),
(4,'john','paul',5656565656),
(5,'paxton','yoshida',4545676787),
(6,'shriti','jadhav',7878787878);
select * from StudentsInfo;
create table courseInfo
(RollNo int,
courseId int ,
marks int);
insert into courseInfo(RollNo,courseId,marks)
values(1,101,88),
(2,102,78),
(3,103,67),
(4,104,99),
(5,105,79);
select * From courseInfo;
-- inner join
select StudentsInfo.RollNo,
 FName,
 LName,
 CourseId,
 marks
 from StudentsInfo
 Inner join courseInfo on StudentsInfo.RollNo = courseInfo.RollNo;
 -- Left join
SELECT StudentsInfo.RollNo,FName,courseId
FROM StudentsInfo
LEFT JOIN courseInfo ON StudentsInfo.RollNo = courseInfo.RollNo;
select courseInfo.RollNo ,courseId ,FName ,LName
FROM courseInfo
LEFT JOIN StudentsInfo on courseInfo.RollNo =StudentsInfo.RollNo;
SELECT StudentsInfo.RollNo,FName,courseId
FROM StudentsInfo
RIGHT JOIN courseInfo ON StudentsInfo.RollNo = courseInfo.RollNo;
select courseInfo.RollNo ,courseId ,FName ,LName
FROM courseInfo
RIGHT JOIN StudentsInfo on courseInfo.RollNo =StudentsInfo.RollNo;
-- outer join
SELECT StudentsInfo.RollNo, marks,courseId
FROM StudentsInfo
FULL JOIN courseInfo 
ON StudentsInfo.RollNo = courseInfo.RollNo;
SELECT s1.RollNo AS Student1_RollNo,
       s1.FName AS Student1_FName,
       s2.RollNo AS Student2_RollNo,
       s2.FName AS Student2_FName
FROM StudentsInfo s1
JOIN StudentsInfo s2 ON s1.RollNo = s2.RollNo;
SELECT s1.RollNo AS Student1_RollNo,
       s1.FName AS Student1_FName,
       s2.RollNo AS Student2_RollNo,
       s2.FName AS Student2_FName
FROM StudentsInfo s1
JOIN StudentsInfo s2 ON s1.RollNo!= s2.RollNo;
-- cross join
SELECT StudentsInfo.RollNo, StudentsInfo.FName, courseInfo.courseId, courseInfo.marks 
FROM StudentsInfo
CROSS JOIN courseInfo;
--subquery 
select * from courseInfo where marks =(select max(marks) from courseInfo);
select * from courseInfo;
SELECT FName, LName
FROM StudentsInfo
WHERE RollNo IN (SELECT RollNo FROM courseInfo WHERE marks > 80);
UPDATE StudentsInfo
set PhoneNo = 9999999999
where RollNo = 1;
select * from StudentsInfo;
select FName, LName
from StudentsInfo
where RollNo IN (SELECT RollNo from courseInfo Where courseId IN (101, 103));
DELETE FROM courseInfo 
WHERE RollNo IN ( SELECT RollNo  FROM StudentsInfo where FName ='paxton');
 SELECT * FROM StudentsInfo;        
 SELECT * FROM courseInfo;      
 INSERT INTO courseInfo (RollNo, courseId, marks)
SELECT RollNo ,7,30
FROM StudentsInfo;


