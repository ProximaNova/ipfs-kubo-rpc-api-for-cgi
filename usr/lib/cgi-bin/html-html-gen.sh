#!/bin/bash
echo "Content-type: text/html"
echo; url="$REQUEST_URI"

cd "/zd/put/html-html-gen/0"
timedir=$(date +%s)
mkdir $timedir; cd $timedir
# Copy template HTML to current folder
cp --update=none ../template.htm index.html
# Get name of current folder
dirnobase="$(pwd | sed "s/.*\///g")"

#1 Read the input from the form
#1read -r CONTENT_LENGTH
read -r CONTENT_TYPE

# Create a temporary file to store the uploaded file
TEMP_FILE=$(mktemp upload.XXXXXX)

# Read the multipart data
cat > "$TEMP_FILE"

# get filename
filename="$(head -n1 "$TEMP_FILE" | tr -d \\r | sed "s/\"$//g" | sed "s/.*\"//g")"
tail -n+4 "$TEMP_FILE" | head -n-17 | head -c-2 > "$filename"

# get title
title="$(tail -n14 "$TEMP_FILE" | head -n1 | tr -d \\n | tr -d \\r)"
titlesafe="$(echo -n "$title" | perl -pE "s/\x5c/1734216500x005c1734217364/g" | sed "s/\./1734216500x002e1734217364/g" | sed "s/,/1734216500x002c1734217364/g" | sed "s/\//1734216500x002f1734217364/g" | sed "s/?/1734216500x003f1734217364/g" | sed "s/;/1734216500x003b1734217364/g" | sed "s/:/1734216500x003a1734217364/g" | sed "s/\"/1734216500x00221734217364/g" | sed "s/{/1734216500x007b1734217364/g" | sed "s/\[/1734216500x005b1734217364/g" | sed "s/}/1734216500x007d1734217364/g" | sed "s/\]/1734216500x005d1734217364/g" | sed "s/=/1734216500x003d1734217364/g" | sed "s/+/1734216500x002b1734217364/g" | sed "s/\^/1734216500x005e1734217364/g" | sed "s/%/1734216500x00251734217364/g" | sed 's/\$/1734216500x00241734217364/g' | sed "s/@/1734216500x00401734217364/g" | sed 's/!/1734216500x00211734217364/g' | sed "s/\`/1734216500x00601734217364/g" | sed "s/~/1734216500x007e1734217364/g" | sed "s/</1734216500x003c1734217364/g" | sed "s/>/1734216500x003e1734217364/g" | sed "s/|/1734216500x007c1734217364/g" | sed "s/'/1734216500x00271734217364/g" | sed "s/&/1734216500x00261734217364/g" | sed "s/#/1734216500x00231734217364/g" | sed "s/-/1734216500x002d1734217364/g" | sed "s/_/1734216500x005f1734217364/g" | sed "s/)/1734216500x00291734217364/g" | sed "s/(/1734216500x00281734217364/g" | sed "s/\*/1734216500x002a1734217364/g" | sed "s/1734216500/\\\\\&#/g" | sed "s/1734217364/;/g")"

# get desc
desc="$(tail -n10 "$TEMP_FILE" | head -n1 | tr -d \\n | tr -d \\r)"
descsafe="$(echo -n "$desc" | perl -pE "s/\x5c/1734216500x005c1734217364/g" | sed "s/\./1734216500x002e1734217364/g" | sed "s/,/1734216500x002c1734217364/g" | sed "s/\//1734216500x002f1734217364/g" | sed "s/?/1734216500x003f1734217364/g" | sed "s/;/1734216500x003b1734217364/g" | sed "s/:/1734216500x003a1734217364/g" | sed "s/\"/1734216500x00221734217364/g" | sed "s/{/1734216500x007b1734217364/g" | sed "s/\[/1734216500x005b1734217364/g" | sed "s/}/1734216500x007d1734217364/g" | sed "s/\]/1734216500x005d1734217364/g" | sed "s/=/1734216500x003d1734217364/g" | sed "s/+/1734216500x002b1734217364/g" | sed "s/\^/1734216500x005e1734217364/g" | sed "s/%/1734216500x00251734217364/g" | sed 's/\$/1734216500x00241734217364/g' | sed "s/@/1734216500x00401734217364/g" | sed 's/!/1734216500x00211734217364/g' | sed "s/\`/1734216500x00601734217364/g" | sed "s/~/1734216500x007e1734217364/g" | sed "s/</1734216500x003c1734217364/g" | sed "s/>/1734216500x003e1734217364/g" | sed "s/|/1734216500x007c1734217364/g" | sed "s/'/1734216500x00271734217364/g" | sed "s/&/1734216500x00261734217364/g" | sed "s/#/1734216500x00231734217364/g" | sed "s/-/1734216500x002d1734217364/g" | sed "s/_/1734216500x005f1734217364/g" | sed "s/)/1734216500x00291734217364/g" | sed "s/(/1734216500x00281734217364/g" | sed "s/\*/1734216500x002a1734217364/g" | sed "s/1734216500/\\\\\&#/g" | sed "s/1734217364/;/g")"

# get tags
tags="$(tail -n6 "$TEMP_FILE" | head -n1 | tr -d \\n | tr -d \\r)"
tagssafe="$(echo -n "$tags" | perl -pE "s/\x5c/1734216500x005c1734217364/g" | sed "s/\./1734216500x002e1734217364/g" | sed "s/\//1734216500x002f1734217364/g" | sed "s/?/1734216500x003f1734217364/g" | sed "s/;/1734216500x003b1734217364/g" | sed "s/:/1734216500x003a1734217364/g" | sed "s/\"/1734216500x00221734217364/g" | sed "s/{/1734216500x007b1734217364/g" | sed "s/\[/1734216500x005b1734217364/g" | sed "s/}/1734216500x007d1734217364/g" | sed "s/\]/1734216500x005d1734217364/g" | sed "s/=/1734216500x003d1734217364/g" | sed "s/+/1734216500x002b1734217364/g" | sed "s/\^/1734216500x005e1734217364/g" | sed "s/%/1734216500x00251734217364/g" | sed 's/\$/1734216500x00241734217364/g' | sed "s/@/1734216500x00401734217364/g" | sed 's/!/1734216500x00211734217364/g' | sed "s/\`/1734216500x00601734217364/g" | sed "s/~/1734216500x007e1734217364/g" | sed "s/</1734216500x003c1734217364/g" | sed "s/>/1734216500x003e1734217364/g" | sed "s/|/1734216500x007c1734217364/g" | sed "s/'/1734216500x00271734217364/g" | sed "s/&/1734216500x00261734217364/g" | sed "s/#/1734216500x00231734217364/g" | sed "s/-/1734216500x002d1734217364/g" | sed "s/_/1734216500x005f1734217364/g" | sed "s/)/1734216500x00291734217364/g" | sed "s/(/1734216500x00281734217364/g" | sed "s/\*/1734216500x002a1734217364/g" | sed "s/1734216500/\\\\\&#/g" | sed "s/1734217364/;/g")"

# get media type
type="$(tail -n2 "$TEMP_FILE" | head -n1 | tr -d \\n | tr -d \\r)"
# ([t]ext,[v]ideo,[i]mage,[d]ata,[a]udio,[s]oftware,[w]eb)
type=$(echo "$type" | sed "s/^t$/text/g"); type=$(echo "$type" | sed "s/^v$/video/g")
type=$(echo "$type" | sed "s/^i$/image/g"); type=$(echo "$type" | sed "s/^d$/data/g")
type=$(echo "$type" | sed "s/^a$/audio/g"); type=$(echo "$type" | sed "s/^s$/software/g")
type=$(echo "$type" | sed "s/^w$/web/g")

# Write file metadata to text file
TZ=UTC stat "$filename" >> file_meta.txt; TZ=UTC stat -t "$filename" >> file_meta.txt
TZ=UTC stat "." >> file_meta.txt; TZ=UTC stat -t "." >> file_meta.txt

# Write title to JSON
echo -n "{\"title\":\"$(echo $title | sed "s/\"/\\\\\"/g")\"," >> file_meta.json

# Write tags to JSON
echo -n "\"tags\":\"$(echo $tags | sed "s/\"/\\\\\"/g")\"," >> file_meta.json

# Write description to JSON
echo -n "\"description\":\"$(echo $desc | sed "s/\"/\\\\\"/g")\"," >> file_meta.json

# Write type to JSON
echo -n "\"type\":\"$type\"," >> file_meta.json

# Write folder name to JSON
echo "\"folder\":\"$dirnobase\"}" >> file_meta.json

# If type is software, text, or data then write: "Cannot preview file"
if [ "$type" == "software" ] || [ "$type" == "text" ] || [ "$type" == "data" ]; then sed -i "s/img src=\"IMAGE1\" alt=\"\" \//b>Cannot preview file.<\/b/g" index.html; fi

# If type is video then write VIDEO element
if [ "$type" == "video" ]; then sed -i "s/img src=\"IMAGE1\" alt=\"\" \//video controls autoplay><source src=\"IMAGE1\" type=\"video\/mp4\"><\/video/g" index.html; fi

# Write title to HTML
sed -i "s/META1/$titlesafe/g" index.html

# Write image file name to HTML's IMG tag
sed -i "s/IMAGE1/.\/$filename/g" index.html

# Write page creation timestamp to HTML
time="$(TZ=UTC date -u +%Y-%m-%d\ %H:%M:%S)"; sed -i "s/TIME1/$time UTC by <a href=\"https:\/\/ar-io.dev\/EMryH6IEWkIKXV22ryQvuYaeJgFmm2adZ2u1Vr1bDlE\">html-html-gen<\/a>/g" index.html

# Write tags, if any, to HTML
if [ ! -z "$tags" ]; then sed -i "s/<\x21--br><div>Tags/<br><div>Tags/g" index.html; sed -i "s/TAGS1<\/div-->/$tagssafe<\/div>/g" index.html; fi

# Write description, if any, to HTML
if [ ! -z "$desc" ]; then sed -i "s/<\x21--br><div>Description/<br><div>Description/g" index.html; sed -i "s/DESC1<\/div-->/$descsafe<\/div>/g" index.html; fi

# Write media type to HTML
sed -i "s/<\x21--br><div>Type/<br><div>Type/g" index.html
sed -i "s/TYPE1<\/div-->/$type<\/div>/g" index.html

# Write folder name to HTML, and write index of index link to HTML
if [ ! -z "$dirnobase" ]; then sed -i "s/<\x21--br><div>In folder/<br><div>In folder/g" index.html; sed -i "s/DIR1<\/div-->/$dirnobase<\/div><div>Return | <a href=\"..\">.. (go up one folder)<\/a><\/div>/g" index.html; fi

mv -n "$TEMP_FILE" "/zd/put/bash-html-gen_to_delete/htmlgen/"

# Add to IPFS
localip="10.0.0.232"
filesf() { basedir="$(pwd)"; basedirlen=$(expr $(echo -n "$basedir" | wc --bytes) + 1); find "$basedir" -type f | basedirlen="$basedirlen" xargs -d "\n" sh -c 'for args do nobasedir=$(echo "$args" | sed -E "s/^.{$basedirlen}//g"); echo " -F "file=@"\"$args\";filename=\"$nobasedir\"" | tr -d \\n; done' _; }
curl -k -X POST -H "Content-Type: multipart/form-data" $(filesf) "https://$localip:5001/api/v0/add?cid-version=1&chunker=size-1048576&recursive=true&wrap-with-directory=true&pin=false" | tee -a "../cids$(TZ=UTC date -u +%Y%m%d).txt" | perl -pE "s/({\"Name\":\"\",\"Hash\":\")([^\"]*)/\1<a href=\"\/ipfs\/\2\">\2<\/a>/g"

#1 Create a directory to store uploaded files if it doesn't exist
#1UPLOAD_DIR="/var/www/html/uploads"
#1mkdir -p "$UPLOAD_DIR"

#1 Save the uploaded file
#1if [[ -n "$FILE_NAME" && -n "$FILE_CONTENT" ]]; then
#1    echo "$FILE_CONTENT" > "$UPLOAD_DIR/$FILE_NAME"
#1    echo "<html>"
#1   echo "<head><title>Upload Result</title></head>"
#1   echo "<body>"
#1   echo "<h1>File Uploaded</h1>"
#1   echo "<p>Title: ${title}</p>"
#1   echo "<p>File '$FILE_NAME' has been uploaded successfully!</p>"
#1   echo "</body>"
#1   echo "</html>"
#1else
#1   echo "<html>"
#1   echo "<head><title>Error</title></head>"
#1   echo "<body>"
#1   echo "<h1>Error</h1>"
#1   echo "<p>File upload failed.</p>"
#1   echo "</body>"
#1   echo "</html>"
#1fi
#1
#1 Clean up
#1rm "$TEMP_FILE"


## Read the form data
#read -r QUERY_STRING
#
## Parse the query string
## This assumes the form uses the GET method and the file is uploaded correctly
## Note: For file uploads, you typically need to use POST and handle multipart/form-data
## This is a simplified example for demonstration purposes
#
## Extract values from the query string
## Note: This is a basic parsing method; consider using a more robust method for production
#IFS='&' read -r -a params <<< "$QUERY_STRING"
#declare -A form_data
#
#for param in "${params[@]}"; do
#    IFS='=' read -r key value <<< "$param"
#    form_data["$key"]=$(echo -e "${value//+/ }")  # Decode URL-encoded values
#done
#
## Get the values
#title="${form_data[title]}"
#desc="${form_data[desc]}"
#tags="${form_data[tags]}"
#mime="${form_data[mime]}"
#
## Handle file upload (this is a placeholder; actual handling requires POST and multipart)
## For demonstration, we will just print the values
#-echo "<html>"
#-echo "<head><title>$title_</title></head>"
#-echo "<body>"
#-echo "<h1>$title_</h1>"
#-echo "<p>$desc_</p>"
#-echo "<p>Tags: $tags_</p>"
#-echo "<p>Media Type: $mime_</p>"
#-echo "</body>"
#-echo "</html>"
#
## Note: In a real-world scenario, you would need to handle file uploads properly,
## including saving the uploaded file to a specific directory and validating the input.
