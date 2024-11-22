#!/bin/bash
#https://github.com/ProximaNova/proximanova.github.io
# from https://xrvqop.csb.app/ from https://docs.ipfs.tech/concepts/content-addressing/
echo "Content-type: text/plain"
echo
cid="$(echo -n "$REQUEST_URI" | sed "s/.*?id=//g")"
node /home/u/node/converting-between-cid-versions/index.js $cid
echo -e "\n----\n\nPercent-encoded:"
cids=($(node /home/u/node/converting-between-cid-versions/index.js $cid | grep "base\|v1\|v0" | head -n5 | grep -v "CID (v0 byte length)" | sed "s/.* //g" | perl -pE "s/\n/ /g" | sed "s/ $//g"))
echo -n "URL-encoded base16: "
echo "${cids[3]}" | tr -d \\n | xxd -ps | tr -d \\n | perl -pE "s/(..)/%\1/g"; echo
echo -n "URL-encoded base32: "
echo "${cids[1]}" | tr -d \\n | xxd -ps | tr -d \\n | perl -pE "s/(..)/%\1/g"; echo
echo -n "URL-encoded base58: "
echo "${cids[0]}" | tr -d \\n | xxd -ps | tr -d \\n | perl -pE "s/(..)/%\1/g"; echo
echo -n "URL-encoded base256: "
echo "${cids[2]}" | tr -d \\n | xxd -ps | tr -d \\n | perl -pE "s/(..)/%\1/g"
