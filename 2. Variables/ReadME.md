**Variables in shell script**

We will see how to create variables and display them in echo command.(Assuming you have already SSH to the VM)

**Introduction**

A variable is a character string to which we assign a value. The value assigned could be a number, text, filename, device, or any other type of data. A variable is nothing more than a pointer to the actual data. The shell enables you to create, assign, and delete variables.

The name of a variable can contain only letters (a to z or A to Z), numbers ( 0 to 9) or the underscore character ( \_). By convention, Unix shell variables will have their names in UPPERCASE.

Eg: WORD=’script’

Note: there is no space in between =.

**Create a variable and display the value**

- Define a variable in the shell script which has value ‘script’ in it
  - WORD=’script’
- Display the variable using echo. Both of these syntax are valid
  - echo “$WORD”
  - echo “${WORD}”

Note:

- When you reference the variable by name we would get its value back. To do that you need to proceed with ‘$’ followed by the variable name
- In echo command double quotes(“$WORD”) is needed to print the variable value, using single quotes(‘$WORD’) will print as it is inside the single quotes.
  - echo '$WORD’
  - echo “$WORD”


**Using variables inside a hard-coded text**

- To use variables inside a hardcoded text just dereference the variable using $ sign
  - echo “ This is a shell $WORD”
  - echo “ This is a shell ${WORD}”

**Appending text to a variable**

- To append text to a variable we must use {} otherwise bash doesnt know if its a variable or printable text
  - echo “{WORD}ing is fun!”
  - echo “WORDing is fun!” # This doesnt work, this will interpret as variable WORDing

**Combining two variables**

- To combine two or more variables just use {}
  - ENDING=’ed’
  - echo “This is ${WORD}${ENDING}





