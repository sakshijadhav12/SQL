create table demo
(id int,
info varchar(50))
insert into demo(id,info)
values(1,'A'),
(2,'b'),
(3,'s'),
(4,'o'),
(5,'p'),
(6,'a');
select * from demo
BEGIN TRANSACTION;
    SELECT * FROM demo WITH (TABLOCKX);
commit
update demo 
set info ='f' where id= 6;
BEGIN TRANSACTION;
   SELECT * FROM demo  WHERE id > 4;
commit
select
request_session_id,
request_mode,
request_reference_count
from sys.dm_tran_locks
select * from demo where id=4

USE DATA1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;
SELECT * FROM demo;
COMMIT;
select
request_session_id,
request_mode,
request_reference_count
from sys.dm_tran_locks

insert into demo
values(3,'k'),
(8,'u')
begin tran
update demo 
set info='k'
where id=4
COMMIT;

select
request_session_id,
request_mode,
resource_type,
request_reference_count
from sys.dm_tran_locks