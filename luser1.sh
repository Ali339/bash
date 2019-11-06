# Display if the user is the root user or not.
user_name=$(id -un)
# Display the UID
echo "Your user ID is ${user_name}"
# Display the username
echo "Your user name is ${USER}"

# Display if the user is the root user or not.

if [ $UID == 0 ] 
then
  echo "You are root"
elif [ $UID -eq  500 ]
then
  echo "You are not root but your id is ${UID}"
else
  echo "Sorry my friend you are a looser" 
fi

##declaring variables
#how to use simple if else statement
