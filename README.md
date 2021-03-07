# simplehoneypot
1) https://lite.ip2location.com/ip-address-ranges-by-country # Download filter list and add drop at end
2) sudo nohup tcpdump -tttt -q -l -i eth0 -n '! host OWNIP and src SERVERIP and not (icmp or arp or udp)' >> /home/$HOME/susipz.txt &
3) nano /home/$HOME/susipz.txt # Remove start lines
4) sudo nohup python3 -m http.server >> serverlogs &
5) sudo crontab -e # run every 5th minute /home/$HOME/ipcapture.sh
