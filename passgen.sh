#!/bin/bash
#Generating a list of the passwords randomly


#A random number as a password
echo 1
PASSWORD=${RANDOM}
echo "$PASSWORD"
#######################################################################
echo 2
PASSWORD=${RANDOM}${RANDOM}${RANDOM}
echo "$PASSWORD"
########################################################################
#Password using epoch  date
echo 3 
PASSWORD=$(date +%s)
echo "$PASSWORD"
########################################################################
#PASSWORD using epoch nano secs
echo 4
PASSWORD=$(date +%s%N)
echo "$PASSWORD"
#########################################################################

#Password using sha256sum 
echo 5
PASSWORD=$(date +%s%N| sha256sum | head -c 16 )
echo $PASSWORD

##########################################################################
echo 6
PASSWORD=$(date +%s%N${RANDOM}${RANDOM}${RANDOM}  | sha256sum | head -c 48 )
echo  "$PASSWORD"
###########################################################################

echo 7
#Even a better password using special char, fold and shuf

SPECIAL_CHAR=$(echo '~!@#$%^&*()_+' | fold -w1 | shuf | head -c 1)

PASSWORD=$(date +%s%N${RANDOM}${RANDOM}${RANDOM}| sha256sum | head -c 48 )${SPECIAL_CHAR}

echo $PASSWORD
##########################################################################


###what we learn in this
#how to generate a random num
#epoch date
#hash values
#fold
#shuf

