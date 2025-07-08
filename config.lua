-- Ce fichier retourne une table contenant les paramètres du jeu.
local gameName = "Eidra : Forgotten Realms"

return {
    gameName = gameName,
    windowTitle = gameName,
    version = "0.0.3-08072025-1555 Alpha",
    author = "Alain Kelleter / Alphakilo Studio",
    
    -- Paramètres d'affichage
    gameWidth = 384, --256,
    gameHeight = 216, --144,
    initialWindowScale = 5, -- Par exemple, 4x la résolution interne au démarrage

    -- Paramètres de langue
    defaultLanguage = "fr", -- Langue par défaut du jeu (ex: "fr", "en")

    -- Mode débogage
    debugMode = true, -- Active le mode débogage pour afficher des informations supplémentaires
    
    -- Autres paramètres (exemples)
    playerInitialHealth = 3,    
    tile_size = 16 -- Taille des tuiles en pixels (ex: 16x16)
}