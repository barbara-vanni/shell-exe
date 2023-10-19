#!/usr/bin/bash

#Set the filename

filename="Shell_Userlist.csv"
CHEMIN="/mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job09"

echo "début de script $(date)" >> save_logs.txt

# Vérifiez si le fichier CSV existe
if [[ ! -f $filename ]]; then
    echo "Le fichier $filename n'existe pas."
    exit 1
fi

# Initialisation d'un tableau pour chaque colonne 
id=()
prenom=()
nom=()
mdp=()
role=()

# on remplit les différents tableaux 
while IFS=',' read -r col1 col2 col3 col4 col5 col6
do
    id+=("$col1")
    prenom+=("$col2")
    nom+=("$col3")
    mdp+=("$col4")
    role+=("$col5")
done < "$filename"

#Création des utilisateurs
for i in $(seq 1 12)	
do
username="${prenom[$i]}_${nom[$i]}" 
userhome="$CHEMIN/users/$username"
userpasswd="${mdp[$i]}"
statut="${role[$i]}"

if [ "$statut" == "Admini" ]
    then
	    groupe="Admin"
    else
	    groupe="Users"  
fi

 #sudo userdel -r "${username}" && sudo groupdel -f "${username}" 

# Vérifiez si l'utilisateur existe déjà
if ! id "$username" > /dev/null;
then

  # L'utilisateur n'existe pas, on le crée
  sudo useradd "${username}" --uid "${id[$i]}" --home "$userhome" --groups $groupe
  echo "$username:$userpasswd" | sudo chpasswd

  # Si l'utilisateur est en admin
  if [ "$statut" == "Admini" ]; 
  then
      sudo usermod -aG sudo "$username"
  fi

fi

done

echo "fin script $(date)" >> save_logs.txt

