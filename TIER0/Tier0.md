TIER 0
=================
Conectar a la vpn
sudo openvpn starting_point_Akelarre.ovpn

 

Virtual Machinne
Terminal
openvpn
tun
ping
nmap
telnet
root
Se conecta con telnet a Meown y con user/pass root se obtiene el flag.txt

CONECTAR POR TELNET
-------------------
telnet <ip> 23

SABER SISTEMA OPERATIVO
-------------------
nmap -sV 10.129.28.248

CLIENTE FTP
-------------------
ftp

SMB CLIENTE - RECURSOS COMPARTIDOS
--------------------------------------
smbclient -L
smbclient
 > help
smbclient \\\\10.129.4.121\\WorkShares

El sáb, 23 abr 2022 a las 11:11, David Yanes Fariña (<davidyanesfarina@gmail.com>) escribió:


    Conectar a la vpn
    /////////////////

    Virtual Machinne
    Terminal
    openvpn
    tun
    ping
    nmap
    telnet
    root
    Se conecta con telnet a Meown y con user/pass root se obtiene el flag.txt
    
    
    
    
REDEEMER
--------

redis-cli -h

> info

> select 0

keys *

get tmp
get stor
get numb
glet flag


    