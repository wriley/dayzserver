#!/bin/bash

TODAY=$(date +"%Y%m%d")
if [ -n "$1" ]; then
    DATE=$(echo $1 | sed 's/-//g')
else
    DATE=$(date +"%Y%m%d")
fi

STRING=" hit by | died at | while in combat "

echo $DATE
DAYZBASE="/cygdrive/c/arma2oa"

INSTANCE="dayz_2"
if [ -n "$2" ]; then
    INSTANCE="$2"
fi

echo ${INSTANCE}
egrep --color=yes -h "$STRING" "${DAYZBASE}/${INSTANCE}/logs/"${DATE}*.RPT 2>/dev/null

if [ "$TODAY" == "$DATE" ]; then
    egrep --color=yes -h "$STRING" "${DAYZBASE}/${INSTANCE}/arma2oaserver.RPT" 2>/dev/null
fi
