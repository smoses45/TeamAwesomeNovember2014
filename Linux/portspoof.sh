sudo apt-get install -y git
sudo apt-get install -y g++
cd /usr/share
sudo git clone https://github.com/drk1wi/portspoof
cd portspoof/
sudo ./configure --sysconfdir=/etc/
sudo make
sudo make install

#Every port that needs to be open must be excluded from the redirect rules.
#The example lines below leave ports 22, 23, and 80 open and redirect all other traffic to portspoof
#sudo iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 1:21 -j REDIRECT --to-ports 4444
#sudo iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 24:79 -j REDIRECT --to-ports 4444
#sudo iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 81:65535 -j REDIRECT --to-ports 4444

sudo portspoof -c /etc/portspoof.conf -s /etc/portspoof_signatures -D
ps -ef | grep spoof

echo ""
echo "******************************************************************************"
echo "* Put: sudo portspoof -c /etc/portspoof.conf -s /etc/portspoof_signatures -D *"
echo "* into a file and make it executable.                                        *"
echo "*                                                                            *"
echo "* Then add the following line to the root crontab:                           *"
echo "* @reboot /path/to/runPortspoof                                              *"
echo "******************************************************************************"
