#!/bin/bash

########################################################################
#
#   Description : Deploiement ou mise a jour de plex sur docker
#
#   Auteur : gibaus
#
#   Date : 02/04/2022
#
########################################################################

#si option --create
  if [ "$1" == "--create" ];then

#definition de nombre de conteneurs
  nb_machine=1
  [  "$2" != "" ] && nb_machine=$2

# creation des conteneur
  echo "Création du/des conteneur/s"
  for i in $(seq 1 $nb_machine);do 
  docker run -tid --name $USER-alpine-$i alpine:latest
  echo "Conteneur $USER-alpine-$i créé"
  done

  echo "j'ai créé ${nb_machine} conteneur"

# si option --drop
  elif [ "$1" == "--drop" ];then

  echo "Supression des conteneurs"
  docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')
  echo "Fin de suppression"

# si option --start
elif [ "$1" == "--start" ];then

  echo ""
  echo " notre option est --start"
  echo ""

# si option --ansible
elif [ "$1" == "--ansible" ];then

  echo ""
  echo " notre option est --ansible"
  echo ""

# si option --infos
elif [ "$1" == "--infos" ];then

  echo ""
  echo " notre option est --infos"
  echo ""

# si aucune option affichage de l'aide
else

  echo "

Options :
		- --create : lancer des conteneurs

		- --drop : supprimer les conteneurs créer par le deploy.sh
	
		- --infos : caractéristiques des conteneurs (ip, nom, user...)

		- --start : redémarrage des conteneurs

		- --ansible : déploiement arborescence ansible

"

fi

