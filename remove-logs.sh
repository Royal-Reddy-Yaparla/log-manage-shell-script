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

while IFS= read -r line
do 
    echo "Deleting the file .. $R $line $N"
    rm -rf $line
done <<< $(find $SOURCE_DIRC -mtime +14 -type f -name '*.log')