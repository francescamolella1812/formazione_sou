#!/bin/bash

echo hello
echo $? #exit status 0 returned because command executed successfully.

lskdf #unrecognized command.

echo $? # non-zero exit status returned --command failed to execute.
echo

exit 113 #will return 113 to shell. # to verify this, type "echo $?" after script terminates.

# By convention, an 'exit 0' indicates success,
# + while a non-zero exit value means an error or anomalous condition.
# See the "Exit Codes With Special Meanings" appendix
