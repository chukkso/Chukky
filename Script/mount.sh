#!/bin/bash
echo " checking for mount points"
if [ -d /home/$USER/mnt ] ; then
echo " mounting directories"
sudo mount -t cifs -o username=$USER,rw //10.0.0.2/buchyshare /home/$USER/mnt
fi
