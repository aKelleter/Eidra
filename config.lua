-- Ce fichier retourne une table contenant les paramètres du jeu.
local gameName = "Eidra : Forgotten Realms"

return {
    gameName = gameName,
    windowTitle = gameName,
    version = "0.0.1-04072025-1615 Alpha",
    author = "Alain Kelleter / Alphakilo Studio",
    
    -- Paramètres d'affichage
    gameWidth = 256,
    gameHeight = 144,
    initialWindowScale = 4, -- Par exemple, 4x la résolution interne au démarrage
    
    -- Autres paramètres (exemples)
    playerInitialHealth = 3,
    debugMode = true,
    tile_size = 16 -- Taille des tuiles en pixels (ex: 16x16)
}