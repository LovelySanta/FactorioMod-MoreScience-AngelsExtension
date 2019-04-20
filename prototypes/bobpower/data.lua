local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- bobpower                                                             -----
--------------------------------------------------------------------------------

if mods["bobpower"] then

  -- STEAM POWER ---------------------------------------------------------------
  if settings.startup["bobmods-power-steam"].value == true then
    -- boiler
    for level = 3, 5 do
      LSlib.technology.addIngredient(string.format("bob-boiler-%i", level), 1, string.format(scienceNames.orange, "pack"))
      --LSlib.technology.addIngredient(string.format("bob-boiler-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end

    -- oil boiler
    for level = 2, 4 do
      LSlib.technology.addPrerequisite(string.format("bob-oil-boiler-%i", level), string.format("bob-boiler-%i", level + 1))

      LSlib.technology.addIngredient(string.format("bob-oil-boiler-%i", level), 1, string.format(scienceNames.orange, "pack"))
      --LSlib.technology.addIngredient(string.format("bob-oil-boiler-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end

    -- steam engine
    for level = 3, 5 do
      --LSlib.technology.addIngredient(string.format("bob-steam-engine-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("bob-steam-engine-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end
  end

  if settings.startup["bobmods-power-fluidgenerator"].value == true then
    -- oil burning generator
    for level = 1, 3 do
      LSlib.technology.addIngredient(string.format("fluid-generator-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("fluid-generator-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end

    if mods["bobrevamp"] and data.raw.fluid.hydrogen and data.raw.fluid.oxygen and data.raw.fluid.nitrogen then
      LSlib.technology.addIngredient(string.format("hydrazine-generator", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("hydrazine-generator", level), 1, string.format(scienceNames.cyan, "pack"))
    end
  end

  -- SOLAR POWER ---------------------------------------------------------------
  if settings.startup["bobmods-power-accumulators"].value == true then
    -- accumulator
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("bob-electric-energy-accumulators-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("bob-electric-energy-accumulators-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end
  end

  if settings.startup["bobmods-power-solar"].value == true then
    -- solar panels
    for level = 2, 4 do
      --LSlib.technology.addIngredient(string.format("bob-solar-energy-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("bob-solar-energy-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end
  end

  -- NUCLEAR POWER -------------------------------------------------------------
  if settings.startup["bobmods-power-steam"].value == true then
    -- heat exchanger
    for level = 2, 3 do
      LSlib.technology.addIngredient(string.format("bob-heat-exchanger-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("bob-heat-exchanger-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end

    -- steam turbine
    for level = 1, 3 do
      LSlib.technology.addIngredient(string.format("bob-steam-turbine-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("bob-steam-turbine-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end
    for level = 2, 3 do
      LSlib.technology.addPrerequisite(string.format("bob-steam-turbine-%i", level), string.format("bob-steam-engine-%i", level + 2))
    end
  end

  -- POWER POLES ---------------------------------------------------------------
  if settings.startup["bobmods-power-poles"].value == true then
    -- electric poles
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("electric-pole-%i", level), 1, string.format(scienceNames.orange, "pack"))
      --LSlib.technology.addIngredient(string.format("electric-pole-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end

    -- substation
    for level = 2, 4 do
      LSlib.technology.addPrerequisite(string.format("electric-substation-%i", level), string.format("electric-pole-%i", level))

      LSlib.technology.addIngredient(string.format("electric-substation-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("electric-substation-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end
  end

--[[
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
  if mods["bobrevamp"] then
    MoreScience.lib.technology.addIngredient("hydrazine-generator", 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("hydrazine-generator", 1, "basic-power-science-pack")
    MoreScience.lib.technology.addPrerequisite("hydrazine-generator", "advanced-science-research-2")
  end

  -- substations
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("electric-substation-" .. level, 1, "basic-power-science-pack")
  end
  ]]
end
