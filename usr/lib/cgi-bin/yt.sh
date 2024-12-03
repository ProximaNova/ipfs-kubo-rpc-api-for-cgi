#!/bin/bash
echo "Content-type: text/html"
echo
echo "<pre>"
v=$(echo -n $REQUEST_URI | sed "s/^\/cgi-bin\/yt.sh?v=//g" | sed "s/&.*//g")
re=$(echo -n $REQUEST_URI | sed "s/.\{28\}//g") # related to var $v being one character long, also assumes 00.0.0.000/cgi-bin/yt.sh
res=$(echo -n $re | sed "s/&..//g")
#-- not H264 #yt-dlp "https://www.youtube.com/watch?v=$v" -f mp4 -f "bestvideo[height<=900]+bestaudio/best[height<=900]" -o /zc/put/cunt/$v.mp4
#-- not H264 #yt-dlp "https://www.youtube.com/watch?v=$v" -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" -o /zc/put/cunt/$v.mp4
if [ -z $res ]; then
    echo NO RES
    echo "$res"
    yt-dlp "https://www.youtube.com/watch?v=$v" -f "bestvideo[height<=900]+bestaudio[ext=m4a]/best[height<=900]" -S "codec:h264" --restrict-filenames --windows-filenames -o "/zc/put/cunt/%(title)s-%(channel)s-%(upload_date)s-%(extractor)s-%(resolution)s-%(id)s.%(ext)s"
else
    echo RES
    echo "$res"
    yt-dlp "https://www.youtube.com/watch?v=$v" -f "bestvideo[height<=600]+bestaudio[ext=m4a]/best[height<=600]" -S "codec:h264" --restrict-filenames --windows-filenames -o "/zc/put/cunt/%(title)s-%(channel)s-%(upload_date)s-%(extractor)s-%(resolution)s-%(id)s.%(ext)s"
fi
echo "</pre>"
