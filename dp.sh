#!/bin/bash

# Supprimer les images non utilisées
docker image prune -a -f

# Supprimer les conteneurs arrêtés
docker container prune -f

# Supprimer les volumes non utilisés
docker volume prune -f

# Supprimer les réseaux non utilisés
docker network prune -f

echo "Nettoyage des images Docker terminé."
