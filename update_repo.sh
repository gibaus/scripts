#!/bin/bash

# Définir le chemin du répertoire du repo
REPO_DIR="$HOME/gitlab/gibaus"

# Aller dans le répertoire du repo
cd "$REPO_DIR" || exit

# Activer l'environnement virtuel si nécessaire (décommente si besoin)
# source venv/bin/activate  

# Exécuter le script Python
python3 main.py

# Ajouter les modifications à Git
git add .

# Faire un commit avec un message horodaté
git commit -m "Mise à jour automatique: $(date +"%Y-%m-%d %H:%M:%S")"

# Pousser sur le repo distant
git push origin main  # Remplace "main" par ta branche # Exécuter le script Python
