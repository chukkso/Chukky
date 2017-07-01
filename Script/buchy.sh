#!/bin/bash
MYUSERNAME=Chukky
STARTOFSCRIPT=`date`
echo "Script will start now $STARTOFSCRIPT 
=========================================="
wait
echo "My name is $MYUSERNAME" ;

echo "enter password : "
read -s MYPASSWORD
echo "login with $MYPASSWORD ";

ping -c10 allafrica.com >> /dev/null

ENDOFSCRIPT=`date`
echo "finished @ $ENDOFSCRIPT "

echo "We are blessed"
echo "We are 2 blessed" >> /dev/null

exit 0
