local imgEngine = {}

image = {}

function imgEngine.autoload(pFolder)
  if not pFolder then pFolder = "img" end
  --
  if not image then image = {} end
  --
  image.current = 1
  --
  local filesTable = love.filesystem.getDirectoryItems("img")
  --
  for k,file in ipairs(filesTable) do
--    print("le dossier module contient l'element n°"..k.." : "..file)
    if string.find(file,".jpg") or string.find(file,".png") then
      --
      local new = newImg()
      new.type = "image"
      new.typeLoad = "imgEngine Autoload"
      new.name = string.gsub(file,".jpg","") or string.gsub(file,".png","")
      new.file = pFolder.."/"..tostring(file)
      new.img = love.graphics.newImage("img/"..file)
      new.x = 0
      new.y = 0
      --
      new.w_def = new.img:getWidth()
      new.h_def = new.img:getHeight()
      new.w = new.w_def
      new.h = new.h_def
      new.ox = new.w * 0.5
      new.oy = new.h * 0.5
      --
      new.rotate = 0
      new.sx = 1
      new.sy = 1
      --
      table.insert(image, new) -- add file to table for require
      if debug.img then print("img detected and loaded to table img["..#image.."] : "..new.name.."\n") end
    else
      print("ceci n'est pas une image valide : "..file.."\n") -- if not .lua file, then print this in output
    end
  end
end
--

function imgEngine.newImg()
  local f = newImg()
  -- TODO: a faire, Si on veux aujouter une image qui n'est pas dans le repertoire img (un dossier par scene par exemple... et qu'on ne veux pas charger ttes les images)
  return f
end
--

function newImg()
  local f = cl.newPlan()
  f:setPlan(1)

  --
  function f:init() -- list of variables
    f.type = ""
    f.typeLoad = "imgEngine.newImg()"
    f.name = ""
    f.file = ""
    f.img = ""
    f.isVisible = true
    --
    f.x = 0
    f.y = 0
    --
    f.w_def = 0
    f.h_def = 0
    f.w = 0
    f.h = 0
    f.ox = 0
    f.oy = 0
    --
    f.rotate = 0
    f.sx = 1
    f.sy = 1
    --
    f.center = false
    --
    f.debug = false
    --
    f.color = {1,1,1,1}
    --
  end
  --
  function f:isVisible(pBool)
    if pBool == nil then self.isVisible = true return end
    self.isVisible = pBool
  end
  --
  function f:setPos(pX, pY)
    if not pX or not pY then self.x, self.y = 0, 0 return end
    --
    if self.center then
      self.x = pX - self.ox
      self.y = pY - self.oy
    else
      self.x = pX
      self.y = pY
    end
    --
  end
  --
  function f:setScale(pSX, pSY)
    if pSX == nil or pSY == nil then self.sx, self.sy = 1, 1 return end
    self.sx = pSX
    self.sy = pSY
    -- 
    self.w = self.w_def * pSX
    self.h = self.h_def * pSY
  end
  --
  function f:setSizes(pW, pH)
    if pW == nil  or pH == nil then print("error ! setSizes need Widht and Heigh to change size !") return end
    self.w = pW
    self.h = pH
    --
    self.sx = pW / self.w_def
    self.sy = pH / self.h_def
  end
  --
  function f:setColor(pColor)
    if pColor == nil then self.color = {1,1,1,1} return end
    self.color = pColor
  end
  --
  function f:setCenter(pBool)
    if pBool == nil then self.center = true return end
    self.center = pBool
  end
  --
  -- ANIMATIONS
  --
  function f:setLoop(pLoop)
    if pLoop == nil then self.frame.loop = true return end
    self.frame.loop = pLoop    
  end
  --
  -- DEBUG
  --
  function f:setDebug(pBool)
    if pBool == nil then self.debug = true return end
    self.debug = pBool
  end
  --
  function f:update(dt)
    if self.anim then
      self.anim:update(dt)
    end
  end
  --  
  function f:draw()
    if f.isVisible then
      --
      cl.setColor(self.color)
      --
      love.graphics.draw(self.img, self.x, self.y, self.rotate, self.sx, self.sy)
      --
      if self.debug then
        cl.setColor(cl.color.green)
        love.graphics.rectangle("line",self.x, self.y, self.w, self.h)
      end
      --
      cl.setColor()
    end
  end
  --

  --
  f:init()
  --
  return f
end
--

function imgEngine.update(dt)
  if #image >= 1 then
    for i = #image, 1, -1 do
      local img = image[i]
      img:update(dt)
    end
  end
end
--

return imgEngine