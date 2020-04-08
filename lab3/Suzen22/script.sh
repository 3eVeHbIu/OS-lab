#! /bin/bash

for i in $(seq 1 999)
do > $i.txt
done

flag = $(ls | egrep -o "[A-z0-9]{28}")
echo $flag