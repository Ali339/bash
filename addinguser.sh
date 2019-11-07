#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "$UID" != 0 ]]
then
	echo "Please use sudo or be root to run ${0} script"
	exit 1
fi
# If the user doesn't supply at least one argument, then give them help.
if [[ "${#}" -lt 1 ]]
then
	echo "USAGE: user_name [comments...]"
	echo "You need to provide atleast user_name to add"
	echo "You can ptionally  provide comments like real name,DOB etc "
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
useradd -c "${COMMENT}"  -m ${USERNAME}

# Check to see if the useradd command succeeded.
if [[ ${?} != 0 ]]
then 
	echo "User cannot be added"
	echo
	exit 1
fi
# Set the password.
echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Check to see if the passwd command succeeded.
if [[ ${?} != 0 ]]
then 
	echo "User cannot be added"
        echo
        exit 1
fi

# Force password change on first login.
passwd -e ${USERNAME}
# Display the username, password, and the host where the user was
#created.
echo
echo "user :  ${USERNAME}"
echo "password :  ${PASSWORD}"
echo "A new user in ${HOSTNAME} has been added with above credentials "
