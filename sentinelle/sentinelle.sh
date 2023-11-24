#!/bin/bash

###################################
######## SENTINELLE.SH ############
###################################

dos=/lecture

############### BOUCLE INFINIE #########################


while [ a = a ]
do

last_modif=$(ls -lt --time-style +%s $dos |grep -E "^-(.+)"|sed -E 's/ +/ /g'|cut -d" " -f6 |head -1)   ##On récupère la dernière date de modification (la nanoseconde en vrai) pre-sleep"


sleep 1   ### ON SLEEP POUR ACTUALISER (TA FREQUENCE DE REFRESH)  ###

new_modif=$(ls -lt --time-style +%s $dos |grep -E "^-(.+)"|sed -E 's/ +/ /g'|cut -d" " -f6 |head -1)    #On récupère la "nouvelle" dernière date de modification (post-sleep)


############################# COMPARAISON ###########################


if [ $new_modif != $last_modif ]
then
	modif_file=$(ls -lt --time-style +%s $dos |grep -E "^-(.+)"|sed -E 's/ +/ /g'|cut -d" " -f7 |head -1)      #On récupère le fichier en question (attention chemin relatif)


	if ! [ -z $modif_file ]
	then

	bash /make_index.sh
	fi
fi

all_grp=$(cut -d":" -f4 /lecture/bdd.csv |sort -u)
res_grp=$(ls /results/index/)

for i in $res_grp
do
	echo $all_grp |grep -E "(^| )$i( |$)"
	if [ $? -eq 1 ]
	then
		rm -r /results/index/$i
	fi
	echo "<h1>liste des differents groupes de machines: </h1>" > /results/index/index.html 
	echo $all_grp >> /results/index/index.html
done

done

################ FIN BOUCLE INFINIE ###########################
