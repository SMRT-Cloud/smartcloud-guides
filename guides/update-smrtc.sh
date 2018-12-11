#get file
cd
wget  https://github.com/SMRT-Cloud/smrtc/releases/download/v1.0.0.2/smrtc-linux.tar.gz
smrtc-cli stop
sudo chmod +x 
sudo tar -xvf smrtc-linux.tar.gz
sudo rm smrtc-linux.tar.gz
sudo rm /usr/local/bin/smrtc*
sudo cp smrtc* /usr/local/bin
sudo rm smrtc*
smrtcd
watch smrtc-cli getinfo
