#!/bin/bash
echo "Content-type: text/plain"
echo
localip="10.0.0.232"
url="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/arcchk?url=//g")"
echo "$url" > /zc/put/cunt/warc/chkurl.txt
cid=$(curl -sLk "https://$localip/cgi-bin/ipfsapi/v0_edit_mpc/add?file=/zc/put/cunt/warc/chkurl.txt&rawleaves=true&onlyhash=true" | jq .Hash | sed "s/\"//g")
TZ=UTC wget --spider --no-verbose --no-check-certificate https://$localip/ipfs/$cid 2>&1
echo
echo "Note: currently only works on NoFetch gateways."
