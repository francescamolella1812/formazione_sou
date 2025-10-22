This script demonstrates how Bash commands return an exit status code. Exit sgatuses are essential for testing wheter commands succes or fail and they form the foundation of control flow in shell scripting.


In unix-like system, every command returns an exit code: 0 is success. non-zero is an error or abnormal condition.
The special variable '$?' sores the exit status of the last executed command.

this script shows how to diplay and interpret those exit codes. 


lskdf attempts to run a non-exixtent command. Bash cannot find it, so it returns a non-zero exit code. 
exit 113 terminates the script and explicitly returns exit code 113 to the shell. 


