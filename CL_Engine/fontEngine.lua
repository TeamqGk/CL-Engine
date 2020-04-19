local fontEngine = {}

local scale
local x,y,r,sx,sy
local HelloWorld
local lg = love.graphics

function fontEngine.createFont(pFontFileTTF,pFontName)
  fontEngine[pFontName] = {}
  local new = fontEngine[pFontName]
  for i=1, 100 do
    new[i] = love.graphics.newFont( pFontFileTTF, i )
  end
end
--

function fontEngine.createText(pFont, pTextString, pSizeOrigine, pScale, pX, pY, pCenter)
-- pSizeOrigine = 14, si la taille de ton texte que ta choisi initialement a ton projet est de 14 par exemple
-- pScale = 1, par défaut car c'est ton scale que tu utilise pendant le draw
  local scale = pScale * 100
  local scaleSizeFont = math.floor( (pSizeOrigine / 100 ) * scale )
--  print("scaleSizeFont : "..scaleSizeFont)
  local new = {}
  for index, vars in pairs (fontEngine) do
    if index == pFont then
      new.string = pTextString
      new.text = love.graphics.newText( vars[scaleSizeFont], pTextString)
      new.w = new.text:getWidth()
      new.h = new.text:getHeight()
      new.ox = new.w * 0.5
      new.oy = new.h * 0.5
      if pCenter then
        new.x = pX + new.ox
        new.y = pY - new.oy
      else
        new.x = pX
        new.y = pY
      end
    end
  end
  return new
end
--

function fontEngine.load() -- exemple
  --
  scale = 1
  --
  x = lg.getWidth() * 0.5
  y = lg.getHeight() * 0.5
  r = 0
  sx = scale
  sy = scale
  --
  -- fontEngine.createFont("my_font_file.ttf","my_font") -- create a font
  fontEngine.createFont("CL_Engine/CL_Font/Mango_Drink.ttf","mango") -- create a font
  --
  HelloWorld = fontEngine.createText("mango","Hello World, i'm a text for testing Mango_Drink.ttf", 50, scale)
  --
end
--

function fontEngine.draw()
  love.graphics.draw( HelloWorld.text , x, y, r, sx, sy, HelloWorld.ox, HelloWorld.oy)
end
--

function love.load()
  fontEngine.load()
end
function love.draw()
  fontEngine.draw()
end
--

fontEngine.load()

return fontEngine