#! /bin/bash

echo "Converting text $1 to MP3..."
aws polly synthesize-speech \
    --output-format mp3 \
    --voice-id Ivy \
    --text "$1" \
    message.mp3
cp message.mp3 ~/message.mp3
rm message.mp3
echo "Done!"
