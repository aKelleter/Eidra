-- Déclaration pour l'analyse statique (si vous en avez vraiment besoin, sinon retirez)
-- love = love

-- Charger le fichier de configuration
local config = dofile("config.lua")

-- Chargement des modules
local Translation = require("lib.translation")
local Renderer = require("lib.renderer")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Initialiser la fenêtre Love2D AVANT d'initialiser le Renderer
    love.window.setMode(config.gameWidth * config.initialWindowScale, config.gameHeight * config.initialWindowScale, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        minwidth = config.gameWidth,
        minheight = config.gameHeight,
        highdpi = true -- Maintenez highdpi à true pour macOS
    })

    -- Initialiser les modules
    Translation.init(config) -- Initialiser la traduction avec la configuration    
    Renderer.init(config)

    -- Initialiser la police pixel
    local pixelFont = love.graphics.newFont("fonts/m5x7.ttf", 26) -- Mettez votre chemin et taille
    love.graphics.setFont(pixelFont)

    -- Définir le titre de la fenêtre
    if config.debugMode then
        love.window.setTitle(Translation.T("game_title")..' - '..config.version)
    else
        love.window.setTitle(Translation.T("game_title"))
    end

    -- Afficher quelques informations de démarrage (pour le débogage)
    print("--- Game Initialized ---")
    print("Game Name: " .. config.gameName)
    print("Version: " .. config.version)
    print("Window Title: " .. love.window.getTitle()) -- Récupérez le titre ACTUEL de la fenêtre
    print("Internal Resolution: " .. Renderer.getGameWidth() .. "x" .. Renderer.getGameHeight())
    print("Actual window width: " .. love.graphics.getWidth()) -- Vérifier la taille réelle de la fenêtre
    print("Actual window height: " .. love.graphics.getHeight()) -- Vérifier la taille réelle de la fenêtre
    print("------------------------")
end

function love.update(dt)
    -- Logique de jeu ici
end

function love.draw()
    Renderer.draw(function()
        
        
    end)
    if config.debugMode then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
            love.graphics.print("Window Size: " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), 10, 30)
            love.graphics.print("Internal Resolution: " .. Renderer.getGameWidth() .. "x" .. Renderer.getGameHeight(), 10, 50)
            love.graphics.print("Language: " .. Translation.getCurrentLanguage(), 10, 70)
         
            
    end
end

function love.keypressed(key)
    if key == "f11" or (key == "return" and (love.keyboard.isDown("lalt") or love.keyboard.isDown("ralt"))) then
        love.window.setFullscreen(not love.window.getFullscreen())
    end

    if key == "escape" then
        local response = love.window.showMessageBox(
            Translation.T("quit_title"),
            Translation.T("quit_message"),
            {Translation.T("quit_yes"), Translation.T("quit_no")},
            "info"
        )
        
        -- Selon vos tests précédents, response == 1 est suffisant.
        if response == 1 then 
            love.event.quit()
        end
    end
    
    if key == "l" and love.keyboard.isDown("lshift") then
        if config.defaultLanguage == "fr" then
            Translation.setLanguage("en")
            config.defaultLanguage = "en"
        else
            Translation.setLanguage("fr")
            config.defaultLanguage = "fr"
        end
        love.window.setTitle(Translation.T("game_title"))
    end
end