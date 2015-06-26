#!/bin/bash
egrep -v -e "xml|csv" -e "  " $1 | xargs echo | sed \
    -e "s/BEGIN: /\n/g" \
    -e "s/ENDED: /\n/g" \
    -e "s/TOTAL_FILES: //g" \
    -e "s/TOTAL_FILES_ENDED: //g" \
    -e "s/TOTAL_FILES_ERROR: //g" \
    -e "s/user //g" \
    -e "s/real //g" \
    -e "s/sys //g" \
    | sed -e "s/ /,/g"
