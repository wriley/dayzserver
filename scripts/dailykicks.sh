#!/bin/bash

if [ -n "$1" ]; then
    DATE=$(date +"%Y-%m-%d" -d "$1")
else
    DATE=$(date +"%Y-%m-%d")
fi

# /cygdrive/c/Bec/Log/DayZ/BeLog/Be_2012-12-28.log
# 13:20:01 : Player #0 Benny (d7833a2bb30e03283659c7a97d85423f) has been kicked by BattlEye: Client not responding

echo $DATE
BECBASE="/cygdrive/c/Bec/Log/"

if [ -z "$2" ]; then
    DIR="Config_2"
else
    DIR="$2"
fi

echo ${DIR}
egrep -h 'has been kicked by BattlEye:' "${BECBASE}/${DIR}/BeLog/Be_"${DATE}.log 2>/dev/null
