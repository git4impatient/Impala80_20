#!/usr/bin/bash
# (C) copyright 2018 Martin Lurie   Sample code, not supported
#
#
export NUMROWS=1000000
#./gendata.py 1000000 > mydata.txt
#ls -l
hadoop fs -rm -r statsparqpart
./gendata.py $NUMROWS | hadoop fs -put - "statsparqpart/mydata.txt"
export DATANODE=$(sudo su - hdfs -c "hdfs dfsadmin -report | grep Hostname | sed 's/.*: //'  | tail -1")
echo $DATANODE
impala-shell -i $DATANODE -f stagetable.ddl
