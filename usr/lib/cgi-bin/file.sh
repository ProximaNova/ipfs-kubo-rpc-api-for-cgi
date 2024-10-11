#!/bin/bash
file="$(echo -n "$REQUEST_URI" | sed "s/.*?f=//g")"
nosl="$(echo "$file" | sed "s/.*\///g")"
echo "Content-type: application/octet-stream"
echo "Content-Disposition: attachment; filename=\"$nosl\""
echo
cat "$file"

# echo "Content-type: text/html"
# echo
# echo "Test<br>"
# #export IPFS_PATH=$HOME/.config/BraveSoftware/Brave-Browser/brave_ipfs
# export IPFS_PATH=/zc/ipfs
# echo "$IPFS_PATH<br>"
# which ipfs
# ipfs pin ls --type=recursive | head
# echo "<br>"
# whoami
