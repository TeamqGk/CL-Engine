cl = {}

function _REQUIRE() end

-- ## Utility's
cl                  = require("CL_Engine/globalsEngine")
cl.color            = require("CL_Engine/colorEngine")
cl.fontEngine       = require("CL_Engine/fontEngine")
--


-- ## Modules -- structural with moduleNameEngine for clarifing local vars :
cl.timerEngine      = require("CL_Engine/timerEngine")
cl.audioEngine      = require("CL_Engine/audioEngine")
cl.planEngine       = require("CL_Engine/planEngine")
cl.imgEngine        = require("CL_Engine/imgEngine")
cl.quadEngine       = require("CL_Engine/quadEngine")
cl.animsEngine      = require("CL_Engine/animsEngine")
cl.sceneEngine      = require("CL_Engine/sceneEngine")
cl.screen           = require("CL_Engine/screenEngine")
cl.mouse            = require("CL_Engine/mouseEngine")
--

-- ## Help Module
cl.debug             = require("CL_Engine/debugEngine")


-- Interface shoort for User's Friendly :
cl.img = cl.imgEngine
cl.img.newQuad = cl.quadEngine.create
cl.img.newAnim = cl.animsEngine.create
cl.img.newAnimation = cl.animsEngine.create
cl.timer = cl.timerEngine 
cl.scene = cl.sceneEngine



-- ## Core Modules run here
function cl.load()
end
--

function cl.update(dt)
  cl.audioEngine.update(dt)
  cl.imgEngine.update(dt)
  cl.mouse.update()
end
--

function cl.draw()
  cl.audioEngine.draw()
end
--

return cl