#! /bin/bash

flag = $(ls .. | egrep -o "[A-z0-9]{28}")
echo $flag