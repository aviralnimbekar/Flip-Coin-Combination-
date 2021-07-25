#!/bin/bash -x

echo "Welcome to Flip Coin Combination Program"

head=0
declare -A Singlet

for ((i=1; i<=50; i++))
do
	randomCheck1=$((RANDOM % 2))
	randomCheck2=$((RANDOM % 2))

	if (( $randomCheck1 == 0 && $randomCheck2 == 0 ))
	then
        	echo "H H"
		((Singlet[HH]++))
	elif (( $randomCheck1 == 0 && $randomCheck2 == 1 ))
	then
		echo "H T"
		((Singlet[HT]++))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 0 ))
        then
                echo "T H"
                ((Singlet[TH]++))
	
	else
		echo "T T"
		((Singlet[TT]++))
	fi
done

echo ${!Singlet[@]}
echo ${Singlet[@]}

HH=`awk "BEGIN {print (${Singlet[HH]}/50)*100}"`
echo "HH = $HH%"
HT=`awk "BEGIN {print (${Singlet[HT]}/50)*100}"`
echo "HT = $HT%"
TH=`awk "BEGIN {print (${Singlet[TH]}/50)*100}"`
echo "TH = $TH%"
TT=`awk "BEGIN {print (${Singlet[TT]}/50)*100}"`
echo "TT = $TT%"

