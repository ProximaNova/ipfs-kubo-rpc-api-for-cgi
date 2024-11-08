#!/usr/bin/env bash
export DISPLAY=:0
if [[ $(cat /zc/put/cunt/selenium/run1) == "Yes do it" ]]; then
    url="$(cat /zc/put/cunt/selenium/run2)"
    urlsafe=$(echo "$url" | sed "s/:\|\/\|?\|=\|@\|&\|(\|)\|,\|+\|*\|%\|#/-/g")
    time=$(TZ=UTC date -u +%Y%m%d%H%M%S)
    python3 -c "import time; from selenium import webdriver; options = webdriver.ChromeOptions(); options.binary_location = \"/usr/bin/brave-browser\"; driver = webdriver.Chrome(options=options); driver.get(\"$url\"); print(driver.page_source); time.sleep(10); driver.close();" > /zc/put/cunt/selenium/$time-$urlsafe
    echo "$url" > /zc/put/cunt/selenium/$time-$urlsafe.txt
fi
