#!/bin/bash

###################################
######## SENTINELLE.SH ############
###################################

dos=/lecture

############### BOUCLE INFINIE #########################


while [ a = a ]
do
#echo "Last modified files in ' $dos ' "

last_modif=$(ls -lt --time-style +%s $dos |grep -E "^-(.+)"|sed -E 's/ +/ /g'|cut -d" " -f6 |head -1)   ##On récupère la dernière date de modification (la nanoseconde en vrai) pre-sleep"

#echo "Last modif : $last_modif"

sleep 1      							### ON SLEEP POUR ACTUALISER (TA FREQUENCE DE REFRESH)  ###

new_modif=$(ls -lt --time-style +%s $dos |grep -E "^-(.+)"|sed -E 's/ +/ /g'|cut -d" " -f6 |head -1)    #On récupère la "nouvelle" dernière date de modification (post-sleep)

#echo "New modif : $new_modif "

############################# COMPARAISON ###########################


if [ $new_modif != $last_modif ]
then

#        echo "IL Y A EU MODIF ATTENTIOOOOOOOOOON !"

	modif_file=$(ls -lt --time-style +%s $dos |grep -E "^-(.+)"|sed -E 's/ +/ /g'|cut -d" " -f7 |head -1)      #On récupère le fichier en question (attention chemin relatif)

#	echo " Last modified file : $modif_file "

	if ! [ -z $modif_file ]
	then

	bash /make_index.sh

	fi
fi

done

################ FIN BOUCLE INFINIE ###########################
