local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bobs assembly                                                      -----
--------------------------------------------------------------------------------

if mods["bobassembly"] then

  -- assembling machine
  for level = 4, 6 do
    LSlib.technology.addIngredient(string.format("automation-%i", level), 1, string.format(scienceNames.orange, "pack"))
    table.insert(data.raw["assembling-machine"][string.format("assembling-machine-%i", level)].crafting_categories, "ms-advanced-crafting")
  end
  LSlib.technology.addPrerequisite("automation-4", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("automation-5", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient("automation-5", 1, string.format(scienceNames.purple, "pack"))
  LSlib.technology.addPrerequisite("automation-6", string.format(scienceNames.yellow, "pack"))
  LSlib.technology.addIngredient("automation-6", 1, string.format(scienceNames.yellow, "pack"))

  LSlib.technology.movePrerequisite("rocket", "automation-3", "automation-6")
  LSlib.recipe.editIngredient("rocket-assembling-machine", "assembling-machine-3", "assembling-machine-6", 1)

  -- electronics assembling machine
  if settings.startup["bobmods-assembly-electronicmachines"].value == true then
    for level = 2, 3 do
      LSlib.technology.addIngredient(string.format("electronics-machine-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addPrerequisite(string.format("electronics-machine-%i", level), string.format("automation-%i", level + 1))
    end
  end

  -- oil processing
  if settings.startup["bobmods-assembly-oilrefineries"].value == true then
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("oil-processing-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
  end

  -- chemical plant
  if settings.startup["bobmods-assembly-chemicalplants"].value == true then
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("chemical-plant-%i", level), 1, string.format(scienceNames.orange, "pack"))
      table.insert(data.raw["assembling-machine"][string.format("chemical-plant-%i", level)].crafting_categories, "ms-chemical-crafting")
    end
  end

  -- electric furnace
  if settings.startup["bobmods-assembly-furnaces"].value == true then
    for level = 3, 4 do
      LSlib.technology.addIngredient(string.format("advanced-material-processing-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("advanced-material-processing-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end
  end

  -- electrolyser
  if settings.startup["bobmods-assembly-electrolysers"].value and
     data.raw.technology["electrolysis-1"]                    and
     data.raw.item["electrolyser"]                            and
     data.raw["recipe-category"]["electrolysis"]
  then
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("electrolyser-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
  end

  -- electric multi purpose furnace
  if settings.startup["bobmods-assembly-multipurposefurnaces"].value and
     data.raw["item-subgroup"]["bob-smelting-machine"]               and
     data.raw["recipe-category"]["chemical-furnace"]                 and
     data.raw["recipe-category"]["mixing-furnace"]                   and
     data.raw.technology["alloy-processing-2"]                       and
     data.raw.technology["chemical-processing-3"]
  then
    for level = 1, 2 do
      LSlib.technology.addIngredient(string.format("multi-purpose-furnace-%i", level), 1, string.format(scienceNames.orange, "pack"))
      LSlib.technology.addIngredient(string.format("multi-purpose-furnace-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    end

    if settings.startup["bobmods-assembly-furnaces"].value == true then
      for level = 1, 2 do
        LSlib.technology.addPrerequisite(string.format("multi-purpose-furnace-%i", level), string.format("advanced-material-processing-%i", level + 2))
      end
    else
      LSlib.technology.addPrerequisite("multi-purpose-furnace-1", "advanced-material-processing-2")
    end
  end

  -- destillery
  if settings.startup["bobmods-plates-purewater"] and settings.startup["bobmods-plates-purewater"].value == true and
     settings.startup["bobmods-assembly-distilleries"].value == true
  then
    for level = 3, 5 do
      LSlib.technology.addIngredient(string.format("bob-distillery-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
    LSlib.technology.addPrerequisite("bob-distillery-3", string.format(scienceNames.blue, "pack"))
    LSlib.technology.addPrerequisite("bob-distillery-4", string.format(scienceNames.purple, "pack"))
    LSlib.technology.addPrerequisite("bob-distillery-5", string.format(scienceNames.yellow, "pack"))
  end

  --[[
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
  ]]
end
