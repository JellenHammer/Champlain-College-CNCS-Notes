#!/usr/bin/bash
username=$1
#read -p "Enter username:" username
sudo useradd -m -d /home/$username -s /bin/bash $username
sudo mkdir /home/$username/.ssh
sudo cp '/home/connorj/Champlain-College-CNCS-Notes/System Administration & Network Services II (SYS-265-02)/Linux/Public-Keys/id_rsa.pub' /home/$username/.ssh/authorized_keys
sudo chmod 700 /home/$username/.ssh
sudo chmod 600 /home/$username/.ssh/authorized_keys
sudo chown -R $username:$username /home/$username/.ssh
