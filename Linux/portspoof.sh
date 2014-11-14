sudo apt-get install git
sudo apt-get install g++
cd /usr/share
sudo git clone https://github.com/drk1wi/portspoof
cd portspoof/
sudo ./configure --sysconfdir=/etc/
sudo make
sudo make install
