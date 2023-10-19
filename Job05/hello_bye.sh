#!/usr/bin/bash

argument=$1

if [ "$argument" = "hello" ]
then 
	echo "Bonjour, je suis un script!"

elif [ "$argument" = "bye" ] 
then
	echo "Au revoir et bonne journée"

else
	echo "hello ou bye ?"

fi
