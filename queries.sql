-- (c) copyright 2018 Martin Lurie, Sample code not supported
--
--  these are some sample queries, this file will get updated soon
-- 
select myweekday, count(*) from partitionparquet group by myweekday;

select a.myweekday, count(*), sum (b.mydayofyear) 
from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid group by a.myweekday;
select myweekday, ndv(myweekday) from partitionparquet group by myweekday;
select myweekday, count(*) from partitionparquet group by myweekday;
explain select myweekday, count(*) from partitionparquet group by myweekday;
explain select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid group by a.myweekday;
 select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid group by a.myweekday;
profile;
explain select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid and group by a.myweekday;
explain select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid  group by a.myweekday;
explain select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid and b.myonein10k=500 group by a.myweekday;
compute stats partitionparquet;
explain select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid and b.myonein10k=500 group by a.myweekday;
explain select a.myweekday, count(*) from partitionparquet a, partitionparquet b where a.myrowid=b.myrowid and a.myonein10k=500 group by a.myweekday;
