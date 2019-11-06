#!/bin/bash

# Display the UID and username of the user executing this script.
id="$UID"
user_name=$(id -un)

echo "$id"
echo "$user_name"

# Display if the user is the ali  user or not.
if [[ $user_name = "ali" ]]
   then echo "USER IS ALI ZAIB"
fi




     
# Display the UID.

# Only display if the UID does NOT match 0
user_id_to_test='0'
if [[ $id  != ${user_id_to_test} ]]
  then echo "your ID  does not match ${user_id_to_test}"
else echo "MATCHED"
fi 


# Test if the command succeeded.
echo "Here i am just want to test that command run successfully"
echo "$(id -unx)"
if [[ "$?" -ne 0 ]]
  then echo "echo "Mubarakan command got success""
else    echo "filed"
fi   
 

####################
