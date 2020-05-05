#! /bin/bash

JOB_ID=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)

aws transcribe start-transcription-job \
     --cli-input-json "{
    \"TranscriptionJobName\": \"$JOB_ID\", 
    \"LanguageCode\": \"en-GB\", 
    \"MediaFormat\": \"mp3\", 
    \"Media\": {
        \"MediaFileUri\": \"https://rube-goldburg-message.s3.eu-west-2.amazonaws.com/message.mp3\"
    }
}"
sleep 30
aws transcribe get-transcription-job \
     --transcription-job-name "$JOB_ID" > job.json
aws transcribe get-transcription-job --transcription-job-name "$JOB_ID" > job.json
until grep COMPLETED job.json; do sleep 10; aws transcribe get-transcription-job --transcription-job-name "$JOB_ID" > job.json; done
TRANSCRIPT_URL=$(cat job.json | python3 -c 'import sys, json; print(json.load(sys.stdin)["TranscriptionJob"]["Transcript"]["TranscriptFileUri"])')
rm job.json
wget -O transcription.json "$TRANSCRIPT_URL"
MESSAGE=$(cat transcription.json | python3 -c 'import sys, json; print(json.load(sys.stdin)["results"]["transcripts"][0]["transcript"])')
rm transcription.json
echo $MESSAGE
echo "Sending $MESSAGE ..."
return.sh $MESSAGE
