-- Déclaration pour l'analyse statique (par exemple, pour luacheck ou d'autres outils)
love = love

-- Charger le fichier de configuration
local config = dofile("config.lua")

-- Déclarer les variables globales ou locales nécessaires
local gameCanvas
local gameWidth = config.gameWidth
local gameHeight = config.gameHeight

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest") -- ESSENTIEL pour le pixel art

    -- Utiliser les paramètres du fichier de configuration pour la fenêtre
   love.window.setMode(gameWidth * config.initialWindowScale, gameHeight * config.initialWindowScale, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        minwidth = gameWidth,
        minheight = gameHeight,
        highdpi = false
    })

    -- Définir le titre de la fenêtre au cas où setMode ne le prendrait pas toujours en compte directement
    if config.debugMode then
        love.window.setTitle(config.windowTitle..' - '..config.version)
    else
        love.window.setTitle(config.windowTitle)
    end

    -- Création du canvas pour le rendu à la résolution du jeu
    gameCanvas = love.graphics.newCanvas(gameWidth, gameHeight)

    -- Afficher quelques informations de démarrage (pour le débogage)
    print("--- Game Initialized ---")
    print("Game Name: " .. config.gameName)
    print("Version: " .. config.version)
    print("Window Title: " .. config.windowTitle)
    print("Internal Resolution: " .. gameWidth .. "x" .. gameHeight)
    print("------------------------")
end

function love.update(dt)
    -- Logique de jeu ici (mouvement du personnage, collisions, etc.)
    -- Vous pouvez aussi utiliser config.debugMode pour activer/désactiver des fonctionnalités de débogage
    -- if config.debugMode then
    --     -- Code de débogage
    -- end
end

function love.draw()
    love.graphics.setCanvas(gameCanvas)
    love.graphics.clear(0.2, 0.2, 0.2, 1) -- Couleur de fond du jeu

    -- Dessinez ici tous vos éléments de jeu (personnage, tuiles, ennemis...)
    -- love.graphics.draw(playerImage, playerX, playerY)
    -- love.graphics.draw(tileQuad, tileX, tileY)

    love.graphics.setCanvas() -- Revenir sur l'écran principal

    -- Mise à l'échelle et centrage du canvas sur l'écran réel du joueur
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    local scaleX = math.floor(screenWidth / gameWidth)
    local scaleY = math.floor(screenHeight / gameHeight)
    local scale = math.min(scaleX, scaleY)

    local scaledWidth = gameWidth * scale
    local scaledHeight = gameHeight * scale

    local offsetX = (screenWidth - scaledWidth) / 2
    local offsetY = (screenHeight - scaledHeight) / 2

    love.graphics.draw(gameCanvas, offsetX, offsetY, 0, scale, scale)

    -- Optionnel : Dessiner des informations de débogage sur l'écran principal (hors canvas)
    if config.debugMode then
        love.graphics.setColor(1, 1, 1, 1) -- Couleur blanche pour le texte
        love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
        --love.graphics.print("Version: " .. config.version, 10, 30)
    end
end

function love.keypressed(key)
    if key == "f11" or (key == "return" and (love.keyboard.isDown("lalt") or love.keyboard.isDown("ralt"))) then
        love.window.setFullscreen(not love.window.getFullscreen())
    end
end