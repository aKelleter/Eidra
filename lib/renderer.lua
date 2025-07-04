-- lib/renderer.lua

local Renderer = {}

local gameCanvas
local gameWidth
local gameHeight

--- Initialise le Renderer avec la configuration du jeu.
--- @param cfg Table de configuration contenant les paramètres du jeu.
function Renderer.init(cfg)
    gameWidth = cfg.gameWidth
    gameHeight = cfg.gameHeight
    gameCanvas = love.graphics.newCanvas(gameWidth, gameHeight)
end

--- Retourne le canvas du jeu.
function Renderer.getGameCanvas()
    return gameCanvas
end

--- Retourne la largeur interne du jeu.
function Renderer.getGameWidth()
    return gameWidth
end

--- Retourne la hauteur interne du jeu.
function Renderer.getGameHeight() 
    return gameHeight
end

--- Dessine le contenu du jeu sur le canvas et l'affiche à l'écran.
-- @param drawGameContentCallback Fonction de rappel pour dessiner le contenu du jeu.
function Renderer.draw(drawGameContentCallback)
    love.graphics.setCanvas(gameCanvas)
    love.graphics.clear(0.2, 0.2, 0.2, 1)

    if drawGameContentCallback then
        drawGameContentCallback()
    end

    love.graphics.setCanvas()

    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    local scaleX = math.floor(screenWidth / gameWidth)
    local scaleY = math.floor(screenHeight / gameHeight)
    local scale = math.min(scaleX, scaleY)

    local scaledWidth = gameWidth * scale
    local scaledHeight = gameHeight * scale

    local offsetX = math.floor((screenWidth - scaledWidth) / 2) -- S'assurer que les offsets sont des entiers
    local offsetY = math.floor((screenHeight - scaledHeight) / 2) -- S'assurer que les offsets sont des entiers

    love.graphics.draw(gameCanvas, offsetX, offsetY, 0, scale, scale)
end

return Renderer