#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/xxd.sh?url=//g")"
curl -sLk "$url" | xxd
