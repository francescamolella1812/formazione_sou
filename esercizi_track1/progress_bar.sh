#!/bin/bash

# progress-bar2.sh
# Author: Graham Ewart (with reformatting by ABS Guide author).
#Used in ABS Guide with permission (thanks!).

#invoke this script with bash. It doesn't work with sh.

interval=1
long_interval=10

{
	trap "exit" SIGUSR1
	sleep $interval; sleep $interval
	while true
	do
	  echo -n '.' # Use dots.
	  sleep $interval
	done; } & #start a progress bar as a background process.

pid=$!
trap "echo !; kill -USR1 $oid; wait $pid" EXIT #to handle ^C.

echo -n 'Long-running process'
sleep $long_interval
echo ' Finished!'

kill -USR1 $pid
wait $pid #stop the progress bar.
trap EXIT
exit $?
