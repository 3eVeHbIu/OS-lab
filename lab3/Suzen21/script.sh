#! /bin/bash

rm ./*[0-9]*.txt && rm ./*[a-z]*.png && rm ./*test-*.log
flag = $(ls | egrep -o "[A-z0-9]{28}")
echo $flag