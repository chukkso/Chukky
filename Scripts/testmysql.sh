#!/bin/bash
#source https://www.shellhacks.com/mysql-run-query-bash-script-linux-command-line
#https://anilhk.wordpress.com/2010/09/29/how-to-count-the-number-of-databases-in-mysql/

DBCOUNT=4

#echo "Get listing of Databases, users and replication status" && sleep 1
read -sp "enter Admin user password here:" PASSWORD && sleep 2
echo
echo "We should have $DBCOUNT DBS..Lets check and make sure that is the case" && sleep 1
echo
echo "----------->>> checking Database count<<<----------"; sleep 1
echo
mysql -uroot -p$PASSWORD -B -N -e "select count(*) from information_schema.SCHEMATA where schema_name not in ('mysql','information_schema','performance_schema');" &&
echo 
echo "lets show master and or slave status" ; sleep 1
echo
mysql -uroot -p$PASSWORD -e "show master status;" && sleep 1
echo
mysql -uroot -p$PASSWORD -e "show slave status\G;" &&

#mysql -uroot -p$PASSWORD -B <<EOF
#show databases;
#select user,host from mysql.user;
#show master status;
#show slave status;
#show processlist;
#EOF
#testing an update
#testing second update this time with git plus ;)
echo "All Done"
