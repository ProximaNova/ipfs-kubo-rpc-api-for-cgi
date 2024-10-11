#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/.*?url=//g")"
basepath="/zc/put/cunt/warc"
time="$(date +%s)"
urlsafe=$(echo "$url" | sed "s/:\|\/\|?\|=\|&\|(\|)\|,\|+\|*\|%\|#/-/g")
echo -n "url is: "; echo "$url" | tee $basepath/$time-$urlsafe.txt
echo "urlsafe:$urlsafe"
echo "time is:$time"

#-- wget, recursive:
#TZ=UTC wget --no-check-certificate -pr --adjust-extension --convert-links --restrict-file-names=windows --warc-max-size=99123456 --warc-cdx -e robots=off --warc-file=$basepath/$time "$url" 1>$basepath/wget$time.txt 2>$basepath/wget$time.txt
#-- wget, not recursive:
cd $basepath; TZ=UTC wget --no-check-certificate -p --adjust-extension --convert-links --restrict-file-names=windows --warc-max-size=99123456 --warc-cdx -e robots=off --warc-file=$basepath/$time-$urlsafe "$url" 2>/dev/null #2> is saved to meta warc
#-- grab-site:
#-- lynx:

curl -sL "http://10.0.0.232/cgi-bin/ipfsapi/v0_edit_mpc/add?file=$basepath/$time-$urlsafe-00000.warc.gz&rawleaves=true" >> $basepath/$time-$urlsafe.ipfs.txt
curl -sL "http://10.0.0.232/cgi-bin/ipfsapi/v0_edit_mpc/add?file=$basepath/$time-$urlsafe.txt&rawleaves=true" >> $basepath/$time-$urlsafe.ipfs.txt
curl -sL "http://10.0.0.232/cgi-bin/ipfsapi/v0_edit_mpc/add?file=$basepath/$time-$urlsafe-meta.warc.gz&rawleaves=true" >> $basepath/$time-$urlsafe.ipfs.txt
curl -sL "http://10.0.0.232/cgi-bin/ipfsapi/v0_edit_mpc/add?file=$basepath/$time-$urlsafe.cdx&rawleaves=true" >> $basepath/$time-$urlsafe.ipfs.txt
curl -sL "http://10.0.0.232/cgi-bin/ipfsapi/v0_edit_mpc/add?file=$basepath/$time-$urlsafe.ipfs.txt&rawleaves=true" > $basepath/$time-$urlsafe.ipfs.set.txt; cat $basepath/$time-$urlsafe.ipfs.set.txt
