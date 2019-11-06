#!/bin/bash

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable.
WORD='script'

# Display that value using the variable.
echo $WORD

# Demonstrate that single quotes cause variables to not get expanded.
echo '$WORD'
echo "$WORD"

# Combine the variable with hard-coded text.
echo "This is shell $WORD"
echo 'This is shell $WORD' #to avoid variable expansion 

# Display the contents of the variable using an alternative syntax.
echo "This is shell ${WORD}"
# Append text to the variable.
echo "${WORD}ing is fun"
# Show how NOT to append text to a variable.
echo "$WORDing is fun"
# Create a new variable
ENDING="ed"

# Combine the two variables.
echo "This is ${WORD}${ENDING}"

# Change the value stored in the ENDING variable.  (Reassignment.)
ENDING="ing"
echo "${WORD}${ENDING} is fun"
# Reassign value to ENDING.
ENDING="s"
echo "You need to write alot of ${WORD}${ENDING}"

# Declaring a variable with the value of another variable

word=$WORD
echo "You need to write alot of ${word}${ENDING}"
