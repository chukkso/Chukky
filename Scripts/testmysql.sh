#!/bin/bash
##source https://www.shellhacks.com/mysql-run-query-bash-script-linux-command-line
##https://anilhk.wordpress.com/2010/09/29/how-to-count-the-number-of-databases-in-mysql/
RED="\033[0;31m"
RESET="\033[0m"
GREEN="\033[32m"
CYAN="\033[36"
BOLD="\033[1m"
PREDBCOUNT=10
USERCOUNT=7

TEST="10.0.0.8"
PROD="10.0.0.1"

echo -e $RED
read -sp "Enter DB admin user password here:" PASSWORD ; sleep 2
echo -e $RESET

echo "Databse Environment"
echo "==================="
echo "1) TEST"
echo "2) PROD"
echo ""
echo "Enter Choice:"
read DBCHOICE

case $DBCHOICE in
1)
DBCOUNT="$( mysql -ubackup -p$PASSWORD -h$TEST -B -N -e "select count(*) from information_schema.SCHEMATA where schema_name not in ('mysql','information_schema','performance_schema');" 2> /dev/null)"

STATUS="$( mysql -ubackup -p$PASSWORD -h$TEST -B -e "status";)"

#DBCOUNT="$( mysql -ubackup -p$PASSWORD -h$TEST -B -N -e "select count(*) from information_schema.SCHEMATA where schema_name not in ('mysql','information_schema','performance_schema');" )"

echo "$STATUS"

echo
echo -e $BOLD "We should have $PREDBCOUNT Databases..Lets check and make sure that is the case"  $RESET;  sleep 3
echo
echo -e $BOLD "----------->>> checking Database count <<<----------" $RESET ; sleep 1
echo

if [ "$DBCOUNT" -eq "$PREDBCOUNT" ]
  then
   echo "Databases are intact"

elif [ "$DBCOUNT" -ne "$PREDBCOUNT" ]
then
   echo "Double-check Database Count"
fi ;;
2)
DBCOUNT="$( mysql -ubackup -p$PASSWORD -h$TEST -B -N -e "select count(*) from information_schema.SCHEMATA where schema_name not in ('mysql','information_schema','performance_schema');" 2> /dev/null)"

STATUS="$( mysql -ubackup -p$PASSWORD -h$TEST -B -e "status";)"

#DBCOUNT="$( mysql -ubackup -p$PASSWORD -h$TEST -B -N -e "select count(*) from information_schema.SCHEMATA where schema_name not in ('mysql','information_schema','performance_schema');" )"

echo "$STATUS"

echo
echo -e $BOLD "We should have $PREDBCOUNT Databases..Lets check and make sure that is the case"  $RESET;  sleep 3
echo
echo -e $BOLD "----------->>> checking Database count <<<----------" $RESET ; sleep 1
echo

if [ "$DBCOUNT" -eq "$PREDBCOUNT" ]
  then
   echo "Databases are intact"

elif [ "$DBCOUNT" -ne "$PREDBCOUNT" ]
then
   echo "Double-check Database Count"
fi ;;

*)
 echo " Wrong environment";;
esac
#echo
#echo "---------->>>Showing Slave Statuses and Process<<<-----------"
#echo
#
#SLAVESTATUS=$(( echo "show slave status \G:") | mysql -ubackup -p$PASSWORD 2>&1 | egrep 'Slave_IO_Running|Slave_SQL_Running|Seconds_Behind_Master')
#
#echo "$SLAVESTATUS"
#echo
#echo " Lets check Our Database User Counts
#       We should have $USERCOUNT Distinct Users in our Database"
#
#ACTUALUSERCOUNT="$(echo "select count(*) from mysql.user where user not in ('mysql','root');" | mysql -u backup -N -p$PASSWORD 2> /dev/null)"
#
#
#if [ "$ACTUALUSERCOUNT" -eq "$USERCOUNT" ]
#  then
#   echo " Our Database Users are Intact"
#
#elif [ "$ACTUALUSERCOUNT" -ne "$USERCOUNT" ]
#then
#   echo -e $RED "Database Users are not intact, please recheck" $RESET
#fi
#
#sleep 1;
#
#echo -e $GREEN "Test Complete..All Done" $RESET
