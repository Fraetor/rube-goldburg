#! /bin/bash
MESSAGE=$((python3 /home/ubuntu/json_extract.py $1) 2>&1)
./stdin-to-mp3.sh $MESSAGE
./transcribe.sh
