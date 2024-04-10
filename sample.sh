#!/bin/bash

while getopts s:t: flag
do
    case "${flag}" in
        s) SOURCE_DIRC=${OPTARG};;
        t) DURATION=${OPTARG};;
    esac
done


DELETE="delete"
ARCHIEVE="archieve"
FILES=$(find $SOURCE_DIRC -mtime +$DURATION -type f -name '*.log')


# ACTION="Please Choose your action: "
echo "What is your choice of action:"

select ACTION in delete archieve none
do
   case $ACTION in
        delete) 
         echo "delete" ; break
         ;; 
        archieve)
         echo "archieve" ; break
          ;;
        none) 
         break 
          ;;
        *) echo "Invalid selection" 
          ;;
   esac
done
echo "SOURCE_DIRC: $SOURCE_DIRC"
echo "DURATION: $DURATION"
echo "ACTION: $ACTION"


if [ $ACTION == $DELETE ]
then  
  if [ ! -d "$SOURCE_DIRC" ]; then
  echo -e "$R ERROR:: $SOURCE_DIRC does exist.$N"
  fi

  while IFS= read -r line
  do 
      echo -e "Deleting the file .. $R $line $N"
      rm -rf $line
  done <<< $FILES
fi 

if [ $ACTION == $ARCHIEVE ]
then  
  echo "Enter Destination Direcory"
  read -r DESINATION_DIRC
  zip -9 "$DESINATION_DIRC/log.zip" $FILES
fi 




