#!/bin/bash

# Naked variables
echo

# when is a variable "naked", i.e., lacking the '$' in front?
# when it is being assigned, rather than referenced.

#assignment
a=879
echo "The value of \"a" is $a."

# Assignment using 'let'
let a=16+5
echo "The value of \"a\" is now $a."
echo

#in a 'for' loop (really, a type of disguised assignment):

echo -n "Values of \"a\" in the loop are: "
for a in 7 8 9 11
do
  echo -n "$a "
done

echo
echo
#in a 'read' statement (also a type of assignment):
echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."

echo
exit 0

