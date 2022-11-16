#!/bin/bash

isPartTime=1
isFullTime=2
empRatePerHr=20
numOfWorkingDays=20
maxRateWorkInMonth=100 #maxhours

totalEmpHr=0
totalWorkingDays=0

while [[ $totalEmpHr -lt $maxRateWorkInMonth && $totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$(($RANDOM%3))
	case $randomCheck in
				$isFullTime )
					empHrs=8
				;;
				$isPartTime )
					empHrs=4
				;;
				*)
					empHrs=0
				;;
	esac
	totalEmpHr=$(($empHrs + $totalEmpHr))
done

salary=$(($totalEmpHr*$empRatePerHr))
echo $salary
