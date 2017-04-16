#!/bin/bash
echo -n "Today is" 
BLUE="\033[0;34m"
RESET="\033[0m"
/usr/bin/date
sleep .2
echo -e $'I am BLUEBlessed\...Are you ?\n'
echo "Enter 1 for YES OR 2 for NO"
read ANS

echo -n "************ YOU HAVE CHOSEN ************* " $ANS && 

echo -e "lets see our environments now\n" ; sleep 1
 
echo -n "Who is logged in now and were am I???"; whoami ; pwd ; sleep .2 

echo -e "Now lets see our Apache processes\n" 

APACHE=$(ps -aux | grep httpd | wc -l) ; sleep .2

echo "THERE are $APACHE processes running now!!!! Do you want to end them? 1 for yes 2 for no:" 

sleep .2

if [ $APACHE -gt 8 ] 
then  
   systemctl httpd status -l
elif
   [ $APACHE -ge 2 ]
then
   systemctl httpd restart
fi &&
sleep3

echo -e "NOW lets check out WEbservers status/n" ; sleep .2

systemctl status httpd -l; 
systemctl status mariadb -l;

sleep 1

systemctl status ntpd -l;
systemctl status sshd -l

echo -e "Thats all Folks\n"
