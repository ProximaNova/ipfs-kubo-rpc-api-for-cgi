#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/src?url=//g")"
curl -sLk "$url"
