#!/bin/bash

#IP=1.2.3.2 	####### L'ip de notre docker nginx
BDD=/lecture/bdd.csv
IFS=$'\n'
diff_grp=$(cat $BDD |cut -d":" -f4 |sort -u)

for i in $diff_grp
do
	mkdir -p /results/index/$i 2> /dev/null
	grep -E "$i$" $BDD |cut -d":" -f 1,2,3 > /results/index/$i/index.html
done





