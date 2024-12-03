#!/bin/bash
file="$(echo -n "$REQUEST_URI" | sed "s/.*?f=//g")"
nosl="$(echo "$file" | sed "s/.*\///g")"
echo "Content-type: application/octet-stream"
echo "Content-Disposition: attachment; filename=\"$nosl\""
echo
cat "$file"
