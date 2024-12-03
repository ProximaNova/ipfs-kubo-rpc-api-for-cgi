#!/bin/bash
echo "Content-type: text/plain"
echo
localip="10.0.0.231"
id="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/taildh.sh?id=//g")"
curl -sLk "https://$localip/cgi-bin/tail.sh?url=https://$localip/cgi-bin/ipfsapi/v0/dag/export?arg=$id"
