local screen = {}

screen.w_def = 800
screen.h_def = 600
screen.w = love.graphics.getWidth()
screen.h = love.graphics.getHeight()
screen.sx = 1
screen.sy = 1
screen.refresh = false
--
screen.ox = screen.w * 0.5
screen.oy = screen.h * 0.5
--
function screen:refreshScale()
  --
  self.w = love.graphics.getWidth()
  self.h = love.graphics.getHeight()
  --
  self.sx = self.w / self.w_def
  self.sy = self.h / self.h_def
  --
  self.ox = screen.w * 0.5
  self.oy = screen.h * 0.5
  --
  self.refresh = true
  --
end
--

return screen