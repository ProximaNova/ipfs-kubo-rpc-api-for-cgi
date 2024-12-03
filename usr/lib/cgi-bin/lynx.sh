#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/lynx.sh?url=//g")"
lynx -source "$url"
