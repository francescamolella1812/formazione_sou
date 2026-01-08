#!/bin/bash

echo "Numero di argomenti: $#"
echo

echo 'Usando "$@"'
for arg in "$@"; do
    echo "-> [$arg]"
done

echo
echo 'Usando "$*"'
for arg in "$*"; do
    echo "-> [$arg]"
done

