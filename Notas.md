


NMAP
====================================================================================================================================================================
nmap 10.10.11.152 -sV -sC -Pn

nmap -Pn -n -sV --script vuln <IP>



nikto and gobuster: Listan directorios Web

$ for i in files directories; do gobuster dir -t 30 -u $RHOST -w /opt/wordlists/seclists/Discovery/Web-Content/raft-medium-$i.txt -o enum/web/gobuster-80-rm${i:0:1}.txt; done

wpscan - Para escanera WordPress

https://khaoticdev.net/hack-the-box-backdoor/
