use db go
-- autocommit transction
select * from person

insert into person(id,FName,LNane,age ,city)
values(5,'sakshi','jadhav',20,'thane');

update person 
 set FName ='rutika',
 LNane='wankhade'
  where id = 34
 
  delete from person where id=23;
  select @@TRANCOUNT
  -- implicit transcation
  SET IMPLICIT_TRANSACTIONS ON
 insert into StudentCourses(StudentID,CourseID,CourseName)
 values(102,111 ,'opertin syste'),
 (304,455,'sql');
 delete from StudentCourses where StudentID = 304 ;

 select @@TRANCOUNT As ot
 commit
  select @@TRANCOUNT As ot
  select * from StudentCourses
  -- explcit transcation
  begin tran
  update StudentCourses
  set courseId=909
  where CourseName ='math'
  select @@TRANCOUNT as transctioncount
  commit 
  select @@TRANCOUNT  as transctioncount
 --savepoint, rollback
 begin tran
insert into StudentCourses(StudentID,CourseID,CourseName)
values(109,333,'sql'),
(123,333,'sql'),
(234,333,'sql'),
(244,333,'sql')
save transaction  insertpoint
delete from StudentCourses where StudentID =234
delete from StudentCourses where StudentID =244
rollback  tran insertpoint
commit
select * from StudentCourses

create proc pro_tran
as
begin 
select * from person 
end;
CREATE PROCEDURE proctr
    @city VARCHAR(50)
AS
BEGIN
begin tran
  
        SELECT * FROM person WHERE city = @city AND age > 20;
  
END;
select @@TRANCOUNT  as transctioncount
commit
select @@TRANCOUNT  as transctioncount
proctr thane

begin tran
pro_tran
EXEC proctr thane
select @@TRANCOUNT as tran_count;

commit 
select @@TRANCOUNT as tran_count;
