require "lib/prototyping"
require "util"

TechTreeCleanup = {}


function TechTreeCleanup:getAllPrerequisites(technologyName)
  if not data.raw["technology"][technologyName] then return nil end
  if not data.raw["technology"][technologyName].prerequisites then return nil end

  if self.prereqcache[technologyName] then return self.prereqcache[technologyName] end

  -- temporary till we find all prerequisites (this is to prevent loop, stack overflow)
  self.prereqcache[technologyName] = util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)

  -- get all none-reduntant prerequisites now
  local prerequisites = util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)
  for _,prerequisiteName in pairs(data.raw["technology"][technologyName].prerequisites) do
    local prerequisiteTable = self:getAllPrerequisites(prerequisiteName)
    if prerequisiteTable then
      for _, prerequisite in pairs(prerequisiteTable) do
        table.insert(prerequisites, prerequisite)
      end
    end
  end

  -- save all the none-redundant prerequisites now
  self.prereqcache[technologyName] = prerequisites
  return prerequisites
end

function TechTreeCleanup:removeRedundantPrerequisites(technologyName)
  if not data.raw["technology"][technologyName].prerequisites then return end

  -- iterate over all prerequisites to check if they are redundant
  for _,prerequisiteName in pairs(util.table.deepcopy(data.raw["technology"][technologyName].prerequisites)) do
    local prerequisites = self:getAllPrerequisites(prerequisiteName)
    if prerequisites then
      -- check for all the other prerequisites if they are in the prerequisites list
      for _,prerequisite in pairs(data.raw["technology"][technologyName].prerequisites) do
        if prerequisite ~= prerequisiteName then
          for _, name in pairs(prerequisites) do
            if name == prerequisite then
              --remove prerequisite
              for k,v in pairs(data.raw["technology"][technologyName].prerequisites) do
                if v == prerequisite then
                  table.remove(data.raw["technology"][technologyName].prerequisites, k)
                  --log("TechTreeCleanup: Removing prerequisite '" .. prerequisite .. "' from technology '" .. technologyName .. "'.")
                end
              end
            end
          end
        end
      end
    end
  end
end

function TechTreeCleanup:techTreeCleanup()
  if not TechTreeCleanup.prereqcache then
    TechTreeCleanup.prereqcache = {}
  end

  for _, technology in pairs(data.raw["technology"]) do
    self:removeRedundantPrerequisites(technology.name)
  end

  TechTreeCleanup.prereqcache = nil
end
