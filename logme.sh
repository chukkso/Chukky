#! /bin/bash
# This file is used with WSL, to log a session via screen,  to a text file 

if [ ! -n "$1" ]
then
  echo "usage: `basename $0` session_name"
  exit $E_BADARGS
fi

screen -S $1  -L -Logfile Downloads/precheck_$1.log
