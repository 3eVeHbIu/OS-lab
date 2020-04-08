#! /bin/bash

part1 = $(less flag | egrep -o "FLAG_PART: [A-z0-9]{9}" | egrep -o "[A-z0-9]{9}")
part2 = $(less flag | egrep -o "FLAG_PART: [A-z0-9]{10}" | egrep -o "[A-z0-9]{10}")
part3 = $(less flag | egrep -o "FLAG_PART: [A-z0-9]{8}" | egrep -o "[A-z0-9]{8}")

echo $part1$part2$part3