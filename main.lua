--("#################################################################################")
--("##                          CryptoLogiq Engine Example                         ##")
--("#################################################################################")

-- First load Lib :
cl = require("Cl_Engine/coreEngine")


function love.load()
  cl.sceneEngine:load()
end
--
function love.update(dt)
  cl.sceneEngine:update(dt)
end
--
function love.draw()
  cl.sceneEngine:draw()
end
--
function love.keypressed(key, scancode)
  cl.sceneEngine:keypressed(key, scancode)
end
--
function love.mousepressed(x,y,button)
  cl.sceneEngine:mousepressed(x,y,button)
end
--

--TODO: test

--("#################################################################################")
--("##                                Load Your Game                               ##")
--("#################################################################################")

-- Write your game on a gameName.lua and require this file (or code game here but require is more structural)
--[[ Exemple for require works ! in your gameName.lua you have to add this minimum requirement for game loop works fine :

local gameName = {}
cl.sceneEngine.newScene("gameName")

function gameName.load()
end

function gameName.update(dt)
end

function gameName.draw()
end

return gameName

]]--
gameProject = require("gameProject")

--[[
Now create a sceneEngine with GameProjectName or your scene to use !
it's necessary for self auto launch :
GameProjectName.load()
GameProjectName.uptapde(dt)
and
GameProjectName.draw()
]]--
cl.sceneEngine:addScene(gameProject, "gameProject", true)


--("#################################################################################")
--("##                                Settings                                     ##")
--("#################################################################################")
--

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
--love.graphics.setDefaultFilter("nearest")

love.window.setTitle("The Hunter Preyer") -- Title projet Game
--

-- set Windows mode
local width, height = love.window.getDesktopDimensions(1)
--love.window.setMode(width,height,{fullscreen=false, vsync=0})
--love.window.maximize()

--messageBoxIntro = love.window.showMessageBox( "Ready ?", "Cliquez ici pour jouer !".."\n".."Merci bon jeu ;)", "info", true )

love.graphics.setBackgroundColor(0.5,0.5,0.5,1) -- background color
--

cl.audioEngine.setVolume(0.25) -- set Volume witch audioEngine 
--

cl:setDebug(true) -- Mode debug, help you for dev, set to false or comment this line for Release.

-- End of main.lua