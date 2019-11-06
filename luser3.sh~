#!/bin/bash
# Creating a scripts to add user on the local system


# make sure the script is being executed with superuser privileges.
if [[ "$UID" -ne "0" ]]
then
	echo "Please use sudo or run this script as a root user"
	exit 1
fi
# Get the username (login).
read -p "Enter the user name you want to add : " USER_NAME
# Get the real name (contents for the description field).
read -p "Enter the real name of the user you want to add : " COMMENT
# Get the password.
read -p "Enter the user's password to set : " PASSWORD
# Create the user with the password.
useradd -c "${COMMENT}" -m  ${USER_NAME}


# Check to see if the useradd command succeeded.
if [[ "${?}" != 0 ]]
then
	echo "Account cannot be created."
	exit 1
fi

# Set the password.
echo "$PASSWORD" | passwd --stdin "$USER_NAME"
# Check to see if the passwd command succeeded.

# Force password change on first login.
passwd -e "${USER_NAME}"
# Display the username, password, and the host where the user was created
echo 
echo
echo "username :     $USER_NAME"
echo "password :     ${PASSWORD}"
echo "host :         $HOSTNAME"
exit 0


###what is exit stsus of a program or command
### how to take input to store in the variable from the user
