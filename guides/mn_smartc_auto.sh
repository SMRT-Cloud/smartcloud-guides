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
#backup old wallet if running hot! and somehow reran the script...
cp /root/.smrtc/wallet.dat /root/backupsmrtcwallet.dat
#remove old files
rm -rf /root/.smrtc/
rm smrtc*

wget https://github.com/telostia/smartcloud-guides/releases/download/0.001/smrtc-linux.tar.gz
tar -xvf smrtc-linux.tar.gz
rm smrtc-linux.tar.gz
chmod +x smrtc*
cp smrtc* /usr/local/bin
rm mn_smartc_auto.sh
ufw allow 9887/tcp

#masternode input

echo -e "${GREEN}Now paste your Masternode key by using right mouse click ${NONE}";
read MNKEY

EXTIP=`curl -s4 icanhazip.com`
USER=`pwgen -1 20 -n`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";
sudo mkdir $HOME/.smrtc

printf "addnode=104.236.114.249\naddnode=104.236.118.35\naddnode=104.131.118.192\naddnode=104.236.25.11\naddnode=188.166.209.120\naddnode=188.166.209.139\naddnode=167.99.65.33\naddnode=206.189.36.191\naddnode=167.99.222.129\naddnode=167.99.221.205\naddnode=139.99.202.198\naddnode=139.99.198.190\naddnode=206.189.91.171\naddnode=104.236.25.11\n
addnode=139.99.159.113\naddnode=139.99.197.135\n
addnode=139.99.202.60\n
addnode=139.99.197.112\n
addnode=139.99.196.73\n
addnode=139.99.158.38\n
\nrpcuser=smartcuser$USER\nrpcpassword=$PASSW\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=154\nexternalip=$EXTIP:9887\nmasternode=1\nmasternodeprivkey=$MNKEY" >  $HOME/.smrtc/smrtc.conf

smrtcd
watch smrtc-cli getinfo
