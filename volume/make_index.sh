#!/bin/bash

#IP=1.2.3.2 	####### L'ip de notre docker nginx

IFS=$'\n'
diff_grp=$(cat bdd.csv |cut -d":" -f4 |sort -u)

for i in $diff_grp
do
	mkdir $i
	grep $i bdd.csv |cut -d":" -f 1,2,3 > $i/index.html
done

	




