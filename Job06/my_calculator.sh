#!/usr/bin/bash

if [ "$2" = "+" ]
then 
	OPE=$(expr $1 + $3)
	echo "SOMME = $OPE"
elif [ "$2" = "-" ]
then 
	OPE=$(expr $1 - $3)
	echo "DIFF = $OPE"
elif [ "$2" = "/" ]
then 
	OPE=$(expr $1 / $3)
        echo "DIV = $OPE"
elif [ "$2" = "*" ]
then 
	OPE=$(( $1 * $3))
        echo "MULTI = $OPE"
fi	




