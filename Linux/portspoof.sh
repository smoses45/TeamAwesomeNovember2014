sudo apt-get install git
sudo apt-get install g++
cd /usr/share
sudo git clone https://github.com/drk1wi/portspoof
cd portspoof/
sudo ./configure --sysconfdir=/etc/
sudo make
sudo make install
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 0:1775 -j REDIRECT --to-ports 4444
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 1777:65535 -j REDIRECT --to-ports 4444
sudo portspoof -c /etc/portspoof.conf -s /etc/portspoof_signatures -D
ps -ef | grep spoof
