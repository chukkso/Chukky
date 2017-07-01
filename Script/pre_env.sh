#!/bin/bash
echo " The location of my shell command is:"
echo $SHELL
echo "we are logged in as $LOGNAME and we are currently in $PWD and the date is/n:"
/usr/bin/date +%F
/usr/bin/sleep 2
echo "The process id of the script is":
echo $$
TMP='/usr/bin/ls -l /tmp'
echo "here is a list of files in the tmp directory: $TMP
