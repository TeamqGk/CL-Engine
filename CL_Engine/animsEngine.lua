local animsEngine = {}


function animsEngine.create(pImage, ...) -- pImage, img1,img2,img3,etc... or pImage, numberQuadStart, numberQuadFinish

  local img = pImage

  if not img.anim then img.anim = {} end  -- Creation de la table des animations, si la table existe deja c'est qu'il s'agit d'une image de type : tilesMap

  -- recuperation des images de l'animation dans une table local
  local arg = {...} -- recup des donnees variadiques (...)
  local tableImgAnim = {}
  --
  if img.quad then
    if not arg[2] then -- pNumbers... to pNumbers...
      if type(arg[1]) == "number" then -- pNumbers... to pNumbers...
        print("create anims with alls quads ("..arg[1]..") of "..img.file)
        for i = 1, arg[1] do
          tableImgAnim[i] = img.quad[i]
        end
      end
    elseif type(arg[1]) == "number" and type(arg[2]) == "number" then -- pNumbers... to pNumbers...
      print("create anims of quad["..arg[1].."] to quad ["..arg[2].."]")
      for i = arg[1], arg[2] do
        tableImgAnim[i] = img.quad[i]
      end
    end
  else --  pImages list
    print("create anims with images")
    tableImgAnim = {...}-- peux s'ecrire aussi : tableImgAnims = arg
  end

  if #tableImgAnim == 0 then print("indiquer en parmatres les numero du quad ou bien listez les images qui composent l'animations") return false end


-- Creation de la var local de la table de l'animation
  local newAnim = {} -- on alimente la var avec le dernier index des animations que l'on viens de créer dans la table de l'image.

-- Creation des variables de l'animation
  img.anim = newAnimation(img) -- on creer l'objet
  img.anim:setAnim(#tableImgAnim) -- on indique le Nombre Total d'Animations (afin de pouvoir loop)

-- Creation du timer de l'animation
  img.anim.timer = cl.timerEngine.newTimer()--timerEngine.newTimer(pDuree, pSpeed, pLoop) if not settings, use a defaut settings

-- Ajout des images de l'animation
  for i = 1 , #tableImgAnim do -- for i = 1 TO nbImgs in Anims
--    img.anim[i] = tableImgAnim[i]
    table.insert(img.anim, tableImgAnim[i])
  end
--
  return img.anim
end
--

function animsEngine.newAnimation()
  newAnimation()
end
--

function newAnimation(pImage)
  local img = pImage
  local f = newImg()
  --
  f.type = "anim"
  f.name = img.name.." anim["..#img.anim.."]"
  f.file = img.file
  f.img = img.img
  --
  if img.quad then
    f.quad = img.quad
  end
  f.x = img.x
  f.y = img.y
  f.w_def = img.w_def
  f.h_def = img.h_def
  f.w = img.w
  f.h = img.h
  f.ox = img.ox
  f.oy = img.oy
  --
  f.rotate = img.rotate
  f.sx = img.sx
  f.sy = img.sy

  -- settings for anims
  f.current = 1
  f.total = 1
  f.speed = 30
  f.loop = true
    function f:setTimer(pDuree, pSpeed, pLoop)
    if pDuree   then self.timer.duree  = pDuree end
    if pSpeed   then self.timer.speed  = pSpeed end
    if pLoop    then self.timer.loop   = pLoop  end    
  end  
  --
  --
  function f:setDuree(pDuree)
    if not pDuree or type(pDuree) ~= "number" then pDuree = 10 end
    self.timer.duree = pDuree
  end  
  --
  function f:setSpeed(pSpeed)
    if not pSpeed or type(pSpeed) ~= "number" then pSpeed = 60 end
    self.timer.speed = pSpeed
  end
  --
  function f:setLoop(pBool)
    if not pBool or type(pBool) ~= "boolean" then pBool = true end
    self.timer.loop = pBool
  end
  --
  function f:setRun(pBool)
    if not pBool or type(pBool) ~= "boolean" then pBool = true end
    self.timer.start = pBool
  end
  --
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
    for i=1, self.total do
      local anim = self[i]
      if not pX or not pY then anim.x, anim.y = 0, 0 return end
      --
      if self.center then
        anim.x = pX - anim.ox
        anim.y = pY - anim.oy
      else
        anim.x = pX
        anim.y = pY
      end
    end
    --
  end
  --
  function f:setAnim(pNbTotalAnims)
    if pNbTotalAnims and type(pNbTotalAnims) == "number" then
      self.total = pNbTotalAnims
    end
  end
  --
  function f:update(dt)
    --
    self.timer:update(dt)
    --
    if self.timer.ready then
      self.current = self.current + 1
    end
    if self.current > self.total then
      self.current = 1
    end
  end

  function f:draw()
    cl.setColor(self.color)
    --
    self[self.current]:draw()
    --
    if self.debug then
      cl.setColor(cl.color.green)
      love.graphics.rectangle("line",self.x, self.y, self.w, self.h)
    end
    --
    cl.setColor()-- reset
  end

--
  return f
end
--

return animsEngine