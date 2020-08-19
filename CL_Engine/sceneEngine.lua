local sceneEngine = {}
sceneEngine.scenes = {}
sceneEngine.current = nil

function sceneEngine:addScene(module, name, pSetActiveScene)
  local newScene = {}
  newScene.name = name
  newScene.module = module
  table.insert(self.scenes, newScene)
  if pSetActiveScene == true then
    self.current = self.scenes[#self.scenes]
  end
end
--

function sceneEngine:setScene(name)
  for i = 1, #self.scenes do
    if name == self.scenes[i].name then
      self.current = self.scenes[i]
      if not self.current.module.loadScene then
        sceneEngine:load()
      end
      return
    end
  end

  print("ereur, la scene "..name.." n'existe pas !")
end
--

function sceneEngine:load()
  if not self.current then
  else
    if self.current.module.load ~= nil then
      if not self.current.module.loadScene then
        self.current.module.load()
        self.current.module.loadScene = true
      end
    end
  end
  --
end
--

function sceneEngine:update(dt)
  if not cl.screen.refresh then cl.screen:refreshScale() end
  --
  if not self.current then
  else
    if self.current.module.update ~= nil then
      self.current.module.update(dt)
    end
  end
  --
  cl.update(dt)
  --
end
--

function sceneEngine:draw()
  --
  love.graphics.scale( cl.screen.sx, cl.screen.sy )
  --

  if not self.current then
  else
    if self.current.module.draw ~= nil then
      self.current.module.draw()
    end
  end
  --
  cl.draw()
  --
end
--

function sceneEngine:keypressed(key, scancode)
  if not self.current then
  else
    if self.current.module.keypressed ~= nil then
      self.current.module.keypressed(key, scancode)
    end
  end
end
--

function sceneEngine:keyreleased(key, scancode)
  if not self.current then
  else
    if self.current.module.keyreleased ~= nil then
      self.current.module.keyreleased(key, scancode)
    end
  end
end
--

function sceneEngine:mousepressed(x, y, button, isTouch)
  if not self.current then
  else
    if self.current.module.mousepressed ~= nil then
      self.current.module.mousepressed(x,y,button)
    end
  end
end
--

function sceneEngine:mousereleased(x, y, button, isTouch)
  if not self.current then
  else
    if self.current.module.mousereleased ~= nil then
      self.current.module.mousereleased(x,y,button)
    end
  end
end
--


return sceneEngine