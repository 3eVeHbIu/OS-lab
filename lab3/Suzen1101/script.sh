#! /bin/bash

file = $(cat world_list | grep -c suzen)
flag = $(cat $file)
echo $flag