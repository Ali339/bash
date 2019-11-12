#!/bin/bash
# A script, accepts files as command line arguments
# Back up the files in /tmp of remote host
# Log the backup status

#################################################
# INPUT: take a string/strings as input         #
# OUTPUT: log the MESSAGE		        #
#################################################
log() 
{
  local MESSAGE=${@}
  echo "${MESSAGE}"
  logger -t "backup.sh"  ${MESSAGE}
}
##################################################
# INPUT: Take the file name you passed on the CLI#
# OUTPUT: BACKING up the file in /tmp of remote	 #
##################################################

backup()
{
  #local variables for source and tar_destination and remote sys
  local FILE=${@}
  local MYTAR="/tmp/$(id -un).$(date +%F).tar.gz"
  local REMOTE_HOST=192.168.1.171
  #Make sure every file or dir  provided on CLI exist
  #If any file does not exist, exit out of the program with error prompt
  for A_FILE in $FILE
    do
      if  [ -f ${A_FILE} ] || [ -d ${A_FILE} ]
        then
          echo "GOOD TO PROCEED" >/dev/null

	else
          echo "$A_FILE is not a file or directory "
          exit 1
      fi
  done

  #After confirming every file or dir  provided on the CLI exist, simply tar  all the files
  tar -czf  ${MYTAR}  ${FILE} 
  #check the tar is successful or not
  #if any error during error, dont go to scp, exit out of the program with fail status
  #Log the status by calling log function
  if [[ $? != 0 ]]
    then
      log "TAR unsuccessful"
      exit 1
    else
      log "TAR successful"
  fi 
  #after successful tar, copy over the remote host
  scp ${MYTAR} ${REMOTE_HOST}:${MYTAR}
  #Checking if copy is successful
  #Logging according to the status of the copy by calling the log function
  if [[ $? -eq 0 ]]
    then 
      log "$FILE backed up in ${MYTAR} of ${REMOTE_HOST}"
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
