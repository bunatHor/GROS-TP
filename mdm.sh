#!/bin/bash

for arg in $@
do
	if ! [[ $arg =~ ^[^:]+$ ]]
	then
		echo "pas de : dans les noms !!"
		exit
	fi
done

if ! [[ $1 =~ (add|remove|list|change) ]]
then
	echo "nimp"
	exit
fi	

if [[ $1 =~ add ]]
then
	echo $3
	if ! [[ $3 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
	then
		echo "addresse ip invalide"
		exit
	fi
fi

if [[ $1 =~ change ]]
then
	if ! [[ $4 =~ (--name|group) ]]
	then
		echo "modification possible : --name ou --group"
		exit
	fi
fi

###### IL FAUDRA CHANGER LE NOM ET L'IP DE NOTRE MACHINE
ssh tplover@1.2.3.3 ./core.sh $1 $2 $3 $4 $5
