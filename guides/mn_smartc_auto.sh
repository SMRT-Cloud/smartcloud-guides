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
sudo apt-get install autotools-dev autoconf pkg-config libssl-dev software-properties-common -y
sudo apt-get install libgmp3-dev libevent-dev bsdmainutils libboost-all-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get -y install libdb5.3-dev libdb5.3++-dev
sudo ufw allow 9887/tcp

sudo cd
#backup old wallet if running hot! and somehow reran the script...
sudo cp /root/.smrtc/wallet.dat /root/backupsmrtcwallet.dat
#stop running smrtc if any
sudo smrtc-cli stop
#remove old files
sudo rm /usr/local/bin/smrtc*
sudo rm -rf /root/.smrtc/ 
sudo rm smrtc*

#sudo wget https://github.com/telostia/smartcloud-guides/releases/download/0.001/smrtc-linux.tar.gz
sudo wget https://github.com/SMRT-Cloud/smrtc/releases/download/v1.0.0.2/smrtc-linux.tar.gz
sudo tar -xvf smrtc-linux.tar.gz
sudo rm smrtc-linux.tar.gz
sudo chmod +x smrtc*
sudo cp smrtc* /usr/local/bin
#clean up files
sudo rm smrtc*
sudo rm mn_smartc_auto.sh
#remove old boostrap file
sudo rm smrtc-linux-bootstrap*
sudo wget https://github.com/SMRT-Cloud/smartcloud-guides/releases/download/1.0.0.2/smrtc-linux-bootstrap-140k.tar.gz
#extract files to data folder
sudo tar -xvf smrtc-bootstrap-linux-140k.tar.gz -C $HOME/.smrtc/ --strip-components=1
# clean up files
sudo rm smrtc-linux-bootstrap*

#masternode input

echo -e "${GREEN}Now paste your Masternode key by using right mouse click ${NONE}";
read MNKEY

EXTIP=`curl -s4 icanhazip.com`
USER=`pwgen -1 20 -n`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";
sudo mkdir $HOME/.smrtc

printf "addnode=139.99.197.135\n
addnode=139.99.197.112\n
addnode=167.99.182.127\n
addnode=50.107.90.184\n
addnode=80.211.146.15\n
addnode=95.179.132.243\n
addnode=108.61.165.133\n
addnode=201.80.1.151\n
addnode=95.179.140.3\n
addnode=82.2.156.164\n
addnode=173.249.51.26\n
addnode=167.99.65.33\n
addnode=206.189.36.191\n
addnode=167.99.222.129\n
addnode=167.99.221.205\n
addnode=139.99.202.198\n
addnode=139.99.198.190\n
addnode=206.189.91.171\n
addnode=104.236.25.11\n
addnode=139.99.197.135\n
addnode=139.99.197.112\n
addnode=139.99.196.73\n
addnode=139.99.158.38\n
\nrpcuser=smartcuser$USER\nrpcpassword=$PASSW\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=600\nexternalip=$EXTIP:9887\nmasternode=1\nmasternodeprivkey=$MNKEY" >  $HOME/.smrtc/smrtc.conf

smrtcd
sleep 3
watch smrtc-cli getinfo
