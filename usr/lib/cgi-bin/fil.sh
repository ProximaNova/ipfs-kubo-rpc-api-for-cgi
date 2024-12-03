#!/bin/bash
echo "Content-type: text/plain"
echo
id="$(echo -n "$REQUEST_URI" | sed "s/^\/cgi-bin\/fil.sh?id=//g")"
lassie fetch -o - $id 2>&1 | xxd | head -n20
