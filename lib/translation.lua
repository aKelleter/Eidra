-- lib/translation.lua

local Translation = {} -- Crée une table pour contenir nos fonctions et données

-- Variable interne pour stocker la table de langue actuelle
local currentLanguageTable = {}

local defaultLanguage = "en"

function Translation.init(cfg)
    -- Initialisation de la langue par défaut
    Translation.setLanguage(cfg.defaultLanguage or defaultLanguage) -- Charge la langue par défaut spécifiée dans la configuration
    defaultLanguage = cfg.defaultLanguage or defaultLanguage
end

-- Fonction pour charger et définir la langue actuelle
function Translation.setLanguage(langCode)
    local langFilePath = "lang/" .. langCode .. ".lua"
    local loadedTable = dofile(langFilePath)
    
    -- Pour une gestion plus robuste des langues manquantes (facultatif à ce stade) :
    -- On pourrait ici charger une langue de fallback (ex: l'anglais) et
    -- fusionner les tables si des clés sont manquantes dans la langue choisie.
    
    currentLanguageTable = loadedTable
    print("Language set to: " .. langCode)
end

-- Fonction pour obtenir la langue actuelle
function Translation.getCurrentLanguage()
    return currentLanguageTable.language or defaultLanguage
end

-- Fonction de traduction principale
-- Utilisation: Translation.T("key_name")
function Translation.T(key)
    local translatedString = currentLanguageTable[key]
    if translatedString then
        return translatedString
    else
        -- Fallback ou avertissement si la clé n'est pas trouvée
        print("WARNING: Missing translation for key: " .. key .. " in current language.")
        return "MISSING_KEY_" .. key -- Retourne une clé visible pour le débogage
    end
end

return Translation -- Retourne la table Translation pour qu'elle puisse être utilisée par 'require'