#!/bin/bash
echo "Content-type: text/plain"
echo
localip="10.0.0.231"
id="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/taildm.sh?id=//g")"
curl -sLk "https://$localip/cgi-bin/tail.sh?url=https://$localip/cgi-bin/ipfsapi/v0_edit_mpc/dag/export?arg=$id"
