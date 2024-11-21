#!/bin/bash
#https://github.com/ProximaNova/proximanova.github.io
# from https://xrvqop.csb.app/ from https://docs.ipfs.tech/concepts/content-addressing/
echo "Content-type: text/plain"
echo
cid="$(echo -n "$REQUEST_URI" | sed "s/.*?id=//g")"
node /home/u/node/converting-between-cid-versions/index.js $cid
echo
echo -n "URL-encoded base256: "
node /home/u/node/converting-between-cid-versions/index.js $cid | grep base256 | sed "s/CID (v1 base256) : //g" | tr -d \\n | xxd -ps | tr -d \\n | perl -pE "s/(..)/%\1/g"
