#!/bin/bash
ntpstatus=`ps -aux | grep ntpd | grep -v grep | wc -l`
if [ $ntpstatus = 0 ]
then echo -e "\n ***URGENT***\n
     We are gonna restart ntp service now" && sleep 1; systemctl restart ntpd && 
     echo -e "\n We can check date and time"

elif
[ $ntpstatus > 0 ]
then echo -e " Time is Correctly Synced. You are at peace!!\nLet's Check our Peers..." ; sleep 2&&
/usr/sbin/ntpq -p ; sleep 2
echo -e "what is today's day and time since we have been sleeping??\n `date`"  
fi

#Made by Chuks
