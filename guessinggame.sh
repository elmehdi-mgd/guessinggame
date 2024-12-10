#!/bin/bash

function count_files {
    ls -1 | wc -l
}

file_count=$(count_files)

echo "Bienvenue dans le jeu de devinette !"
echo "Combien de fichiers se trouvent dans le répertoire actuel ?"

while true; do
    read -p "Entrez votre estimation : " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Veuillez entrer un nombre valide."
        continue
    fi

    if (( guess < file_count )); then
        echo "Trop bas ! Essayez encore."
    elif (( guess > file_count )); then
        echo "Trop haut ! Essayez encore."
    else
        echo "Félicitations ! Vous avez trouvé le bon nombre : $file_count"
        break
    fi
done
