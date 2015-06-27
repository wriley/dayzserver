#!/bin/bash

TODAY=$(date +"%Y%m%d")
if [ -n "$1" ]; then
    DATE=$(echo $1 | sed 's/-//g')
else
    DATE=$(date +"%Y%m%d")
fi

echo $DATE
DAYZBASE="/cygdrive/c/arma2oa"

INSTANCE="dayz_2"
if [ -n "$2" ]; then
    INSTANCE="$2"
fi

echo ${INSTANCE}
cat "${DAYZBASE}/${INSTANCE}/logs/"${DATE}*.RPT 2>/dev/null | ./medical_attention.py | grep MEDIC:

if [ "$TODAY" == "$DATE" ]; then
    ./medical_attention.py "${DAYZBASE}/${INSTANCE}/arma2oaserver.RPT" 2>/dev/null | grep MEDIC:
fi
