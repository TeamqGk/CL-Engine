local debug = {}


--("#################################################################################")
--("##                              Debug                                          ##")
--("#################################################################################")
-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end



debug.coreEngine = false -- it's set to false by defaut..
debug.animsEngine = false -- it's set to false by defaut..
debug.audioEngine = false -- it's set to false by defaut..
debug.colorEngine = false -- it's set to false by defaut..
debug.fontEngine = false -- it's set to false by defaut..
debug.imgEngine = false -- it's set to false by defaut..
debug.quadEngine = false -- it's set to false by defaut..
debug.sceneEngine = false -- it's set to false by defaut..

function cl:setDebug(pParams)
  if not pParams then return false end
  if type(pModule) ~= "string" then return false end
  if type(pParams) == "boolean" then debug.help() return false end
end
--
function debug.help()
  local text = ""
  text = text.."cl:setDebug(Boolean, Module) Manual :".."\n"
  text = text.."Boolean cl:setDebug(True or False) to see all Debug".."\n"
  text = text.."You can jsut use this for activate/deactivate all debug cl:setDebug()".."\n"
  text = text..[[Module cl:setDebug("name") to see only with Module(s) for debug specific module]].."\n"
  print(text)
end
--

return debug