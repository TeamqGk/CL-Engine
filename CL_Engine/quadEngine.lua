local quadEngine = {}

function quadEngine.create(pImage, pLig, pCol, pStartX, pStartY, pScaleX, pScaleY)
  --
  local img = pImage
  --
  if not img.quad then img.quad = {} end
  --
  local x = pStartX or 0
  local y = pStartY or 0
  local w = img.w / pCol
  local h = img.h / pLig
  --
  img.quad = newImg()
  --
  img.quad.type = "quad"
  img.quad.name = img.name.." Quad[base]"
  img.quad.file = img.file
  img.quad.img = img.img
  --
  img.quad.quad = love.graphics.newQuad(x, y, img.w, img.h, img.w, img.h)
  img.quad.x = 0
  img.quad.y = 0
  img.quad.w_def = w
  img.quad.h_def = h
  img.quad.w = w
  img.quad.h = h
  img.quad.ox = w * 0.5
  img.quad.oy = h * 0.5
  --
  img.quad.rotate = 0
  img.quad.sx = pScaleX or 1
  img.quad.sy = pScaleY or 1
  --
  if pScaleX or pScaleY then
    img.quad:setScale(pScaleX or 1, pScaleY or 1)
  end
  --
  for l = 1 , pLig do
    for c = 1 , pCol do
      --
      local newQuad = cl.newQuad()
      --
      newQuad.type = "quad"
      newQuad.name = img.name.." Quad["..(#img.quad+1).."]"
      newQuad.file = img.file
      newQuad.img = img.img
      --
      newQuad.quad = love.graphics.newQuad(x, y, w, h, img.w, img.h)
      newQuad.x = 0
      newQuad.y = 0
      newQuad.w_def = w
      newQuad.h_def = h
      newQuad.w = w
      newQuad.h = h
      newQuad.ox = w * 0.5
      newQuad.oy = h * 0.5
      --
      newQuad.rotate = 0
      newQuad.sx = pScaleX or 1
      newQuad.sy = pScaleY or 1
      if pScaleX or pScaleY then
        newQuad:setScale(pScaleX or 1, pScaleY or 1)
      end
      --
      table.insert(img.quad, newQuad)
      --
      x = x + w
    end
    --
    x = pStartX or 0
    y = y + h
    --
  end
  --
  return img.quad
end
--

function cl.newQuad()
  local f = newImg()
  --
  function f:draw()
    --
    cl.setColor(self.color)
    love.graphics.draw(self.img, self.quad, self.x, self.y, self.rotate, self.sx, self.sy)
    --
    if self.debug then
      cl.setColor(cl.color.green)
      love.graphics.rectangle("line",self.x, self.y, self.w, self.h)
    end
    cl.setColor() -- reset
    --
  end
  --
  return f
end
--

return quadEngine