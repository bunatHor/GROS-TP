#!/bin/bash

for arg in $@
do
	if [[ $arg =~ ^remove (.+) (.+) ]]
	then
	 	echo "remove:\1:\2" 

  	elif [[ $arg =~ ^add (.+) (.+) ]]
        then

  	elif [[ $arg =~ ^list (.+) (.+) ]]
        then

	elif [[ $arg =~ ^change (.+) (.+) ]]
        then


	fi
done

ssh machine@1234 './core.sh arg1'  
ssh machine@1.2.3.4 core.sh remove $1 $2
