--
function cl.newColor()
  local f = {}
  --
  function f:set(r,g,b,a)
    self[1] = r
    self[2] = g
    self[3] = b
    self[4] = a
    --
    self.r = self[1]
    self.g = self[2]
    self.b = self[3]
    self.a = self[4]
  end
  --
  return f
end
--

local color = {}
--
color.white = cl.newColor()
color.white:set(1,1,1,1)
color.reset = color.white
color.red =  cl.newColor()
color.red:set(1,0,0,1)
color.green =  cl.newColor()
color.green:set(0,1,0,1)
color.blue =  cl.newColor()
color.blue:set(0,0,1,1)
color.yellow =  cl.newColor()
color.yellow:set(1,1,0,0.25)
color.black =  cl.newColor()
color.black:set(0,0,0,1)
--
function cl.setColor(pColor)
  if pColor == nil then 
    cl.resetColor()
    return
  end
  love.graphics.setColor(pColor)
end
--
function cl.resetColor()
  love.graphics.setColor(color.reset)
end
--

return color