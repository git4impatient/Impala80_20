#!/usr/bin/python
# (c) copyright 2018 Martin Lurie  Sample code not supported
#
# generate data with different cardinality 
# yes, you could do this with a mod of a single counter but
# division is hard and slow :-)
#
#
import sys
if len(sys.argv) <  2:
        print("Usage: gendata <number_of_rows> ")
        exit(-1)
lines = int(sys.argv[1]) + 1000000
n=1000000
month=0
weekday=0
dayofyear=0
onein10k=0
mystring="this is a long string n, month, weekday, dayofyear, gives us  useful cardinality"
while n < lines:
        n=n+1
        month=month+1
        weekday=weekday+1
        dayofyear=dayofyear+1
        onein10k=onein10k+1
        if month==13:
           month=1
        if weekday==8:
           weekday=1
        if dayofyear==366:
           dayofyear=1
        if onein10k==10001:
           onein10k=1
        print  str(n) + "|" + str(month) +"|" + str(weekday) +"|" + str(dayofyear) +"|"+ str(onein10k)+ "|" + mystring
