#!/bin/bash
#Depend:
#$ sudo apt install inotify-tools -y
#Info:
#crappy replacement for haproxy
#Server:
#Apache (tinyproxy is at /var/log/tinyproxy/tinyproxy.log <-> http://127.0.0.1:8888/)
#Todo:
#Maybe make this a .service file to run at start up: use systemctl or something

while inotifywait -e modify /var/log/apache2/access.log; do
 tail="$(tail -n1 /var/log/apache2/access.log | sed "s/GET \/favicon.ico//g")"
 url1="$(echo $tail | grep -o "\"GET [^ ]*" | sed "s/^\"GET //g")"
 url2="$(echo "$url1" | sed "s/^/https:\/\/10.0.0.229/g")"
# echo -n "$url1 -> "
 TZ=UTC wget --no-verbose --no-check-certificate --timeout=10 --tries=1 -O/dev/null "$url2" 1>/dev/null 2>/dev/null
done # &
