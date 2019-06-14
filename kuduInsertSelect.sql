drop table if exists kudu_as_select;

create table  kudu_as_select 
primary key(code) PARTITION BY HASH(code)  
PARTITIONS 8 STORED AS KUDU  
TBLPROPERTIES ('kudu.master_addresses'='gromit:7051')  

as select code, description, salary  from sample_07;
select * from kudu_as_select where salary > 150000;
update kudu_as_select set salary = 500000  where salary > 150000;

select * from kudu_as_select where salary > 150000;

select count(*) from sample_07 myhdfs, sample_s3a mys3a, sample_07kudu mykudu
where myhdfs.code=mys3a.code 
and mys3a.code=mykudu.code ;

