#!/bin/bash

###############################################
# Author: ROYAL REDDY
# Date: 09-04
# Version: V1
# Purpose: Remove logs morethan 14days
################################################

SOURCE_DIRC=$1
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ ! -d "$SOURCE_DIRC" ]; then
  echo -e "$R ERROR:: $SOURCE_DIRC does exist.$N"
fi

FILES_DELETE=$(find $SOURCE_DIRC -mtime +$DURATION -type f -name '*.log')

while IFS= read -r line
do 
    echo -e "Deleting the file .. $R $line $N"
    rm -rf $line
done <<< $FILES_DELETE