/* from master */
select @@hostname;
use mysql;

show grants for 'repl'@'%';

drop user 'repl'@'%';
create user 'repl'@'%' identified by 'repl';
grant REPLICATION SLAVE, replication client on *.* to 'repl'@'%';
flush privileges;

show master status;

show variables like '%gtid%';

SELECT BINLOG_GTID_POS('mysql-bin.000001', 1487);

/* 1-1-8 */

create database test;
drop database test;



/* from slave */
select @@hostname;

use mysql;

set global server_id = 2;

STOP SLAVE;
SET GLOBAL gtid_slave_pos = '1-1-4';

CHANGE MASTER TO 
  MASTER_HOST = '192.168.33.11'
, MASTER_USER = 'repl'
, MASTER_PASSWORD = 'repl'
, MASTER_USE_GTID = slave_pos;

START SLAVE;

show slave status;

