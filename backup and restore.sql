CREATE DATABASE DATA1;
create table table1(
id int,
name varchar(100),
)
insert into table1(id,name)
values(8,'uio'),
(7,'jkl');
select * from table1
BACKUP DATABASE DATA1
TO DISK = 'C:\msdb\DATA1.bak';
BACKUP DATABASE DATA1
TO DISK = 'C:\msdb\DATA2.bak'
with format,
name='full backup',
description=' this is back up file';
drop  database data1;
RESTORE DATABASE DATA1
FROM DISK = 'C:\Backup\DATA2.bak';
---import and export

