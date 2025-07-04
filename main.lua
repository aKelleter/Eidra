function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest") -- ESSENTIEL pour le pixel art

    gameWidth = 256
    gameHeight = 144 -- Votre résolution interne du jeu

    -- === NOUVEAU === Configuration de la fenêtre et du mode d'affichage
    love.window.setMode(gameWidth * 3, gameHeight * 3, {
        fullscreen = false,        -- Commence en mode fenêtré
        resizable = true,          -- Permet le redimensionnement par l'utilisateur
        vsync = true,              -- Synchronise les images avec le moniteur (évite le "tearing")
        minwidth = gameWidth,      -- Largeur minimale (votre résolution de base)
        minheight = gameHeight,    -- Hauteur minimale (votre résolution de base)
        highdpi = false            -- Important pour le pixel art, ne pas laisser le système doubler les pixels
    })

    -- Création du canvas pour le rendu à la résolution du jeu
    gameCanvas = love.graphics.newCanvas(gameWidth, gameHeight)
end

function love.update(dt)
    -- Logique de jeu ici (mouvement du personnage, collisions, etc.)
end

function love.draw()
    -- Dessine tout le jeu sur le canvas (votre résolution interne)
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
    local scale = math.min(scaleX, scaleY) -- Pour conserver le ratio 16:9 sans déformer

    local scaledWidth = gameWidth * scale
    local scaledHeight = gameHeight * scale

    local offsetX = (screenWidth - scaledWidth) / 2
    local offsetY = (screenHeight - scaledHeight) / 2

    love.graphics.draw(gameCanvas, offsetX, offsetY, 0, scale, scale)

    -- Optionnel : Dessiner des informations de débogage sur l'écran principal (hors canvas)
    -- love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end

-- === NOUVEAU === Gestion des entrées clavier pour le plein écran
function love.keypressed(key)
    if key == "f11" or (key == "return" and love.keyboard.isDown("alt")) then
        -- Basculer entre le mode fenêtré et le plein écran
        -- love.window.setFullscreen() sans argument bascule l'état actuel
        love.window.setFullscreen(not love.window.getFullscreen())
    end
end