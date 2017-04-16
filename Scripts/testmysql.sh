#!/bin/bash
#source https://www.shellhacks.com/mysql-run-query-bash-script-linux-command-line
echo "Get listing of Databases, users and replication status" && sleep 1
echo "enter admin user password"
mysql -uroot -ppasswd -B <<EOF
show databases;
select user,host from mysql.user;
show master status;
show slave status;
show processlist;
EOF
#testing an update
testing second update this time with git plus ;)
echo "All Done"
