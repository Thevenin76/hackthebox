Introduction to Windows
------------------------
akelarre@htb[/htb]$ xfreerdp /v:<targetIp> /u:htb-student /p:Password

xfreerdp /v:10.129.201.57 /u:htb-student /p:Password Academy_WinFun!

Dentro de c:\academy -> flag.txt: c8fe8d977d3a0c655ed7cf81e4d13c75

PS C:\htb> Get-WmiObject -Class win32_OperatingSystem | select Version,BuildNumber

Operating System Names 			Version Number
Windows NT 4 				4.0
Windows 2000 				5.0
Windows XP 				5.1
Windows Server 2003, 2003 R2 		5.2
Windows Vista, Server 2008 		6.0
Windows 7, Server 2008 R2 		6.1
Windows 8, Server 2012 			6.2
Windows 8.1, Server 2012	 R2 	6.3
Windows 10, Server 2016, Server 2019 	10.0