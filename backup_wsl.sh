#!/bin/bash

# Vérifier si on est bien dans un environnement WSL
if ! grep -qi microsoft /proc/version; then
    echo "❌ Ce script doit être exécuté à l'intérieur de WSL."
    exit 1
fi

# Remplacer par le chemin de ta clé USB ou le répertoire de sauvegarde souhaité
BACKUP_DIR="C:/Users/locki/Desktop/BASH/backupwsl/wsl_config_backup_$(date +%Y-%m-%d_%H-%M-%S)"
mkdir -p "$BACKUP_DIR"

echo "🔧 Démarrage de la sauvegarde de votre configuration WSL, Git, Oh My Zsh, Powerlevel10k et scripts..."

# Sauvegarder les fichiers de configuration de WSL (bashrc, zshrc, etc.)
echo "📂 Sauvegarde des fichiers de configuration..."
cp ~/.bashrc "$BACKUP_DIR/"
cp ~/.zshrc "$BACKUP_DIR/"
cp ~/.profile "$BACKUP_DIR/"
cp ~/.bash_profile "$BACKUP_DIR/"
cp ~/.zsh_history "$BACKUP_DIR/"  # Sauvegarder l'historique Zsh (facultatif)

# Sauvegarder la configuration Git
echo "📂 Sauvegarde de la configuration Git..."
cp ~/.gitconfig "$BACKUP_DIR/"
cp ~/.gitignore_global "$BACKUP_DIR/"  # Si tu utilises un fichier global gitignore

# Sauvegarder le dossier Oh My Zsh (tout le répertoire et les thèmes personnalisés)
echo "📂 Sauvegarde du dossier Oh My Zsh..."
cp -r ~/.oh-my-zsh "$BACKUP_DIR/"

# Sauvegarder la configuration Powerlevel10k (fichier ~/.p10k.zsh)
echo "📂 Sauvegarde de la configuration Powerlevel10k..."
cp ~/.p10k.zsh "$BACKUP_DIR/"

# Sauvegarder tous les scripts dans le répertoire personnel
echo "📂 Sauvegarde des scripts présents dans votre répertoire personnel..."
cp -r ~/*.sh "$BACKUP_DIR/"  # Remplace ~/scripts/ si tu utilises un autre répertoire pour tes scripts

# Sauvegarder le fichier de configuration de WSL (/etc/wsl.conf)
echo "📂 Sauvegarde du fichier /etc/wsl.conf..."
sudo cp /etc/wsl.conf "$BACKUP_DIR/"

# Sauvegarder la liste des paquets installés
echo "📦 Sauvegarde des paquets installés..."
dpkg --get-selections > "$BACKUP_DIR/installed_packages.txt"

# Sauvegarder le fichier sources.list (si existant)
echo "📂 Sauvegarde des sources APT..."
if [ -f /etc/apt/sources.list ]; then
    cp /etc/apt/sources.list "$BACKUP_DIR/"
fi

echo "✅ Sauvegarde terminée dans le répertoire : $BACKUP_DIR"
echo "   Vous pouvez maintenant restaurer cette configuration plus tard depuis votre clé USB."
