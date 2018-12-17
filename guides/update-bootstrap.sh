#!/bin/bash
#remove old boostrap file
sudo rm smrtc-linux-bootstrap-140k.tar.gz*
cd
sudo smrtc-cli stop
sudo wget https://github.com/SMRT-Cloud/smartcloud-guides/releases/download/1.0.0.2/smrtc-linux-bootstrap-140k.tar.gz
#extract files to smartcloud's data folder
sudo tar -xvf smrtc-linux-bootstrap-140k.tar.gz -C $HOME/.smrtc/ --strip-components=1
# clean up files
sudo rm smrtc-linux-bootstrap-140k.tar.gz*
sudo rm mymn-linux* update-bootstrap.sh
sleep 3
smrtcd
sleep 3
watch smrtc-cli getinfo