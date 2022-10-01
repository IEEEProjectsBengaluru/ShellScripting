# Case statements

The goal of this exercise is to understand the usage of case in shell scripting.


## Steps

- Case is a shell builtin, to know more execute,
  - $ type -a shell
  - $ help case
- Say that you want to display a output message based on the arguments passed to a script. If you are using if statement then you would do,
  - if [[ "${1}" = 'start' ]]
  - then
  -   echo 'Starting.'
  - elif [[ "${1}" = 'stop' ]]
  - then
  -   echo 'Stopping.'
  - elif [[ "${1}" = 'status' ]]
  - then
  -  echo 'Status:'
  - else
  -  echo 'Supply a valid option.' >&2
  -  exit 1
  - fi
- The same code can be written using case statements, like
  - #This ideal format of a case statement follows.
  - case "${1}" in
  - start)
  - echo 'Starting.'
  - ;;
  - stop)
  - echo 'Stopping.'
  - ;;
  - status|state|--status|--state)
  - echo 'Status:'
  - ;;
  - \*)
  - echo 'Supply a valid option.' >&2
  - exit 1
  - ;;
  - esac
- \* in pattern matching means anything. See $ man bash to know more (/pattern matching)
- ‘|’ can be used to support multiple patterns . This info is available in $ help case
- --state or --status can also be provided as parameter.
- Save and run,
  - $ ./CaseStatements.sh start
  - $ ./CaseStatements.sh stop
  - $ ./CaseStatements.sh status
  - $ ./CaseStatements.sh --status
- To end one block use ;; and to end case type “esac” at the end.
- Same can be written using following lines,
  - #Here is a compact version of the case statement.
  - case "${1}" in
  - start) echo 'Starting.' ;;
  - stop) echo 'Stopping.' ;;
  - status) echo 'Status:' ;;
  - \*)
  - echo 'Supply a valid option.' >&2
  - exit 1
  - ;;
  - esac
