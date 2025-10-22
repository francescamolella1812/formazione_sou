This Bash script demonstrates how to access and manage positional parameters (arguments) passed to a script from the command line.
When you run a Bash script, you can pass values after the script name. 
For example: ./scriptname 1 2 3 4 5 6 7 8 9 10 

each value can be accessed inside the script using special variables: 
$1 is the first argument , $2 is the second argument, $3 is the third argument and so on

basename removes directory path, keeping only the file name. 
-n test operator meaning "string is not null"

$* expands to all positional parameters (as a single word). 
$# expands to the number of positional parameters
[] used for test expressions in bash conditionals. 

Positional parameters are automatically assigned to variables. To access parameters above $9 you must use curly braces : ${10}, ${11}, and so on. 

$# and $* are built-in variables that tell you how many parameters were passed and what they are. 
Scripts can enforce a minimum number of required parameters, making them safer and more predictable. 

MINPARAMS=10 defines the minimum number of required command-line arguments. 

if [ $# -lt "$MINPARAMS" ] checks whether the user provided fewer than 10 parameters.


