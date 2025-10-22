
#this is called a shebang, it tells the shell what program to interpret the script with, when executed
# in this example, the script is to be interpreted and run by the bash shell.

# N.B. /sh execute the file using sh, the Bourne shell, or a compatible shell.
# N.B. /csh execute the file using csh, the C shell, or a compatible shell.

#!/bin/bash

#run as root of course

#cleanup : a script to clean up log files in /var/log

#/var/log is a standard directory in linux and unix-like operating system event logs. This directory stores time-varying information , such as system messages and errors or warnings.

cd /var/log

#you typically cat/dev/null > [something] when you want to wipe file contents while ensuring there is absolutely there is absolutely zero risk of interruption to the actual file state.

cat /dev/null > messages

cat /dev/null > wtmp


echo "Log files cleaned up."


