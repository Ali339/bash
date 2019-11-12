#!/bin/bash
# A script, accepts files as command line arguments
# Back up the files in /tmp
# Log the backup status

#################################################
# INPUT: take a string/strings as input         #
# OUTPUT: log the MESSAGE		        #
#################################################
log() 
{
  local MESSAGE=${@}
  echo "${MESSAGE}"
  logger -t "function.sh"  ${MESSAGE}
}
##################################################
# INPUT: Take the file name you passed on the CLI#
# OUTPUT: BACKING up the file in /tmp  		 #
##################################################

backup()
{
  #local variables for source and destination
  local FILE=${@}
  local DEST="/tmp"
  #Make sure every file name provided on CLI exist
  #If any file does not exist, exit out of the program with error prompt
  for A_FILE in $FILE
    do
      if [[ !  -f ${A_FILE} ]]
        then
          echo "File $A_FILE does not exist"
          exit 1
      fi
  done
  #After confirming every file provided on the CLI exist, simply copy all the files
  for A_FILE in $FILE
    do
      #part after ${DEST} is for renaming the file with the extention of date and 
      #username
      cp -p ${A_FILE} ${DEST}/$(basename $A_FILE).$(date +%F).$(id -un)
    done
  #Checking if copy is successful
  #Logging according to the status of the copy by calling the log function
  if [[ $? -eq 0 ]]
    then 
      log "$FILE backed up in $DEST"
    else
      log "$FILE :BACKUP FAILED"
  fi
}
######################################################################################


#Making sure you provide atleast one file on CLI to copy
if [[ ${#} == 0  ]]
  then
    echo "File name not provided. Exiting...."
    exit 1
  else 
    #Calling the backup function with the file(s) you provided on CLI as argument(s)
    backup ${@}

fi
