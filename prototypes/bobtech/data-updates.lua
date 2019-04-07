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
    ["personal-roboport-equipment-%i"   ] = {2}
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

  -- fix purple science
  LSlib.recipe.removeIngredient(string.format(scienceNames.purple, "pack"), "assembling-machine-2")
  LSlib.recipe.removeIngredient(string.format(scienceNames.purple, "pack"), "chemical-plant")

  -- fix yellow science
  LSlib.recipe.removeIngredient(string.format(scienceNames.yellow, "pack"), "processing-unit")
  LSlib.recipe.removeIngredient(string.format(scienceNames.yellow, "pack"), "battery")

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
