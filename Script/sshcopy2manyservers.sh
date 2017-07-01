#!/bin/bash
IPRESULT=`cat /Users/chuksokonkwo/keys/serverlist`
for IPS in $IPRESULT;
do
ssh-copy-id $IPS
done
echo -n "finished copying keys to remote server"


#echo $IPRESULT
