#!/bin/bash
log=$1
egrep -v -i \
    -e "xml|csv" \
    -e "^erro" \
    -e "ENDED:.*-.*-.*" -e "  " $log | \
    sed -e "s/-.*-.*//g" | \
    xargs echo | sed \
    -e "s/BEGIN:/\n/g" \
    -e "s/TOTAL_FILES: //g" \
    -e "s/TOTAL_FILES_ENDED: //g" \
    -e "s/TOTAL_FILES_ERROR: //g" \
    -e "s/user //g" \
    -e "s/real //g" \
    -e "s/sys //g" \
    -e "s/ /,/g" \
    | sed -e "s/^,//g" -e "s/,$//g"
