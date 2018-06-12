
--------------------------------------------------------------------------------
----- Bobs assembly                                                      -----
--------------------------------------------------------------------------------

if mods["bobassembly"] then

  -- assembly machines
  for level = 4, 6, 1 do
    MoreScience.lib.technology.addIngredient("automation-" .. level, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("automation-4", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("automation-5", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("automation-5", 1, "production-science-pack")
  MoreScience.lib.technology.addPrerequisite("automation-6", "advanced-science-research-2")
  MoreScience.lib.technology.addIngredient("automation-6", 1, "high-tech-science-pack")

  if mods["boblogistics"] then
    -- let logistic depend on automation
    MoreScience.lib.technology.movePrerequisite("bob-logistics-3", "automation-3", "automation-4")
    MoreScience.lib.technology.addPrerequisite("bob-logistics-4", "automation-5")
    MoreScience.lib.technology.removePrerequisite("bob-logistics-4", "advanced-science-research-1")
    MoreScience.lib.technology.addPrerequisite("bob-logistics-5", "automation-6")
  end

  for level = 2, 3, 1 do
    MoreScience.lib.technology.addIngredient("electronics-machine-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addPrerequisite("electronics-machine-" .. level, "automation-" .. level + 1)
  end

  -- electrolyser
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("electrolyser-" .. level, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addIngredient("electrolyser-4", 1, "high-tech-science-pack")

  -- chemical plant
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("chemical-plant-" .. level, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addIngredient("chemical-plant-4", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addPrerequisite("chemical-plant-2", "basic-science-research-2")

  -- furnaces
  MoreScience.lib.technology.addIngredient("advanced-material-processing-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("advanced-material-processing-4", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("advanced-material-processing-4", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addIngredient("multi-purpose-furnace-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("multi-purpose-furnace-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("multi-purpose-furnace-2", 1, "high-tech-science-pack")
end
