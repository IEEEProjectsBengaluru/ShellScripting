#!/bin/bash

# Variable assignment
echo 'Variable assignment'

# Assign a value to a variable
WORD='script'
#Note: There shouldnt be any space betweern word, = and value
# Best practice is to keep all charaters of a  variables as uppercase

# Display that value using the variable.
echo "$WORD"

# $<VariableName> - referencing the variables


# Demonstrate that single quotes causes variables to NOT get referenced
echo '$WORD'


# combine the variable with hard-coded text
echo "This is a shell $WORD"


# Display the contents of a vairable using an alternative syntax.
echo "This is a shell ${WORD}"

# Append text to the variable.
echo "${WORD}ing is fun!"

# Show how NOT to append text to a variable
# This doesnt work
echo "$WORDing is fun!"


# Create a new variable
ENDING='ed'

# Combine the two variables.
echo "This is ${WORD}${ENDING}."


# Change the valued stored in the ENDING variable. (Reassignment)
ENDING='ing'
echo "${WORD}${ENDING} is fun!"


