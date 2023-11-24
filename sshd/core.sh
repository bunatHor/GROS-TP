#!/bin/bash


bdd=/lecture/bdd.csv

if [ $1 = add ]
then
	echo "$2:$3:none:$4" >> $bdd

elif [ $1 = remove ]
then
	grep -E "^$2\:.*\:$3$" $bdd &> /dev/null
	if ! [ $? -eq 0 ] 
	then
		echo "ce duo utilisateur/groupe n'existe pas"
		exit
	else
		sed -i "/^$2\:.*\:$3$/d" $bdd
		echo "$2 removed from group $3"
	fi	
	

elif [ $1 = change ]
then
	grep -E "^$2\:.*\:$3$" $bdd &> /dev/null
        if ! [ $? -eq 0 ] 
        then
                echo "ce duo utilisateur/groupe n'existe pas"
                exit
        else

		if [ $4 = --ip ]
		then
			sed -i -E "s/^$2:[^:]*:([^:]*:$3)$/$2:$5:\1/g" $bdd
			
		elif [ $4 = --name ]
		then
			sed -i -E "s/^$2:([^:]*:[^:]*:$3)$/$5:\1/g" $bdd
			echo "$2 is renamed $5 in group $3" 	
		elif [ $4 = --group ]
		then
			sed -i -E "s/^($2:[^:]*:[^:]*):$3$/\1:$5/g" $bdd
			echo "$2 is transferred from group $3 to $5"  
		fi
	fi
	
elif [ $1 = list ]
then
	echo "liste des machines du groupe $2"
	grep -E ":$2$" $bdd |cut -d":" -f1,2,3 |sed "s/:/ | /g"
fi

