#!/bin/bash

for arg in $@
do
	if ! [[ $arg =~ ^[^:]+$ ]]
	then
		echo "pas de : dans les noms !!"
		exit
	fi
done



if ! [[ $1 =~ (add|remove|list|change|--help) ]]
then
	echo "commandes disponibles: add|remove|list|change "
	echo "--help pour avoir de l'aide"
	exit
fi	

if [[ $1 =~ --help ]]
then
	echo "BIENVENUE SUR L'AIDE DE MDM.SH"
	echo ""
	echo ""	
	echo "utilisation add : "
	echo " bash mdm.sh add [nom-machine] [ip-machine] [nom-groupe]"
	echo ""
	echo "utilisation remove"
	echo " bash mdm.sh remove [nom-machine] [nom-groupe]"
	echo ""
        echo "utilisation list"
        echo " bash mdm.sh list [nom-groupe]"
	echo ""
        echo "utilisation change"
        echo " bash mdm.sh change [nom-machine] [nom-groupe] OPTION arg"
	echo ""
	echo "Une option à la fois!"
	echo "OPTIONS : --name (arg --> [nouveau-nom-machine])"
	echo "          --group (arg --> [nouveau-nom-groupe])"
	echo ""
	exit
fi

if [[ $1 =~ add ]]
then
	
	if ! [[ $3 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
	then
		echo "addresse ip invalide"
		exit
	else
		echo "$2 $3 added in group $4"
	fi
fi

if [[ $1 =~ change ]]
then
	if ! [[ $4 =~ ^(--name|--group)$ ]]
	then
		echo "modification possible : --name ou --group"
		exit
	fi
fi

###### IL FAUDRA CHANGER LE NOM ET L'IP DE NOTRE MACHINE
ssh tplover@1.2.3.3 ./core.sh $1 $2 $3 $4 $5
