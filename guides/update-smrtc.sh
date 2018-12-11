#get file
cd
smrtc-cli stop
wget  https://github.com/SMRT-Cloud/smrtc/releases/download/v1.0.0.2/smrtc-linux.tar.gz
sudo chmod +x 
sudo tar -xvf smrtc-linux.tar.gz
sudo rm smrtc-linux.tar.gz
sudo rm /usr/local/bin/smrtc*
sudo cp smrtc* /usr/local/bin
sudo rm smrtc*
sleep 3
smrtcd
watch smrtc-cli getinfo
