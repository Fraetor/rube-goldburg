#! /bin/bash
echo "Converting text $1 to MP3..." >> ~/webhook.log
aws polly synthesize-speech \
    --output-format mp3 \
    --voice-id Ivy \
    --text "$1" \
    message.mp3
aws s3 cp message.mp3 s3://rube-goldburg-message/
rm message.mp3
echo "Done!" >> ~/webhook.log
