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

# si option --create

if [ "$1" == "--create" ];then

echo " Creation du conteneur DBXPlex en cour de construction "



# si option --drop

elif [ "$1" == "--drop" ];then

echo ""
echo " notre option est --drop en cour de construction"
echo ""

# si option --start

elif [ "$1" == "--start" ];then

echo ""
echo " notre option est --start enc our de construction"
echo ""
# si option --infos

elif [ "$1" == "--infos" ];then

echo ""
echo " notre option est --infos enc our de construction"
echo ""

# si option --maj

elif [ "$1" == "--maj" ];then

echo""
echo " mise a jour du conteneur DBXPlex "
echo ""

docker rm DBXPlex -f

echo""
echo "suppression de l'image DBXPlex"
echo ""

docker rmi plexinc/pms-docker -f

echo""
echo "rechargement de la derniere version DBXPlex"
echo""

docker run -tid --name=DBXPlex --restart=always --net=host -e PUID=33 -e PGID=33 -e TZ=Europe/Paris -v /home/dbx/data0:/data -v /home/dbx/lib0/plex/config:/config -v /home/dbx/cache0/plex:/transcode -p 127.0.20.3:32400:32400 -p 127.0.20.3:32400:32400/udp -p 127.0.20.3:32469:32469 -p 127.0.20.3:32469:32469/udp -p 127.0.20.3:5353:5353/udp -p 127.0.20.3:1900:1900/udp plexinc/pms-docker:latest

echo""
echo "demarrage de DBXPlex"
echo""

docker start DBXPlex

echo""
echo " DBXPlex est operationel"

# si aucune option affichage de l'aide
else

echo "
Options :
            - -- create : creer un conteneur docker plex DBXPlex

            - -- drop : supprime le DBXPlex creer par deploy-plex.sh

            - -- start : demarre ou redemarre DBXPlex

            - -- infos : donne les infos sur DBXPlex

            - -- maj : met a jour  DBXPlex
"


fi

