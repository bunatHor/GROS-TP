#!/bin/bash

#IP=1.2.3.2 	####### L'ip de notre docker nginx
BDD=/lecture/bdd.csv
IFS=$'\n'
diff_grp=$(cat $BDD |cut -d":" -f4 |sort -u)

#echo $diff_grp |sed -E "s/ +/\n/g" > /tmp/diff_grp
#ls /result/index |sed -E "s/ +/ /g" |sort > /tmp/indexes

#asupprimer=$(diff /tmp/indexes /tmp/diff_grp |awk 'NR==2 {print $2}')

#rm -r /results/index/$asupprimer


for i in $diff_grp
do
	mkdir -p /results/index/$i 2> /dev/null
	grep -E "$i$" $BDD |cut -d":" -f 1,2,3 > /tmp/index.tmp

	awk 'BEGIN{FS=":" ; OFS="&emsp;|&emsp;" ; print "<html><body><h1>Dans quel etat peuvent bien etre nos machines ...?"} {print "<h4>"$1,$2,$3"</h4><hr>"} END{print "</body></html>"}' /tmp/index.tmp > /tmp/index.tmp2


	awk '{ if (/&emsp;DOWN/) sub(/<h4>/, "<h4 style=\"color:Tomato;\">") ; if (/&emsp;UP/) sub(/<h4>/, "<h4 style=\"background-color:MediumSeaGreen;\">") ; print $0}' /tmp/index.tmp2 > results/index/$i/index.html

	rm /tmp/index*
done


