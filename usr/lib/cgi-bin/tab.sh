#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/tab.sh?url=//g")"
f="/zc/put/cunt/tab/tabs$(TZ=UTC date -u +%Y%m%d).txt"
echo "$url" >> $f
echo >> $f
echo "Wrote $url to $f"