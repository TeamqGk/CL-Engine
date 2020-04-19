local planEngine = {}

cl.plan = {}
for i = 1, 4 do
  cl.plan[i] = {}
end
--

function cl.newPlan()
  local f = {}
  f.planNumber = 1

  function f:setPlan(PlanNumber)
    if not cl.plan[PlanNumber] then
      for i = (#cl.plan+1), PlanNumber do
        cl.plan[i] = {}
      end
    end
    if self.planNumber ~= 1 then -- remove 
      for i = #cl.plan, 1,-1 do
        for k, v in pairs(cl.plan)do
        end
      end
    end
    --
    self.planNumber = PlanNumber
    table.insert(cl.plan[PlanNumber], self)
  end

  return f
end
--

function planEngine.draw()
  for Num = #cl.plan, 1, -1 do
    for i = 1, #cl.plan[Num] do
      if cl.plan[Num][i].isVisible then
        cl.plan[Num][i]:draw()
      end
    end
  end
end
--

return planEngine