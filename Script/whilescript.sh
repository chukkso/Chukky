#!/bin/bash

let x=1

while [ $x -lt 10 ]
do
sleep 5
echo "$x"
let x+=1
done

echo \n "DONE"
#While [ condition ]
#do 
#command
#command
#command
#done
