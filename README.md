
# Impala80_20
80% of Apache Impala performance from 20% of the tuning effort

Four simple steps to get great Impala performance

1 Make sure your hosts are not swapping - if you don't have enough memory you can't go fast

2 Compute statistics on every table

3 Use parquet storage with compression

4 Partition your tables

5 Make sure you don't have small files - this could be due to how the data is loaded, it could also be from being over partitioned

Lots more info on Impala here:  https://www.youtube.com/watch?v=Hw354K9uFBo

This github has a data generator and sample code.  It also includes analysis of how to see the impact of the above steps

(c) Copyright 2018 Martin Lurie, sample code, not supported

Steps
1 run the go script to create the data, push it to hdfs and create the stage table
2 run impala-shell -f partitioning.ddl.sql to create a parquet table using compression
3 run impala-shell -f kuduInsertSelect.sql   to experiment with Kudu, a parallel store with insert/update/delete 
4 run impala-shell -f queries.sql 


