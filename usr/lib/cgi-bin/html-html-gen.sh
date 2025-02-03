#!/bin/bash
echo "Content-type: text/html"
echo; url="$REQUEST_URI"

# /cgi-bin/html-html-gen.sh?file=aes.7z&title=Page+Title&desc=Description&tags=Tags+%28comma-separated&mime=Media+Type%3A
# Warning: eval
#-eval $(echo "$url" | awk -F'[=&?]' '{print $2}')=$(echo "$url" | awk -F'[=&?]' '{print $3}')
#-eval $(echo "$url" | awk -F'[=&?]' '{print $4}')=$(echo "$url" | awk -F'[=&?]' '{print $5}')
#-eval $(echo "$url" | awk -F'[=&?]' '{print $6}')=$(echo "$url" | awk -F'[=&?]' '{print $7}')
#-eval $(echo "$url" | awk -F'[=&?]' '{print $8}')=$(echo "$url" | awk -F'[=&?]' '{print $9}')
#-eval $(echo "$url" | awk -F'[=&?]' '{print $10}')=$(echo "$url" | awk -F'[=&?]' '{print $11}')

#-if [ ! -z $file ]; then file_="$file"; fi
#-if [ ! -z $title ]; then title_="$title"; fi
#-if [ ! -z $desc ]; then desc_="$desc"; fi
#-if [ ! -z $mime ]; then mime_="$mime"; fi
#-if [ ! -z $tags ]; then tags_="$tags"; fi

#--cd /zd/put/bash-html-gen
#--ls
#--unixtime=$(date +%s)
#--#mkdir "$unixtime"
#--#cd "$unixtime"
cd "/zd/put/bash-html-gen/1738609879"
#pwd
#--#echo sddsdss >> ds
#--cp --update=none ../template.htm index.html


#1 Read the input from the form
#1read -r CONTENT_LENGTH
read -r CONTENT_TYPE

# Create a temporary file to store the uploaded file
TEMP_FILE=$(mktemp upload.XXXXXX)

# Read the multipart data
cat > "$TEMP_FILE"

filename="$(head -n1 "$TEMP_FILE" | tr -d \\r | sed "s/\"$//g" | sed "s/.*\"//g")"
tail -n+4 "$TEMP_FILE" | head -n-17 | head -c-2 > "$filename"
echo "$filename"

#1 Parse the uploaded file
#1BOUNDARY="$(echo "$CONTENT_TYPE" | sed -n 's/^.*boundary=$.*$$/\1/p')"
#1echo "$BOUNDARY"
#1FILE_NAME="$(grep -oP "filename=\"\K[^\"]+" "$TEMP_FILE")"
#1FILE_CONTENT=$(awk -v RS="--$BOUNDARY" -v ORS="" '/^Content-Disposition: form-data; name="file"/ {getline; print}' "$TEMP_FILE")

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
