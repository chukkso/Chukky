#!/bin/bash
echo -n "Bros How far na?? Are you good or bad? Enter 1 (GOOD) or 2(BAD)"
read SITUATION
if [ $SITUATION -eq 1 ]
then 
echo "God is Good, and he remaineth faithful"
elif [ $SITUATION -ne 1 ]
#then
# echo "God is still in control and HE will SEE U Through"
#elif
#[ $SITUATION -eq 5 ]
then 
echo "we will ping gateway";
/usr/bin/ping -c4 10.0.0.1  
fi

echo "finish for now" 

sleep 1

let c ='date'

echo $c
