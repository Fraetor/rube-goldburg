#! /usr/bin/python3
import sys
import json

data = json.loads(sys.argv[1])
#id = data[0].split(":")
message = data["payload"]
#print("The user is ID: {} and the message is {}.".format(id, message))
#print(message)
sys.exit(message)

