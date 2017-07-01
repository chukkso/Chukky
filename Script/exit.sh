#!/bin/bash
set -e
expr 2 + 2
echo $?
wait

rm nkem.txt
echo $?
wait

expr 3 - 2 
echo $?

