#! /bin/bash

for i in ./*
do
    for j in ./$i/*
    do
        cat $j | grep '7-([0-9][0-9][0-9])-2[0-2][0-2]-[0-9][1][69][9]' | egrep -o '[a-zA-Z0-9]{28}'
    done
done