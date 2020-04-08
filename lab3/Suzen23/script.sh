#! /bin/bash

for i in destination/*
do
    mv $i $i.back
done

for i in source/*
do
    mv $i destination/
done

flag = $(ls | egrep -o "[A-z0-9]{28}")
echo $flag
