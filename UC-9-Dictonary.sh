#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateInMonth=200
empRatePerHr=50
numOfWorkingDays=40

totalEmpHr=0
totalWorkingDays=0

#emphrs-spent-perday
function getWorkHours()
{
	case $randomCheck in
				$isPartTime )
					empHrs=5
				;;
				$isFullTime )
					empHrs=10
				;;
				*)
					empHrs=0
				;;
	esac
}

#totalwage/totalsalary
function getEmpWage()
{
	echo $(($totalEmpHr*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxRateInMonth &&
	$totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$((RANDOM%3))
	getWorkHours
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

#totalSalary=$((totalEmpHr*empRatePerHr))
totalSalary=$( getEmpWage ) 
echo ${dailyWages[@]} #dailywage #160 0 80

echo ${!dailyWages[@]} #days #keys = 1 2 3 4
echo ${#dailyWages[@]} #totalno-ofdays
