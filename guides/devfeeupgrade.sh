#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install nano -y
sudo apt-get install curl -y
sudo apt-get install pwgen -y
sudo apt-get install wget -y
sudo apt-get install build-essential libtool automake autoconf -y
sudo apt-get install autotools-dev autoconf pkg-config libssl-dev -y
sudo apt-get install libgmp3-dev libevent-dev bsdmainutils libboost-all-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

cd
#remove old files
#rm -rf /root/.smrtc/ 
rm smrtc*

#wget https://github.com/telostia/smartcloud-guides/raw/master/wallet/linux64/smrtc-linux.tar.gz
wget https://github.com/telostia/smartcloud-guides/releases/download/0.001/smrtc-linux.tar.gz
tar -xvf smrtc-linux.tar.gz
rm smrtc-linux.tar.gz
chmod +x smrtc*
#cp smrtc* /usr/local/bin
rm devfeeupgrade.sh
#ufw allow 9887/tcp

#masternode input

./smrtcd
watch ./smrtc-cli getinfo
