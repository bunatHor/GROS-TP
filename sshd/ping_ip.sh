#!/bin/bash

###################################
########## PING_IP.SH #############
###################################


file=/lecture/bdd.csv

while [ a = a ]
do
	chmod 766 $file

	total=$(wc -l $file |cut -d" " -f1)

	#if [ -f bdd.tmp ]
	#then
	rm bdd.tmp &> /dev/null
	#fi

	for i in $(seq $total)
	do
		line=$(sed -n $i\p $file )
		ip=$(sed -n $i\p $file |cut -d":" -f2)
		statut=$(sed -n $i\p $file| cut -d":" -f3)
	
		echo $line > line.tmp

		ping -c 1 -w 1 $ip &> /dev/null

		if [ $? -eq 0 ]
		then
			sed -E "s/$statut/UP/g" line.tmp >> bdd.tmp
		else
			sed -E "s/$statut/DOWN/g" line.tmp >> bdd.tmp
		fi
	done


rm line.tmp


diff bdd.tmp $file &> /dev/null

if [ $? -eq 1 ]
then
	cp bdd.tmp $file
fi

sleep 20

done

