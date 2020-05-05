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
echo python3 -c "import sys, json; print(json.load(job.json)['TranscriptFileUri'])"
