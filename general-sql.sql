use mysql;

select @@version;

select user, host, authentication_string from user;

show variables like '%server_id%';

set global server_id = 2;

show variables like '%uuid%';

show variables like '%relay%';

show variables like '%read_only%';

show variables like '%log_slave%';

show variables like '%binlog_format%';

show variables like '%gtid%';

show master status;




