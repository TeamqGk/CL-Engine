

local gameProject = {} -- Game Name of Project (use for Scene Engine and others), you can do not use SceneEngine : just call your load update and draw in main the directly...

local game = {} -- simple Game Vars for this game Example

local debug = true -- debug at true for Helping dev

-- Now a example for load all images in folder "img/" :
--cl.img.autoload(pFolder) if not pFolder, loading the  "img/" folder.
-- see example :
cl.img.autoload()

-- now all image in folder "img/" is loading in this table : 
-- image = {all index of images}
-- image[1]
-- image[2] etc.

-- Generate a local for game Example :  
-- list img of project
local crosshair,  rifle,  background,  dogPist,  dogJump,  dogTaking,  dogLaught,  duckFly_X,  duckFly_Y,  duckDeath,  duckFalling,  board,  bullets, grass, exitImg, exitQuad
-- lsit Animations of project
local dogPistAnim,  dogJumpAnim,  dogTakingAnim,  dogLaughtAnim,  duckFly_XAnim,  duckFly_YAnim,  duckDeathAnim,  duckFallingAnim, exitAnim
-- local list sounds
local musicGame, ambiant, shootgun


function _Game() end -- simple Structural Squelette for code (you can remove it)

function game.load()
  game.level = 1
  --
  game.exit = false
  game.play = true
end
--

function game.setCursor()
  --  mouseCrossHair = love.mouse.newCursor( crosshair.file, crosshair.ox, crosshair.oy ) -- creer un crosshair
  --  cl.mouse.setCursor(mouseCrossHair) -- change cursor


  cl.mouse.setVisible(false) -- true visible, false not visible



--  cl.mouse.lockOnScreen(true/false) -- lock mouse to windows
  cl.mouse.setPosition(cl.screen.ox, cl.screen.oy) -- centre la souris au milieu de la fenetre du jeu au lancement
end
--

function game.crosshairUpdate(dt)
  crosshair:setPos(cl.mouse.getPosition())
  --
  if game.play == true then
    cl.mouse.setVisible(false)
    cl.mouse.lockOnScreen(true)
  else
    cl.mouse.lockOnScreen(false)
    cl.mouse.setVisible(true)
--    if cl.AABB(x1,y1,w1,h1, x2,y2,w2,h2) then
    if cl.AABB(cl.mouse.x, cl.mouse.y, cl.mouse.w, cl.mouse.h,    exitAnim.x, exitAnim.y ,exitAnim.w ,exitAnim.h) then
      game.exit = true
    else
      game.exit = false
    end
  end
  --
end
--


function _GAME_ENGINE() end -- simple Struct code (you can remove it)

--
function gameProject.setImages()
  -- exit logo
  exitImg = image[15]
  exitQuad = cl.img.newQuad(exitImg, 1, 3)
  exitAnim = cl.img.newAnim(exitImg, #exitQuad)
  exitAnim:setCenter() -- utilise les valeurs Origine x et y au draw...
  exitAnim:setPos(cl.screen.ox, cl.screen.oy) -- on place l'image au centre de l'ecran



  -- imgs
  grass           = image[14]
  grass:setPlan(3)
  grass:setSizes(cl.screen.w,cl.screen.h) -- sx = 3.125	, sy = 2.5


  crosshair       = image[1]
  crosshair:setCenter()
  crosshair:setColor(cl.color.green)


  rifle           = image[2]

  background      = image[3]
  background:setPlan(4)
  background:setSizes(cl.screen.w,cl.screen.h) -- sx = 3.125	, sy = 2.5

  bullets         = image[13]

  -- quads : cl.img.newQuad(pImage, pLig, pCol, pStartX, pStartY, pScaleX, pScaleY)
  dogPist         = cl.img.newQuad(image[4], 1 ,5 ,0 ,0 ,3, 2)
  dogPistAnim     = cl.img.newAnim(image[4], #image[4].quad)
  dogPistAnim:setPos(10,372)
  dogPistAnim:setSpeed(50)


  dogJump         = cl.img.newQuad(image[5]   ,1 ,3 ,0 ,0 ,3, 2)
  dogJumpAnim     = cl.img.newAnim(image[5]   ,#image[5].quad)
  dogJumpAnim:setPos(cl.screen.ox,305)
  dogJumpAnim:setSpeed(40)


  dogTaking       = cl.img.newQuad(image[6]   ,1 ,2 ,0 ,0 ,3, 2)
  dogTakingAnim   = cl.img.newAnim(image[6]   ,#image[6].quad)
  dogTakingAnim:setPos(cl.screen.ox,305)
  dogTakingAnim:setSpeed(40)

--  dogLaught       = cl.img.newQuad(image[7]   ,5 ,1 ,0 ,0 ,3.125, 2.5)
--  duckFly_X       = cl.img.newQuad(image[8]   ,5 ,1 ,0 ,0 ,3.125, 2.5)
--  duckFly_Y       = cl.img.newQuad(image[9]   ,5 ,1 ,0 ,0 ,3.125, 2.5)
--  duckDeath       = cl.img.newQuad(image[10]  ,5 ,1 ,0 ,0 ,3.125, 2.5)
--  duckFalling     = cl.img.newQuad(image[11]  ,5 ,1 ,0 ,0 ,3.125, 2.5)
--  board           = cl.img.newQuad(image[12]  ,5 ,1 ,0 ,0 ,3.125, 2.5)  
end
--

function gameProject.setSounds()
  -- Music and Ambiant
  musicGame = cl.audioEngine.addMusic("music/1_Ducks_Landing_In_Water.mp3", true, 1, true) -- cl.audioEngine.addMusic(pFile, pLoop, pVolume, pPlay)
  ambiant = cl.audioEngine.addMusic("music/2_Sunny_Day.mp3", true, 1, true) -- cl.audioEngine.addMusic(pFile, pLoop, pVolume, pPlay)

  -- Sounds of Game
  shootgun = cl.audioEngine.addSound("sound/1_shotgun.mp3", false, 1) -- cl.audioEngine.addSound(pFile, pLoop, pVolume)
  -- load others sounds here
end
--

function gameProject.load()
  game.setCursor()
  --
  gameProject.setImages()
  gameProject.setSounds()
  --
  game.load()
end
--

function gameProject.update(dt)
  game.crosshairUpdate(dt)
end
--

function gameProject.draw()

-- background (dernier plan)
  background:draw()


  -- 4 eme
  dogJumpAnim:draw()
-- duck here


  -- 3 eme
  grass:draw()

-- 2 eme
  dogPistAnim:draw()

-- 1er plan
  if game.play then
    crosshair:draw()
  end

-- TEST
-- image[4]
--  image[4]:draw() -- ok
--  dogPist:draw() -- ok

-- image[4].quad[1]
--image[4].quad[5]:draw() -- ok
--  dogPist[5]:draw() -- ok

-- image[4].anim[1]
--  image[4].anim[1]:draw() -- ok
--  dogPistAnim:draw() -- ok !

--  dogJumpAnim:draw()

  if not game.play then
    exitAnim:draw()
  end
end
--

function _CONTROLS()end -- simple Struct code (you can remove it)

function gameProject.keypressed(key, scancode)
  if love.keyboard.getScancodeFromKey("a") == "q" then key = key else key = scancode end
--  print(key)
  if debug then
    if key == "kp+" then
      if game.level + 1 > #image[1].quad then
        game.level = 1
      else
        game.level = game.level + 1
      end
    end
  end  
  --
  if key == "escape" then
    game.play = not game.play
  end
  --
end
--

function gameProject.mousepressed(x,y,button)
--  print(button)
  if not game.play then
    if button == 1 then
      if game.exit then
        love.event.quit()
      end
    end
  else
    if button == 1 then
      shootgun:stop()
      shootgun:play()
    end
  end
end
--

return gameProject