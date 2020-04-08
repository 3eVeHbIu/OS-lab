#! /bin/bash

flag=$(ls -a | egrep -o '[a-zA-Z0-9]{28}')
echo $flag
