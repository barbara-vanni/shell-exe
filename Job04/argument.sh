#!/usr/bin/bash

#nouveau fichier
fichier_nouveau=$1
#ancien fichier
fichier_source=$2

cp $fichier_source $fichier_nouveau && echo "Le contenu du fichier $fichier_source a été copié dans le fichier $fichier_nouveau."

