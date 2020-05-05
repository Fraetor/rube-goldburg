#! /bin/bash
PAYLOAD=$1
ID=176735987907559425

URL='http://chaos.aksan.dev:6280/cabeiri/6de25d62f99913cb2f09103b0fb403ca'

JSON={\"id\":$ID,\"payload\":\"$PAYLOAD\"}
curl --location --request POST $URL \
--header 'Content-Type: application/json' \
--data-raw $JSON

