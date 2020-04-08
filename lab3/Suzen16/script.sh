#! /bin/bash

flag = $(id | egrep -o "[A-z0-9]{28}")
echo $flag