#!/bin/bash
# need following script
# ./filter.jq
# ./inventories.sh
# ./changeToMongoJson.sh
# ./calculate.sh
host=$1
port=$2
workers=$3
time mongo --quiet --norc --host mongodb://$host:$port/GenplusServices  < inventories.sh |awk -F"," -f calculate.sh | jq -s -R -f filter.jq | sed -f changeToMongoJson.sh | mongoimport --numInsertionWorkers=$workers --host=$host --port=$port --db=GenplusServices --collection=playerRadCoinInventory --type=json
