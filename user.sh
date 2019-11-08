#!/bin/bash
# Adding user in the local system
#using file descripter

# Make sure the script is being executed with superuser privileges.
if [[ "$UID" != 0 ]]
then
	echo "Please use sudo or be root to run ${0} script" >&2 #stdout to stderr
	exit 1
fi
# If the user doesn't supply at least one argument, then give them help.
if [[ "${#}" -lt 1 ]]
then
	echo "USAGE: user_name [comments...]" >&2 #stdout to stderr
	echo "You need to provide atleast user_name to add" >&2 #stdout to stderr
	echo "You can ptionally  provide comments like real name,DOB etc " >&2 #stdout to stderr
	exit 1
fi
# The first parameter is the user name.
USERNAME=${1}

# The rest of the parameters are for the account comments.
shift
COMMENT=${@}

# Generate a password.
PASSWORD=$(date +%s%N | sha256sum | head -c8)
# Create the user with the password.
#This command is going to generate stdout or stderr, simply throw  them out, to not appear on screen
useradd -c "${COMMENT}"  -m ${USERNAME} &> /dev/null

# Check to see if the useradd command succeeded.
if [[ ${?} != 0 ]]
then 
	echo "User cannot be added" >&2 #stdout to stderr
	exit 1
fi
# Set the password.
#output should not appera on the screen
echo ${PASSWORD} | passwd --stdin ${USERNAME} &> /dev/null

# Check to see if the passwd command succeeded.
if [[ ${?} != 0 ]]
then 
	echo "User cannot be added" >&2 #stdout to stderr
        exit 1
fi

# Force password change on first login.
passwd -e ${USERNAME}  &> /dev/null
# Display the username, password, and the host where the user was
#created.
echo "user :  ${USERNAME}"
echo "password :  ${PASSWORD}"
echo "A new user in ${HOSTNAME} has been added with above credentials "
echo
