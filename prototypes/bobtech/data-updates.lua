local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob technology                                                       -----
--------------------------------------------------------------------------------

if mods["bobtech"] then
  -- fix the logistic science pack ---------------------------------------------
  -- fix other technologies
  local packName  = string.format(scienceNames.pink, "pack" )
  for techName,techLevels in pairs{
    ["logistic-system"                  ] = {},
    ["character-logistic-trash-slots-%i"] = {3},
    ["worker-robots-storage-%i"         ] = {2, 3},
    ["worker-robots-speed-%i"           ] = {4},
    ["inserter-capacity-bonus-%i"       ] = {5, 6},
    ["braking-force-%i"                 ] = {5, 6},
    ["personal-roboport-equipment-%i"   ] = {2},
  } do
    if LSlib.utils.table.isEmpty(techLevels) then
      LSlib.technology.removeIngredient(techName, packName)
    else
      for _,techLevel in pairs(techLevels) do
        LSlib.technology.removeIngredient(string.format(techName, techLevel), packName)
      end
    end
  end
  for _,techName in pairs{
    "worker-robots-speed-4",
    "character-logistic-slots-4",
    "character-logistic-trash-slots-3"
  } do
    LSlib.technology.removePrerequisite(techName, "personal-roboport-equipment-2")
  end
  LSlib.technology.addIngredient("personal-roboport-equipment-2", 1, string.format(scienceNames.yellow, "pack"))


  if mods["bobvehicleequipment"] then
    LSlib.technology.removeIngredient("vehicle-roboport-equipment-2", packName)
    LSlib.technology.addIngredient("vehicle-roboport-equipment-2", 1, string.format(scienceNames.yellow, "pack"))
  end


  -- remove unwanted science ingredients
  for scienceName, ingredients in pairs{
    [string.format(scienceNames.purple, "pack")] = {"chemical-plant", "assembling-machine-2"},
    [string.format(scienceNames.yellow, "fluid")] = {"processing-unit", "flying-robot-frame"},
  } do
    for _,ingredientName in pairs(ingredients) do
      -- check if the ingredient is present
      local containsIngredient = false
      for _,scienceIngredient in pairs(data.raw.recipe[scienceName].ingredients or {}) do
        if ingredientName == (scienceIngredient[1] or scienceIngredient.name or "") then
          containsIngredient = true
        end
      end

      if containsIngredient then
        -- if it is present, we move it over to the fluid
        LSlib.recipe.removeIngredient(scienceName, ingredientName)
      end
    end
  end

  -- move science ingredients over from pack to fluid
  for scienceName, ingredients in pairs{
    [scienceNames.blue] = {"sodium-hydroxide"},
    [scienceNames.yellow] = {
      "processing-unit",
      "battery", "silver-zinc-battery",
      "silicon-nitride",
      "titanium-bearing"
    },
  } do
    for _,ingredientName in pairs(ingredients) do
      -- check if the ingredient is present
      local containsIngredient = false
      local ingredientAmount = 0
      local ingredientType = nil
      for _,scienceIngredient in pairs(data.raw.recipe[string.format(scienceName, "pack")].ingredients or {}) do
        if ingredientName == (scienceIngredient[1] or scienceIngredient.name or "") then
          containsIngredient = true
          ingredientAmount = scienceIngredient[2] or scienceIngredient.amount or 1
          ingredientType = scienceIngredient.type
        end
      end

      if containsIngredient then
        -- if it is present, we move it over to the fluid
        LSlib.recipe.removeIngredient(string.format(scienceName, "pack"), ingredientName)
        LSlib.recipe.addIngredient(string.format(scienceName, "fluid"), ingredientName, ingredientAmount, ingredientType)
      end
    end
  end

  -- fix science packs timing and count
  LSlib.recipe.setResultCount(string.format(scienceNames.yellow, "pack"), string.format(scienceNames.yellow, "pack"), 1)
  LSlib.recipe.setResultCount(string.format(scienceNames.pink, "pack"), string.format(scienceNames.pink, "pack"), 1)

  LSlib.recipe.setEngergyRequired(string.format(scienceNames.blue  , "pack"), 10)
  LSlib.recipe.setEngergyRequired(string.format(scienceNames.yellow, "pack"), 20)
  LSlib.recipe.setEngergyRequired(string.format(scienceNames.pink  , "pack"), 30)

  --[[
  if mods["bobelectronics"] then
    -- rebalance blue science cost
    MoreScience.lib.recipe.editIngredient("basic-science-fluid-3", "advanced-circuit", "advanced-circuit", .5)
  end

  if mods["bobplates"] then

    -- adapt blue science fluid to ingredients from blue science pack
    MoreScience.lib.recipe.removeIngredient("science-pack-3", "bronze-alloy")
    MoreScience.lib.recipe.addIngredient("basic-science-fluid-3", "bronze-alloy", 1, "item")
    if mods["angelssmelting"] then
      MoreScience.lib.technology.addPrerequisite("basic-science-research-2", "angels-bronze-smelting-1")
    else
      MoreScience.lib.technology.addPrerequisite("basic-science-research-2", "alloy-processing-1")
    end

    -- make sure science-pack-3 has a result count of 1
    MoreScience.lib.recipe.setResultCount("science-pack-3", "science-pack-3", 1)

    --adapt yellow science fluid to ingredients from yellow science pack
    MoreScience.lib.recipe.removeIngredient("high-tech-science-pack", "lithium-ion-battery")
    MoreScience.lib.recipe.addIngredient("advanced-science-fluid-2", "lithium-ion-battery", 1, "item")
    MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "battery-2")
    MoreScience.lib.recipe.removeIngredient("high-tech-science-pack", "silicon-nitride")
    MoreScience.lib.recipe.addIngredient("advanced-science-fluid-2", "silicon-nitride", 2, "item")
    MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "ceramics")
  end

  -- check all researches to make sure it does not require logistics-science-pack or science-pack-gold
  for technologyName, technology in pairs(data.raw["technology"]) do
    for ingredientIndex, ingredient in pairs(technology.unit.ingredients) do
      if ingredient[1] == "logistic-science-pack" or ingredient["name"] == "logistic-science-pack" then
        table.remove(data.raw["technology"][technologyName].unit.ingredients, ingredientIndex)
      elseif ingredient[1] == "science-pack-gold" or ingredient["name"] == "science-pack-gold" then
        table.remove(data.raw["technology"][technologyName].unit.ingredients, ingredientIndex)
      end
    end
  end
  ]]
end
