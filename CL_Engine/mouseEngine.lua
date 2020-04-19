local mouse = {}


mouse = love.mouse

mouse.x, mouse.y = mouse.getPosition()
mouse.w, mouse.h = 1,1
mouse.ox, mouse.oy = 0.5,0.5


function mouse.update()
  mouse.x, mouse.y = mouse.getPosition()
end
--

function mouse.lockOnScreen(pBool)
  if type(pBool) ~= "boolean" then pBool = true end
  cl.mouse.setGrabbed(pBool)
end
--


return mouse