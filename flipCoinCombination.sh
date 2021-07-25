#!/bin/bash -x

echo "Welcome to Flip Coin Combination Program"

head=0
declare -A Singlet

for ((i=1; i<=50; i++))
do
	randomCheck1=$((RANDOM % 2))
	randomCheck2=$((RANDOM % 2))
	randomCheck3=$((RANDOM % 2))

	if (( $randomCheck1 == 0 && $randomCheck2 == 0 && $randomCheck3 == 0 ))
	then
        	echo "H H H"
		((Singlet[HHH]++))
	elif (( $randomCheck1 == 0 && $randomCheck2 == 0 && $randomCheck3 == 1 ))
	then
		echo "H H T"
		((Singlet[HHT]++))
	elif (( $randomCheck1 == 0 && $randomCheck2 == 1 && $randomCheck3 == 0 ))
        then
                echo "H T H"
                ((Singlet[HTH]++))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 0 && $randomCheck3 == 0 ))
        then
                echo "T H H"
                ((Singlet[THH]++))
	elif (( $randomCheck1 == 0 && $randomCheck2 == 1 && $randomCheck3 == 1 ))
        then
                echo "H T T"
                ((Singlet[HTT]++))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 0 && $randomCheck3 == 1 ))
        then
                echo "T H T"
                ((Singlet[THT]++))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 1 && $randomCheck3 == 0 ))
        then
                echo "T T H"
                ((Singlet[TTH]++)) 
	else
		echo "T T T"
		((Singlet[TTT]++))
	fi
done

echo ${!Singlet[@]}
echo ${Singlet[@]}

HHH=`awk "BEGIN {print (${Singlet[HHH]}/50)*100}"`
echo "HHH = $HHH%"
HHT=`awk "BEGIN {print (${Singlet[HHT]}/50)*100}"`
echo "HHT = $HHT%"
HTH=`awk "BEGIN {print (${Singlet[HTH]}/50)*100}"`
echo "HTH = $HTH%"
THH=`awk "BEGIN {print (${Singlet[THH]}/50)*100}"`
echo "THH = $THH%"
HTT=`awk "BEGIN {print (${Singlet[HTT]}/50)*100}"`
echo "HTT = $HTT%"
THT=`awk "BEGIN {print (${Singlet[THT]}/50)*100}"`
echo "THT = $THT%"
TTH=`awk "BEGIN {print (${Singlet[TTH]}/50)*100}"`
echo "TTH = $TTH%"
TTT=`awk "BEGIN {print (${Singlet[TTT]}/50)*100}"`
echo "TTT = $TTT%"
