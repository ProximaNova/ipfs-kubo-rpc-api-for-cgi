#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/h206m.sh?url=//g" | sed "s/^%20//g")"

time="$(TZ=UTC date -u +%Y%m%d%H%M%S)"
urlsafe=$(echo "$url" | sed "s/:\|\/\|?\|=\|&\|(\|)\|,\|+\|*\|%\|#\|@/-/g")
urllen=$(echo -n $time-$urlsafe | wc --bytes)
if [ $urllen -gt 200 ]; then
    urlsafe="$(echo $urlsafe | perl -pE "s/^(.{200}).*/\1.URL2LONG/g")"
fi

echo -n "url is: "; echo "$url" | tee $basepath/$time-$urlsafe.txt
echo
echo "urlsafe: $urlsafe"
echo
echo "time is: $time"; echo

echo "$url" > /zc/put/cunt/http206/$time-$urlsafe.mp4.txt
curl -sLk "$url" > /zc/put/cunt/http206/$time-$urlsafe.mp4
