#!/bin/bash

DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA | jq '.[0].positive')
NEGATIVE=$(echo $DATA | jq '.[0].negative')
DEATHS=$(echo $DATA | jq '.[0].deaths')
HOSPITALIZED=$(echo $DATA | jq '.[0].hospitalized')
TODAY=$(date)

echo "On $TODAY, there were $POSITIVE positive covid cases, there were $NEGATIVE negative tests, and $HOSPITALIZED hospitalized"
