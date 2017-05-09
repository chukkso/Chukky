#!/bin/bash
#echo -e "\nI am more than a conqueror\n" 
#read -rp "Are you blessed? ( blessed 1 or not 2)" status

#echo you are $status When God is with you ...
#sleep .2
echo -e "\nNow lets check some system info.....\n"

read -rp "what would you like to check now - Ip address(1) or hostname(2) ? :" ans  
if [ $ans = 1 ] 
then
ip addr && sleep 1 && df -h 
elif
   [ $ans = 2 ]
then 
date ;
hostnamectl
else
echo -e "\nYou have entered the wrong options ..its either 1 or 2 try again ;) or go to bed ;)\n"
fi

echo Thanks !!!
