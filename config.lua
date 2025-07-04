-- Ce fichier retourne une table contenant les paramètres du jeu.
local gameName = "Eidra : Forgotten Realms"

return {
    gameName = gameName,
    windowTitle = gameName,
    version = "0.0.2-04072025-2205 Alpha",
    author = "Alain Kelleter / Alphakilo Studio",
    
    -- Paramètres d'affichage
    gameWidth = 256,
    gameHeight = 144,
    initialWindowScale = 4, -- Par exemple, 4x la résolution interne au démarrage

    -- Paramètres de langue
    defaultLanguage = "fr", -- Langue par défaut du jeu (ex: "fr", "en")

    -- Mode débogage
    debugMode = true, -- Active le mode débogage pour afficher des informations supplémentaires
    
    -- Autres paramètres (exemples)
    playerInitialHealth = 3,    
    tile_size = 16 -- Taille des tuiles en pixels (ex: 16x16)
}