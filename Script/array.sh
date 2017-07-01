#!/bin/bash
# simple array list
OKONKWO=("Iloba" "Chuks" "Nkem")
for i in `echo ${OKONKWO[@]}`;
do echo "hello $i";
done
