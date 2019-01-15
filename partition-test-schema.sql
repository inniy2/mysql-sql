/* from master */
select @@hostname;
drop database if exists test_db;
create database test_db;

use test_db;

create table tbl1(
a int not null auto_increment,
b int not null,
c DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
primary key (a)
)ENGINE=InnoDB;

insert into tbl1 (b) values (1),(1),(1),(1),(1),(1),(1),(1);
insert into tbl1 (b) values (2),(2),(2),(2),(2),(2),(2),(2);
insert into tbl1 (b) values (3),(3),(3),(3),(3),(3),(3),(3);
insert into tbl1 (b) values (4),(4),(4),(4),(4),(4),(4),(4);
insert into tbl1 (b) values (5),(5),(5),(5),(5),(5),(5),(5);
insert into tbl1 (b) values (6),(6),(6),(6),(6),(6),(6),(6);
insert into tbl1 (b) values (7),(7),(7),(7),(7),(7),(7),(7);
insert into tbl1 (b) values (8),(8),(8),(8),(8),(8),(8),(8);
insert into tbl1 (b) values (9),(9),(9),(9),(9),(9),(9),(9);
insert into tbl1 (b) values (10),(10),(10),(10),(10),(10),(10),(10);
insert into tbl1 (b) values (11),(11),(11),(11),(11),(11),(11),(11);
insert into tbl1 (b) values (12),(12),(12),(12),(12),(12),(12),(12);

update tbl1 set c ='2019-01-14 00:00:00' where b = 1;
update tbl1 set c ='2019-02-14 00:00:00' where b = 2;
update tbl1 set c ='2019-03-14 00:00:00' where b = 3;
update tbl1 set c ='2019-04-14 00:00:00' where b = 4;
update tbl1 set c ='2019-05-14 00:00:00' where b = 5;
update tbl1 set c ='2019-06-14 00:00:00' where b = 6;
update tbl1 set c ='2019-07-14 00:00:00' where b = 7;
update tbl1 set c ='2019-08-14 00:00:00' where b = 8;
update tbl1 set c ='2019-09-14 00:00:00' where b = 9;
update tbl1 set c ='2019-10-14 00:00:00' where b = 10;
update tbl1 set c ='2019-11-14 00:00:00' where b = 11;
update tbl1 set c ='2019-12-14 00:00:00' where b = 12;

select * from tbl1;





/* from slave */
select @@hostname;
use test_db;

set sql_log_bin = 0;

alter table tbl1
drop primary key,
add primary key (a,c);

alter table tbl1
partition by range (to_days(c))
( 
  partition p0 values less than (to_days('2019-01-01 00:00:00')),
  partition p1 values less than (to_days('2019-02-01 00:00:00')),
  partition p2 values less than (to_days('2019-03-01 00:00:00')),
  partition p3 values less than (to_days('2019-04-01 00:00:00')),
  partition p4 values less than (to_days('2019-05-01 00:00:00')),
  partition p5 values less than (to_days('2019-06-01 00:00:00')),
  partition p6 values less than (to_days('2019-07-01 00:00:00')),
  partition p7 values less than (to_days('2019-08-01 00:00:00')),
  partition p8 values less than (to_days('2019-09-01 00:00:00')),
  partition p9 values less than (to_days('2019-10-01 00:00:00')),
  partition p10 values less than (to_days('2019-11-01 00:00:00')),
  partition p11 values less than (to_days('2019-12-01 00:00:00')),
  partition p12 values less than (to_days('2020-01-01 00:00:00')),
  PARTITION p13 VALUES LESS THAN MAXVALUE 
);



/* from master */
insert into tbl1 (b) values (1),(1),(1),(1),(1),(1),(1),(1);
insert into tbl1 (b) values (2),(2),(2),(2),(2),(2),(2),(2);
insert into tbl1 (b) values (4),(4),(4),(4),(4),(4),(4),(4);
insert into tbl1 (b) values (5),(5),(5),(5),(5),(5),(5),(5);
insert into tbl1 (b) values (6),(6),(6),(6),(6),(6),(6),(6);
insert into tbl1 (b) values (7),(7),(7),(7),(7),(7),(7),(7);
insert into tbl1 (b) values (8),(8),(8),(8),(8),(8),(8),(8);
insert into tbl1 (b) values (9),(9),(9),(9),(9),(9),(9),(9);
insert into tbl1 (b) values (10),(10),(10),(10),(10),(10),(10),(10);
insert into tbl1 (b) values (11),(11),(11),(11),(11),(11),(11),(11);
insert into tbl1 (b) values (12),(12),(12),(12),(12),(12),(12),(12);

update tbl1 set c ='2019-01-14 00:00:00' where b = 1;
update tbl1 set c ='2019-02-14 00:00:00' where b = 2;
update tbl1 set c ='2019-03-14 00:00:00' where b = 3;
update tbl1 set c ='2019-04-14 00:00:00' where b = 4;
update tbl1 set c ='2019-05-14 00:00:00' where b = 5;
update tbl1 set c ='2019-06-14 00:00:00' where b = 6;
update tbl1 set c ='2019-07-14 00:00:00' where b = 7;
update tbl1 set c ='2019-08-14 00:00:00' where b = 8;
update tbl1 set c ='2019-09-14 00:00:00' where b = 9;
update tbl1 set c ='2019-10-14 00:00:00' where b = 10;
update tbl1 set c ='2019-11-14 00:00:00' where b = 11;
update tbl1 set c ='2019-12-14 00:00:00' where b = 12;

select * from tbl1;


select count(*)
from tbl1
where b = 1;
