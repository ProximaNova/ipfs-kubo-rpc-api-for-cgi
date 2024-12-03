#!/bin/bash
echo "Content-type: text/html"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/tor.sh?url=//g")"
torsocks wget -qO- "$url"
