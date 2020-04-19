local timerEngine = {}

function timerEngine.newTimer(pDuree, pSpeed, pLoop, pRun)
  local new = {}
  new = newTimer()
  new.duree  = 12 or pDuree
  new.speed  = 24 or pSpeed
  new.loop   = true or pLoop
  new.start  = true or pRun
  return new
end
--


function newTimer()
  local f = {}
  --
  f.chrono   = 0
  f.duree   = 0
  f.speed   = 0
  --
  f.start    = true
  f.loop    = true
  f.ready   = false
  --
  function f:setTimer(pDuree, pSpeed, pLoop)
    if pDuree   then self.duree  = pDuree end
    if pSpeed   then self.speed  = pSpeed end
    if pLoop    then self.loop   = pLoop  end    
  end  
  --
  --
  function f:setDuree(pDuree)
    if not pDuree or type(pDuree) ~= "number" then pDuree = 10 end
    self.duree = pDuree
  end  
  --
  function f:setSpeed(pSpeed)
    if not pSpeed or type(pSpeed) ~= "number" then pSpeed = 60 end
    self.speed = pSpeed
  end
  --
  function f:setLoop(pBool)
    if not pBool or type(pBool) ~= "boolean" then pBool = true end
    self.loop = pBool
  end
  --
  function f:setRun(pBool)
    if not pBool or type(pBool) ~= "boolean" then pBool = true end
    self.start = pBool
  end
  --
  function f:update(dt)
    --
    if self.start then
      --
      self.chrono = self.chrono + self.speed * dt
      --
      if self.chrono >= self.duree then
        self.chrono = 0
        self.ready = true
        if not self.loop then
          self.start= false
        end
      else
        self.ready = false
      end 
      --
    end
  end
  --
  function f:draw()
    local text = math.floor(self.chrono)
    love.graphics.print(text, self.x-10, self.y-10)
  end
  --
  return f
end
--


return timerEngine