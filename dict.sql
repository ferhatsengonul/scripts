col table_name format  a32
col comments format  a100
select * from dict where table_name like upper('%&1%');