#!/bin/bash

###############################################
# Author: ROYAL REDDY
# Date: 09-04
# Version: V1
# Purpose: Remove logs morethan 14days
################################################

SOURCE_DIRC="/tmp/sample-logs"

while read -r line
do 
    echo "Deleting the file .. $line"
    rm $line
done <<< $(find $SOURCE_DIRC -mtime +14 -type f -name '*.log')