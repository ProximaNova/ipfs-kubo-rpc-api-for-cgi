#!/bin/bash
echo "Content-type: text/plain"
echo
echo > /zc/put/cunt/selenium/run1
echo "Disabled"

#!/usr/bin/env bash
#import cgi
#import subprocess
#import datetime
#import subprocess
#from selenium import webdriver
#import selenium
#print("Content-type: text/plain");
#print();

#--fails
#process = subprocess.Popen(['python3', 'selenium.py'], stdout=subprocess.PIPE);
#output, error = process.communicate();
#print(output.decode());

#--fails
#process = subprocess.Popen(['python3', '-c', 'from selenium import webdriver;options=webdriver.ChromeOptions();options.binary_location=\"/usr/bin/brave-browser\";driver=webdriver.Chrome(options=options);driver.get(\"https://chat-gpt.org/chat\");'], stdout=subprocess.PIPE);
#output, error = process.communicate();
#print(output.decode());

#print("webserver test");

#form = cgi.FieldStorage()
#url = form.getvalue('url')
#print(url)

##!/bin/bash
#echo "Content-type: text/plain"
#echo
#url="$(echo -n "$REQUEST_URI" | sed "s/.*?url=//g")"
#urlsafe=$(echo "$url" | sed "s/:\|\/\|?\|=\|@\|&\|(\|)\|,\|+\|*\|%\|#/-/g")
#time=$(TZ=UTC date -u +%Y%m%d%H%M%S)
#echo $url
#echo $urlsafe
#echo $time
#python3 -c "from selenium import webdriver; options = webdriver.ChromeOptions(); options.binary_location = '/usr/bin/brave-browser'; driver = webdriver.Chrome(options=options); driver.get('$url'); print(driver.page_source)" > /zc/put/cunt/selenium/$time-$urlsafe
#echo "$url" > /zc/put/cunt/selenium/$time-$urlsafe.txt
