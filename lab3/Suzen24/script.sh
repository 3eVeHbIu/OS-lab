#! /bin/bash

mkdir Music
for i in Desktop/music/*
do
    cp -r $i Music/
done
flag = $(ls | egrep -o "[A-z0-9]{28}")
echo $flag