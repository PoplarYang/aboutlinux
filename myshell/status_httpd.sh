#!/bin/bash
#
# Show the status of httpd(status,documentroot,vhost is running,log,)

echo "# The status of httpd"
service httpd status
echo

echo "# About ServerRoot "
grep "^ServerRoot" $1
echo

echo "# About log"
grep --color "CustomLog.*common$" $1
echo

echo "# About DocumentRoot"
grep --color '^DocumentRoot' $1
echo

echo "# About Virtual hosts"
grep -E -A 1 --color "# Virtual hosts" $1
echo
