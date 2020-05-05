#! /bin/bash
#echo $1
MESSAGE=$((python3 /home/ubuntu/json_extract.py $1) 2>&1)
echo "Sending $MESSAGE ..."
/home/ubuntu/return.sh $MESSAGE
