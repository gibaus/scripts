#!/bin/bash

# Vérifier si WSL est installé
if ! command -v wsl.exe &> /dev/null; then
    echo "WSL n'est pas installé. Veuillez l'activer via les fonctionnalités Windows."
    exit 1
fi

# Fonction pour installer une distribution
install_distro() {
    echo "Liste des distributions disponibles pour installation :"
    wsl.exe --list --online

    read -p "Entrez le nom de la distribution que vous souhaitez installer (ex: Ubuntu-22.04) : " DISTRO

    # Vérifier si la distribution est déjà installée
    INSTALLED=$(wsl.exe --list --quiet | grep -i "^$DISTRO$")
    if [ -n "$INSTALLED" ]; then
        echo "La distribution $DISTRO est déjà installée."
        exit 0
    fi

    echo "Installation de $DISTRO..."
    wsl.exe --install -d "$DISTRO"

    echo "Installation et configuration de $DISTRO terminées !"
}

# Fonction pour supprimer une distribution
delete_distro() {
    echo "Distributions WSL installées :"
    wsl.exe --list --verbose

    read -p "Entrez le nom de la distribution que vous souhaitez supprimer : " DISTRO

    echo "Suppression de $DISTRO..."
    wsl.exe --unregister "$DISTRO"

    echo "La distribution $DISTRO a été supprimée avec succès !"
}

# Menu principal
echo "Que voulez-vous faire ?"
echo "1) Installer une distribution"
echo "2) Supprimer une distribution"
read -p "Entrez votre choix (1 ou 2) : " CHOICE

case $CHOICE in
    1) install_distro ;;
    2) delete_distro ;;
    *) echo "Choix invalide. Veuillez exécuter le script à nouveau." ;;
esac
