#! /bin/bash
PAYLOAD=$1
ID=176735987907559425

URL='http://chaos.aksan.dev:6280/cabeiri/d3345727237fa3217dddb40f2749523f'

JSON={\"id\":$ID,\"payload\":\"$PAYLOAD\"}
curl --location --request POST $URL \
--header 'Content-Type: application/json' \
--data-raw $JSON

