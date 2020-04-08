#! /bin/bash

flag = $(sort -ru mail.txt | egrep -o "[A-z0-9]{27}")
echo $flag