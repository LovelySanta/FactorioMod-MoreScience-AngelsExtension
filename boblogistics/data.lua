
--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then

  -- we got more fluid handling technology, lets rename these and add bobs prerequisites
  data.raw["technology"]["fluid-handling-2"].localised_name = {"", {"technology-name.barreling"}, " 1"}
  data.raw["technology"]["fluid-handling-3"].localised_name = {"", {"technology-name.barreling"}, " 2"}
  MoreScience.lib.technology.addPrerequisite("bob-fluid-handling-2", "engine")
  MoreScience.lib.technology.addIngredient("bob-fluid-handling-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-fluid-handling-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-fluid-handling-4", 1, "basic-automation-science-pack")

  -- disable underground pipes
  for _, pipeName in pairs({
    "copper-pipe-to-ground",
    "pipe-to-ground",
    "stone-pipe-to-ground",
    "bronze-pipe-to-ground",
    "steel-pipe-to-ground",
    "plastic-pipe-to-ground",
    "brass-pipe-to-ground",
    "titanium-pipe-to-ground",
    "ceramic-pipe-to-ground",
    "tungsten-pipe-to-ground",
  }) do
    if data.raw["recipe"][pipeName] then
      local enabled = MoreScience.lib.recipe.isEnabled(pipeName)
      if enabled and (enabled[1] or enabled[2]) then
        MoreScience.lib.recipe.disable(pipeName)
        MoreScience.lib.technology.addRecipeUnlock("fluid-handling", pipeName)
      end
    end
  end
  MoreScience.lib.technology.addRecipeUnlock("fluid-handling", "steel-pipe-to-ground")
  MoreScience.lib.technology.addPrerequisite("alloy-processing-1", "fluid-handling")
  MoreScience.lib.technology.addPrerequisite("zinc-processing", "fluid-handling")
  MoreScience.lib.technology.addPrerequisite("plastics", "fluid-handling")
  MoreScience.lib.technology.addPrerequisite("ceramics", "fluid-handling")
  MoreScience.lib.technology.addPrerequisite("titanium-processing", "fluid-handling")
  MoreScience.lib.technology.addPrerequisite("tungsten-processing", "fluid-handling")

  -- railway
  MoreScience.lib.technology.addIngredient("bob-railway-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-railway-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-fluid-wagon-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-fluid-wagon-2", 1, "science-pack-3")
  MoreScience.lib.technology.addIngredient("bob-fluid-wagon-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("bob-fluid-wagon-3", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("bob-fluid-wagon-3", 1, "production-science-pack")

  MoreScience.lib.technology.addIngredient("bob-armoured-railway", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-armoured-railway-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-armoured-fluid-wagon", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bob-armoured-fluid-wagon-2", 1, "basic-automation-science-pack")

  -- inserters
  MoreScience.lib.technology.addPrerequisite("express-inserters", "inserter-stack-size-bonus-2")
  MoreScience.lib.technology.addIngredient("express-inserters", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("stack-inserter-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("stack-inserter-2", "basic-logistics-science-research")
  MoreScience.lib.technology.addIngredient("stack-inserter-2", 1, "basic-logistics-science-pack")

  MoreScience.lib.technology.addPrerequisite("inserter-stack-size-bonus-1", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("inserter-stack-size-bonus-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("inserter-stack-size-bonus-2", "basic-science-research-2")
  MoreScience.lib.technology.addIngredient("inserter-stack-size-bonus-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("inserter-stack-size-bonus-3", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("inserter-stack-size-bonus-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("inserter-stack-size-bonus-4", "advanced-science-research-2")
  MoreScience.lib.technology.addIngredient("inserter-stack-size-bonus-4", 1, "basic-automation-science-pack")

  MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-1", 1, "basic-power-science-pack")
  MoreScience.lib.technology.removeIngredient("inserter-capacity-bonus-1", "basic-logistics-science-pack")
  MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-2", 1, "basic-power-science-pack")
  MoreScience.lib.technology.removeIngredient("inserter-capacity-bonus-2", "basic-logistics-science-pack")
  MoreScience.lib.technology.addPrerequisite("inserter-capacity-bonus-3", "inserter-stack-size-bonus-2")
  MoreScience.lib.technology.addPrerequisite("inserter-capacity-bonus-3", "stack-inserter-2")
  MoreScience.lib.technology.removePrerequisite("inserter-capacity-bonus-4", "advanced-science-research-1")
  MoreScience.lib.technology.addPrerequisite("inserter-capacity-bonus-5", "inserter-stack-size-bonus-3")
  MoreScience.lib.technology.addPrerequisite("inserter-capacity-bonus-7", "inserter-stack-size-bonus-4")
  MoreScience.lib.technology.removePrerequisite("inserter-capacity-bonus-7", "advanced-science-research-2")
  MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-8", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("inserter-capacity-bonus-8", 1, "basic-logistics-science-pack")
  MoreScience.infusedScience.changeToInfusedSciencePack("inserter-capacity-bonus-8", {"production-science-pack","high-tech-science-pack","basic-logistics-science-pack"})

  -- belts
  MoreScience.lib.technology.addPrerequisite("bob-logistics-4", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("bob-logistics-4", 1, "basic-logistics-science-pack")
  MoreScience.lib.technology.addPrerequisite("bob-logistics-5", "advanced-science-research-2")
  MoreScience.lib.technology.addIngredient("bob-logistics-5", 1, "basic-logistics-science-pack")

  -- slots
  MoreScience.lib.technology.addPrerequisite("character-inventory-slots-1", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("character-inventory-slots-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("character-inventory-slots-3", "advanced-science-research-1")
  MoreScience.infusedScience.changeToInfusedSciencePack("character-inventory-slots-4", {"production-science-pack"})

  MoreScience.lib.technology.removePrerequisite("toolbelt", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("toolbelt", "character-inventory-slots-1")
  MoreScience.lib.technology.addPrerequisite("toolbelt-2", "character-inventory-slots-2")
  MoreScience.lib.technology.addPrerequisite("toolbelt-3", "character-inventory-slots-3")

  for level = 4, 10, 1 do
    MoreScience.lib.technology.addIngredient("character-logistic-slots-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("character-logistic-slots-" .. level, 1, "basic-logistics-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("character-logistic-slots-8", "advanced-science-research-2")
  MoreScience.infusedScience.changeToInfusedSciencePack("character-logistic-slots-10", {"production-science-pack","high-tech-science-pack","basic-logistics-science-pack"})

  -- bots
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("bob-robotics-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-robotics-" .. level, 1, "basic-logistics-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("bob-robotics-3", "advanced-science-research-1")
  --MoreScience.lib.technology.addPrerequisite("bob-robotics-4", "advanced-science-research-2")

  for level = 1, 4, 1 do
    MoreScience.lib.technology.addIngredient("bob-robo-modular-" .. level, 1, "basic-power-science-pack")
    MoreScience.lib.technology.addIngredient("bob-robo-modular-" .. level, 1, "basic-logistics-science-pack")
    if level <= 2 then
      MoreScience.lib.technology.addIngredient("bob-robo-modular-" .. level, 1, "science-pack-3")
    end
    if level >= 2 then
      MoreScience.lib.technology.addPrerequisite("bob-robo-modular-" .. level, "bob-robotics-" .. level)
    end
  end
  MoreScience.lib.technology.addIngredient("bob-robo-modular-3", 1, "production-science-pack")
  MoreScience.lib.technology.addIngredient("bob-robo-modular-4", 1, "high-tech-science-pack")

  for level = 1, 4, 1 do
    MoreScience.lib.technology.addIngredient("bob-robots-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-robots-" .. level, 1, "basic-logistics-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("bob-robots-4", "bob-robo-modular-4")
  MoreScience.lib.technology.addIngredient("bob-robots-4", 1, "military-science-pack")
  MoreScience.lib.technology.addIngredient("bob-robots-4", 1, "basic-power-science-pack")
  MoreScience.lib.technology.addIngredient("bob-robots-4", 1, "space-science-pack")
  MoreScience.lib.technology.changeCount("bob-robots-4", 25000)
  MoreScience.infusedScience.changeToInfusedSciencePack("bob-robots-4", {"military-science-pack","production-science-pack","high-tech-science-pack","basic-logistics-science-pack"})

  MoreScience.lib.technology.addIngredient("worker-robots-storage-4", 1, "basic-logistics-science-pack")
  MoreScience.infusedScience.changeToInfusedSciencePack("worker-robots-storage-4", {"production-science-pack","high-tech-science-pack","basic-logistics-science-pack"})

  -- logistics network
  for level = 2, 3, 1 do
    MoreScience.lib.technology.addIngredient("logistic-system-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("logistic-system-" .. level, 1, "basic-logistics-science-pack")
  end
  MoreScience.lib.technology.removePrerequisite("logistic-system", "advanced-science-research-1")
  MoreScience.lib.technology.removePrerequisite("logistic-system", "advanced-science-research-2")
  MoreScience.lib.technology.addPrerequisite("logistic-system-2", "advanced-science-research-1")
  MoreScience.lib.technology.addPrerequisite("logistic-system-3", "advanced-science-research-2")

  if mods["angelspetrochem"] then
    -- move storage tanks over to angels barreling
    if data.raw["item"]["angels-storage-tank-3"] then
      for level = 2, 4, 1 do
        if data.raw["item"]["storage-tank-" .. level] then
          data.raw["item"]["storage-tank-" .. level].subgroup = data.raw["item"]["angels-storage-tank-3"].subgroup
        end
      end
    end

    -- change the order
    for tankId  = 1, 3, 1 do
      if data.raw["item"]["angels-storage-tank-" .. tankId] then
        data.raw["item"]["angels-storage-tank-" .. tankId].order = "a" .. tankId .. string.format("-a[%s]", data.raw["item"]["angels-storage-tank-" .. tankId].name)
      end
    end
    for level = 1, 4, 1 do
      if level == 1 then
        data.raw["item"]["storage-tank"].order = "c" .. level .. string.format("-a[%s-1]", data.raw["item"]["storage-tank"].name)
      elseif data.raw["item"]["storage-tank-" .. level] then
        data.raw["item"]["storage-tank-" .. level].order = "c" .. level .. string.format("-b[%s]", data.raw["item"]["storage-tank-" .. level].name)
      end
    end
  end

end
