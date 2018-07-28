#!/bin/bash
#USERNAME=andrew
USERNAME=`whoami`
echo $USERNAME
# samba environment for ubuntu 14.04
sudo apt-get install -y samba
# could use expect here
sudo smbpasswd -a $USERNAME
sudo ufw allow 445
sudo ufw allow 136
sudo ufw allow 139
sudo cp /etc/samba/smb.conf /etc/samba/smb.bak.conf
sudo cp smb.conf /etc/samba/smb.conf
#sudo patch /etc/samba/smb.conf ubuntu-1404-smb-conf.patch
#'sed -i.bak '/^\s*[;#]/d; /^$/d' smb.conf' to clean up smb.conf
#'sudo ufw status' to check
#'sed -i.bak '/^\s*[;#]/d; /^$/d' smb.conf' to clean up smb.conf
#NOTE: 'sudo service samba restart' has no effect
sudo service smbd restart
#'smbclient -L //10.62.59.190 -U onrack' to check samba setting


