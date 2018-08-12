drop table if exists partitionparquet;

create table partitionparquet  (
myrowid int,
--mymonth int,
--myweekday int,
mydayofyear int,
myonein10k int,
mystring string
)
partitioned by (mymonth int, myweekday int )
stored as parquet


;

insert overwrite partitionparquet (myrowid, mydayofyear, myonein10k, mystring, mymonth, myweekday)
select myrowid, mydayofyear, myonein10k, mystring, mymonth, myweekday from stage;
select * from partitionparquet limit 10;

 explain select myonein10k from partitionparquet where mydayofyear=365 limit 5;
 explain select myonein10k from partitionparquet where myweekday=3 limit 5;
 explain select myonein10k from partitionparquet where mymonth=5 and myweekday=3 limit 5;
