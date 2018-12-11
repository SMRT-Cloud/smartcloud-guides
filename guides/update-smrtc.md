### Update Guide

Assuming the masternode is defaulted to a single masternode on a single vps.

To update smart cloud copy and paste the below commands into your linux terminal:
* cd && bash -c "$(wget -O - https://raw.githubusercontent.com/SMRT-Cloud/smartcloud-guides/master/guides/update-smrtc.sh)"

By running the above script will auto stop the masternode, removed the old daemon and replacing new one then it runs the new daemon and sync.
You will need to download your new windows file from the following link:
https://github.com/SMRT-Cloud/smrtc/releases/download/v1.0.0.2/smrtc-qt-win64.zip

Extract the file to a directory of your choice.

Before you run the new wallet, stop all old running wallet and just run the new wallet exectutable smrtc-qt.exe and let it fully sync.
Activate the masternode as usual and voila! you are updated! 
