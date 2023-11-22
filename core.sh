#!/bin/bash




if [ $1 = add ]
then
	echo "$2:$3:none:$4" >> bdd.csv

elif [ $1 = remove ]
then
	sed -i "/^$2.*$3$/d" bdd.csv

elif [ $1 = change ]
then
	if [ $4 = --ip ]
	then
		sed -i -E "s/^$2:[^:]*:([^:]*:$3)$/$2:$5:\1/g" bdd.csv

	elif [ $4 = --name ]
	then
		sed -i -E "s/^$2:([^:]*:[^:]*:$3)$/$5:\1/g" bdd.csv
	
	elif [ $4 = --group ]
	then
		sed -i -E "s/^($2:[^:]*:[^:]*):$3$/\1:$5/g" bdd.csv
	fi

elif [ $1 = list ]
then
	grep -E ":$2$" bdd.csv |cut -d":" -f1,2 |sed "s/:/ | /g"
fi

