gh-ost \
--conf=/etc/gh-ost/gh-ost.cnf \
--max-load=Threads_running=25 \
--critical-load=Threads_running=1000 \
--chunk-size=1000 \
--max-lag-millis=1500 \
--host="192.168.33.12" \
--serve-tcp-port=3333 \
--throttle-control-replicas="192.168.33.12:3306" \
--port=3306 \
--database="test_db" \
--table="tbl1" \
--verbose \
--alter="drop primary key, add primary key(a,c)" \
--switch-to-rbr \
--allow-master-master \
--cut-over=default \
--exact-rowcount \
--concurrent-rowcount \
--default-retries=120 \
--panic-flag-file=/tmp/ghost.panic.flag \
--postpone-cut-over-flag-file=/tmp/ghost.postpone.flag \
--initially-drop-ghost-table \
--initially-drop-old-table \
--execute


gh-ost \
--conf=/etc/gh-ost/gh-ost.cnf \
--max-load=Threads_running=25 \
--critical-load=Threads_running=1000 \
--chunk-size=1000 \
--max-lag-millis=1500 \
--host="192.168.33.12" \
--serve-tcp-port=3333 \
--throttle-control-replicas="192.168.33.12:3306" \
--port=3306 \
--database="test_db" \
--table="tbl1" \
--verbose \
--alter="
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
)
" \
--switch-to-rbr \
--allow-master-master \
--cut-over=default \
--exact-rowcount \
--concurrent-rowcount \
--default-retries=120 \
--panic-flag-file=/tmp/ghost.panic.flag \
--postpone-cut-over-flag-file=/tmp/ghost.postpone.flag \
--initially-drop-ghost-table \
--initially-drop-old-table \
--execute
;

use test_db;

select @@hostname;

show tables;

drop table if exists `_tbl1_gho`;
