#!/bin/bash

IP=$(/sbin/ip route | awk '/default/ { print $3 }')
nmap -sP $IP/24
nmap -sP $IP/24 >> /home/output.txt
awk '/Nmap scan report/ {print $5}' /home/output.txt >> /home/output2.txt
sed '1d' /home/output2.txt >> /home/output3.txt
IPS=$(head -1 /home/output3.txt)
nmap -sS $IPS
nmap -sSV -O $IPS
nmap -sSV -O $IPS -oN /home/kali/output.txt