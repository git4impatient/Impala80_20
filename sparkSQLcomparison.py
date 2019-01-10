from __future__ import print_function
!echo $PYTHON_PATH
import os, sys
#import path
from pyspark.sql import *

# create spark sql session
myspark = SparkSession\
    .builder\
    .config("spark.executor.instances", 10 ) \
    .config("spark.executor.memory", "8g") \
    .config("spark.executor.cores", 2) \
    .config("spark.scheduler.listenerbus.eventqueue.size", 10000) \
    .config("spark.sql.parquet.compression.codec", "snappy") \
    .appName("sparkSQLretailSalesQuery") \
    .getOrCreate()


mytable = myspark.read.parquet ( "/user/hive/warehouse/brew")
mytable.show(3)


mytable.createOrReplaceTempView("brew")

sqlDF = myspark.sql("SELECT * FROM brew")
sqlDF.show()

sqlDF = myspark.sql("""select a.state, a.brand,sum (a.qty) bigsales
from brew a, brew b
where 
a.mykey=b.mykey
and a.qty > 4
and a.mydate between 23 and 67
group by a.state, a.brand
order by a.state, a.brand  desc""")
import time
tstart=time.time()
sqlDF.show(20)
tend=time.time()
print (tend-tstart)
myspark.stop()
