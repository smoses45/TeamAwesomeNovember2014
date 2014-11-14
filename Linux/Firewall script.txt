#!/bin/bash

#clear
sudo iptables --flush

#ssh
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT
sudo iptables -A INPUT -s 192.168.190.116 -p tcp --dport ssh -j ACCEPT

#RDP
#sudo iptables -A INPUT -s 192.168.1.0/24 -d 192.168.0.0/24 --dport 3389 -j ACCEPT
#sudo iptables -A INPUT -d 192.169.1.0/24 --dport 3389 -j REJECT

#Webserver
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT #http
sudo iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT #https

#tomcat
sudo iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT #tomcat

#SMTP
sudo iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT #SMTP nonsecure
sudo iptables -A INPUT -p tcp -m tcp --dport 465 -j ACCEPT #SMTPs secure

#POP3
sudo iptables -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT #nonsecure & nonecrypted
sudo iptables -A INPUT -p tcp -m tcp --dport 995 -j ACCEPT #secure

#IMAP
sudo iptables -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT #nonsecure & nonecrypted
sudo iptables -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT #secure

#FTP Active
sudo iptables -A INPUT -p tcp --dport 21 -j ACCEPT #client initates connection
#sudo iptables -A OUTPUT -p tcp --sport 20 -j ACCEPT #server initates connection

#FTP PASSIVE
#sudo iptables -A INPUT -p tcp --dport 1023 -j ACCEPT #client initates connection

#PPTP VPN
sudo iptables -A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 47 -j ACCEPT

#openvpn 1194
sudo iptables -A INPUT -p tcp -m tcp --dport 1194 -j ACCEPT

#L2TP
sudo iptables -A INPUT -p udp -m udp --dport 1701 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 500 -j ACCEPT

#Established or Related connections
sudo iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#fail2ban
sudo iptables -N fail2ban-ssh
sudo iptables -A fail2ban-ssh -j RETURN
sudo iptables -I INPUT -p tcp --dport ssh -j fail2ban-ssh
