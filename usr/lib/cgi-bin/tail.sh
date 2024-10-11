#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/.*?url=//g")"
curl -sL "$url" | tail -c 160 | xxd
