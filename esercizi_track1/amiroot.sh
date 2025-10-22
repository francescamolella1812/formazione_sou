#!/bin/bash

# am-i-root.sh: Am i root or not?

ROOT_UID=0 #root has $UID 0.

if [ "$UID" -eq "$ROOT_UID" ] #will the real "root" please stand up?
then
  echo "You are root."
else
  echo "You are just an ordinary user (but mom loves just the same)."
fi

exit 0
#=================================================================

#Code below will not execute, because the script already exited.

#An alternate method of getting to the root of matters:

ROOTUSER_NAME=root

username='id -nu' #or... username='whoami'

if [ "$username" = "$ROOTUSER_NAME" ]
then
  echo "Rooty, toot, toot. You are root."
else
   echo "You are just a refular fella."
fi


