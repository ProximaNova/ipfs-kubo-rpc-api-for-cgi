#!/bin/bash
echo "Content-type: video/mp4"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/mp4.sh?url=//g")"
curl -sLk "$url"