#!/usr/bin/bash


# Plusieurs façon de faire boucler notre variable : 
# for i in 1 2 3 4 5 6 7 8 9 10 
# for i in $(seq 1 10)
# for i in {1..10.}
# for (i=1;i<11;i++)
# Celle que j'utilise permet de faire de l'incrémentation à la fin 

for i in {1..10..1}
do
 echo "Je suis un script qui arrive à faire une boucle $i"
done
