#!/bin/bash
echo "Content-type: text/plain"
echo
url="$(echo -n "$REQUEST_URI" | sed "s/.*?url=//g")"
echo "$url" > /zc/put/cunt/warc/chkurl.txt
cid=$(curl -sL "http://10.0.0.231/cgi-bin/ipfsapi/v0_edit_mpc/add?file=/zc/put/cunt/warc/chkurl.txt&rawleaves=true&onlyhash=true" | jq .Hash | sed "s/\"//g")
TZ=UTC wget --spider --no-verbose http://10.0.0.231:8080/ipfs/$cid 2>&1
echo
echo "Note: currently only works on NoFetch gateways."
