# Eidra : Forgotten Realms



## 🚀 À Propos du Projet

"Eidra : Forgotten Realms" est un projet de jeu 2D de type action-aventure, inspiré par la série légendaire The Legend of Zelda. Mon objectif est de recréer le gameplay captivant et l'exploration de donjons emblématique de **Zelda: A Link to the Past**, tout en adoptant le style artistique charmant et détaillé.

## ✨ Fonctionnalités (Actuelles & Prévues)

### Fonctionnalités Actuelles :
* **Moteur de rendu Pixel Perfect :** Le jeu est affiché à une résolution interne de `256x144` pixels et mis à l'échelle proprement pour s'adapter aux écrans modernes (2K, 4K), garantissant un rendu pixel art fidèle.
* **Fenêtre redimensionnable :** La fenêtre du jeu peut être redimensionnée par le joueur.
* **Basculement Plein Écran :** `F11` ou `Alt + Entrée` permet de passer en mode plein écran ou revenir en mode fenêtré.
* **Structure de base :** Fichier de configuration externe (`config.lua`) pour gérer facilement les paramètres du jeu (nom, titre, version, résolution, etc.).

### Fonctionnalités Prévues :
* Mouvement du joueur (8 directions) et animations de base.
* Système de tuiles (tilesets) pour la création de cartes et d'environnements.
* Implémentation des collisions basiques.
* Système d'inventaire et d'objets.
* Ennemis et combats simples.
* Exploration de donjons et résolution d'énigmes.
* ...

## 🛠 Technologies Utilisées

* **Moteur de jeu :** [Love2D](https://love2d.org/) (Framework de développement de jeux 2D)
* **Langage de programmation :** [Lua](https://www.lua.org/)
* **Outil de Pixel Art :** [Aseprite](https://www.aseprite.org/) (Recommandé pour la création des assets)
* **Éditeur de Cartes :** [Tiled Map Editor](https://www.mapeditor.org/) (Prévu pour la conception des niveaux)

## 🎮 Comment Jouer / Lancer le Projet

Pour lancer ce projet, vous devez avoir [Love2D](https://love2d.org/) installé sur votre machine.

1.  **Clonez le dépôt :**
    ```bash
    git clone https://github.com/aKelleter/Eidra.git
    cd Eidra
    ```
2.  **Lancez le jeu :**
    * **Windows :** Ouvrez votre terminal (CMD ou PowerShell), naviguez jusqu'au répertoire de votre jeu, et utilisez la commande suivante (adaptez le chemin vers `love.exe` si nécessaire) :
        ```bash
        "C:\Program Files\LOVE\love.exe" .
        # Ou si love.exe est dans votre PATH :
        love .
        ```
        (Le `.` indique le répertoire actuel, qui doit contenir `main.lua` et `config.lua`).
    * **macOS / Linux :**
        ```bash
        love .
        ```
    * **Alternative (simple) :** Sur Windows, vous pouvez aussi simplement faire glisser le dossier `Eidra` (celui qui contient `main.lua`) sur l'exécutable `love.exe` (situé généralement dans `C:\Program Files\LOVE\`).

## ⚙️ Structure du Projet

* `main.lua` : Le script principal du jeu, point d'entrée de Love2D.
* `config.lua` : Fichier de configuration contenant les paramètres globaux du jeu (nom, version, résolution, etc.).
* `assets/` (à créer) : Dossier pour stocker toutes les ressources du jeu (sprites, tilesets, sons, musiques...).
* `lib/` (à créer) : Dossier pour les bibliothèques Lua tierces ou modules interne de code réutilisables.

## 🤝 Contribution

Ce projet est un prototype avant le projet définitif mais les suggestions et les retours sont les bienvenus ! Si vous avez des idées, des corrections ou des améliororations, n'hésitez pas à ouvrir une issue ou à soumettre une Pull Request.

## 📄 Licence

Ce projet est sous licence [MIT License](LICENSE) - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 👤 Auteur

* **[Alain Kelleter / aKelleter GitHub](https://github.com/aKelleter)**

---
*Fait avec ❤️ et la passion de créer des mondes imaginaires.*
