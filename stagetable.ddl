--(c) copyright 2018 Martin Lurie   Sample code not supported

drop table if exists stage;

create external table stage (
myrowid int,
mymonth int,
myweekday int,
mydayofyear int,
myonein10k int,
mystring string
)
row format delimited
fields terminated by '|'
stored as textfile
location '/user/marty/statsparqpart'

;

select * from stage limit 10;
select myonein10k from stage where mydayofyear=365 limit 5;
