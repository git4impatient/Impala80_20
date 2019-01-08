#!/usr/bin/bash
# (C) copyright 2018 Martin Lurie   Sample code, not supported
 ./gendata.py 1000000 > mydata.txt
 ls -l
 hadoop fs -mkdir statsparqpart
 hadoop fs -put mydata.txt statsparqpart
 export DATANODE=$(sudo su - hdfs -c "hdfs dfsadmin -report | grep Hostname | sed 's/.*: //'  | tail -1")
 echo $DATANODE
 impala-shell -i $DATANODE -f stagetable.ddl
