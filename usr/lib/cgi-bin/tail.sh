#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/tail.sh?url=//g")"
curl -sLk "$url" | tail -c 160 | xxd
