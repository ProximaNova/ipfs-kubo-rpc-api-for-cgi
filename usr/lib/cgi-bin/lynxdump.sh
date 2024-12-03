#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/lynxdump.sh?url=//g")"
lynx -dump "$url"
