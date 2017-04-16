#!/bin/bash
PIDFILE=/var/run/httpd/httpd.pid
#### CENTOS SYNC ###
echo "we will now sync our Centos repos ..."
reposync -r base -r updates -r extras -p /repo/centos/7/ &&

##recreate the data about the data##

echo "now recreating metadata for Centos Base Repos"

createrepo --update -v /repo/centos/7/base &&
createrepo --update -v /repo/centos/7/updates &&
createrepo --update -v /repo/centos/7/extras &&

###EPEL REPO SYNC ###

echo "we will now sync our Epel Repos ..."
reposync -r epel -p /repo/ &&

createrepo --update -v /repo/epel &&


###SaltStack REPO SYNC ###

echo "we will now sync our Saltstack Repo ..."
reposync -r saltstack -p /repo/ &&

createrepo --update -v /repo/saltstack &&

if [ $? -eq 0 ]
then 
echo "Done updating Metadata and Repos :)"
else 
echo "ERROR!! ERROR!!"
fi

### REload Apache###
echo -e "Reloading Apache\n"
systemctl reload httpd && 
 
if [ -f $PIDFILE ]
 then echo "Apache is Running!!!!You can check the Repo Site Now!"
else
 echo "Re-check Apache Process"
fi
exit

