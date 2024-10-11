#!/bin/bash
echo "Content-type: application/json"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/.*?url=//g")"
curl -sL "$url" | jq
