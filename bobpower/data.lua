
--------------------------------------------------------------------------------
----- Bob bobpower                                                         -----
--------------------------------------------------------------------------------

if mods["bobpower"] then

  -- steam power
  MoreScience.lib.technology.addPrerequisite("bob-steam-power", "basic-automation")

  -- accumulator
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("bob-electric-energy-accumulators-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-electric-energy-accumulators-" .. level, 1, "basic-power-science-pack")
  end

  -- solar
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("bob-solar-energy-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-solar-energy-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("bob-solar-energy-3", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("bob-solar-energy-4", "advanced-science-research-1")

  -- nuclear
  for level = 1, 2, 1 do
    MoreScience.lib.technology.addIngredient("advanced-steam-power-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("advanced-steam-power-" .. level, 1, "basic-power-science-pack")
  end

  -- oil power
  for level = 1, 3, 1 do
    MoreScience.lib.technology.addIngredient("fluid-generator-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("fluid-generator-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("fluid-generator-3", "advanced-science-research-1")

  -- substations
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("electric-substation-" .. level, 1, "basic-power-science-pack")
  end
end
