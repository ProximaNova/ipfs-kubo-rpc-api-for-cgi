#!/bin/bash
echo "Content-type: text/html"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/.*?url=//g")"
torsocks wget -qO- "$url"
