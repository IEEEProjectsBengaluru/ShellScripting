# Arithmetic expansion and valuation

Lets do some arithmetic operations.

## Arithmetic expansion

- Lets say if you want to add two numbers together and assign them to a variable
  - $ NUM=$(( 1 + 2 ))
  - $ echo ${NUM}
- Here (( represents arithmetic expansion. Lets try some other operations
  - $ NUM=$(( 10 – 1))
  - $ echo ${NUM}
  - $ NUM=$(( 2 \* 8 ))
  - $ echo ${NUM}
  - $ NUM=$(( 6 / 2 ))
  - $ echo ${NUM}
  - $ NUM=$(( 6 / 4 ))
  - $ echo ${NUM}
  - Bash doesnt do any rounding. Doesnt support floating airthmetic.
  - $ NUM=$(( 6 % 4 ))
  - $ echo${NUM}
- If you need to work on floating point number then you need to use ‘bc’ which stands for basic calculator.
  - $ type -a bc
  - $ bc -h
  - $ echo ‘6 / 4’ | bc – l
  - $ bc -l
- We can also use variables to perform arithmetic operations
  - $ A=’3’
  - $ B=’6’
  - $ X=$(( A+B))
  - $ echo ${X}
  - $ (( X++ )
  - $ echo ${X}
  - $ (( X+= 20))
  - $ echo ${X}

## Arithmetic operations using awk command

- There is other way to display decimal numbers using awk,
  - $ awk ‘ BEGIN {print 6/4}’

## Arithemtic operations using ‘let’ command

- We can also use let function to do math operations as well
  - $ type -a let
  - $ help let | less
  - $ let NUM=’2+3’
  - $ echo ${NUM}

## Arithmetic operations using ‘expr’ command

- expr – this is an another command which process an expressions and results in stdout
  - $ $ type -a expr
  - $ expr 1 + 1
  - $ NUM=$(expr 2 + 3)
  - echo ${NUM}

