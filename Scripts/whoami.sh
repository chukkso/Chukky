#!/bin/bash
     echo -e "This script Shows general System Info"
       echo  --------------------------------------
sleep 2

echo -e "can we go to the internet?\n" echo "do you want to find out ? enter Y or N 
read ANS
echo "'$ANS' ? are you sure"
read ANS
echo -e "pinging .......\n"
/usr/bin/ping -c3 google.com >> /pingresult
/usr/bin/sleep 3 

RESULT=(/bin/cat /pingresult)
echo "here are the" $RESULT && /usr/bin/sleep -1

echo -e "i am here\n" ; $PWD /usr/bin/sleep
USERS=/usr/bin/w
echo "users logged in currently" $USERS &

echo "are you sleepy? y or n"
read STATUS
if [$STATUS =y] 
   then
echo "good nite"
elif [$STATUS =n]
then
echo "lets check out our running porcess"
fi
