#!/bin/bash -x

isPresent=0
randomCheck=$((RANDOM%2))

if [ $randomCheck == $isPresent ]
then
	empHrs=8
	empRateHr=20
	salary=$(($empHrs*$empRateHr))
else
	salary=0
fi
echo $salary
