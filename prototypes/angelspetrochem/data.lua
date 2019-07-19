local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
if mods["angelspetrochem"] then

  -- add green science requirements --------------------------------------------
  ------------------------------------------------------------------------------
  LSlib.technology.addPrerequisite("angels-sulfur-processing-2", string.format(scienceNames.green, "pack"))
  LSlib.technology.addPrerequisite("chlorine-processing-1", string.format(scienceNames.green, "pack"))
  LSlib.technology.addPrerequisite("oil-gas-extraction", string.format(scienceNames.green, "pack"))

  -- replace chemical plant with angelschemical plants
  LSlib.technology.removePrerequisite(string.format(scienceNames.green, "pack"), "steel-processing")
  LSlib.technology.addPrerequisite("basic-chemistry-2", "steel-processing")
  LSlib.technology.addPrerequisite("purification-research", "basic-chemistry-2")
  if mods["bobrevamp"] then
    LSlib.technology.removePrerequisite(string.format(scienceNames.green, "pack"), "chemical-plant")
    LSlib.technology.addPrerequisite("basic-chemistry-2", "chemical-plant")
  else
    LSlib.technology.removeRecipeUnlock(string.format(scienceNames.green, "pack"), "chemical-plant")
  end

  -- add new recipe category to only use the regular angel chemical plants
  data:extend({
    {
      type = "recipe-category",
      name = "basic-chemistry",
    },
  })
  for _, buildingName in pairs({
    "angels-chemical-plant",
    "angels-chemical-plant-2",
    "angels-chemical-plant-3",
    "angels-chemical-plant-4",
  }) do
    LSlib.entity.addCraftingCategory("assembling-machine", buildingName, "basic-chemistry")
  end

  -- adapt science fluids: only craftable in regular chemical plants
  for _, scienceRecipeName in pairs({
    string.format(scienceNames.red   , "fluid"),
    string.format(scienceNames.green , "fluid"),
    string.format(scienceNames.orange, "fluid"),
    string.format(scienceNames.gray  , "fluid"),
    string.format(scienceNames.blue  , "fluid"),
    string.format(scienceNames.cyan  , "fluid"),
    string.format(scienceNames.purple, "fluid"),
    string.format(scienceNames.yellow, "fluid"),
    string.format(scienceNames.pink  , "fluid"),
    string.format(scienceNames.white , "fluid"),
  }) do
    LSlib.recipe.setCraftingCategory(scienceRecipeName, "basic-chemistry")
  end

  -- adapt infused science packs: only craftable in advanced chemical plants
  for _, scienceRecipeName in pairs({
    string.format(scienceNames.red   , "pack"),
    string.format(scienceNames.green , "pack"),
    string.format(scienceNames.orange, "pack"),
    string.format(scienceNames.gray  , "pack"),
    string.format(scienceNames.blue  , "pack"),
    string.format(scienceNames.cyan  , "pack"),
    string.format(scienceNames.purple, "pack"),
    string.format(scienceNames.yellow, "pack"),
    string.format(scienceNames.pink  , "pack"),
    string.format(scienceNames.white , "pack"),
  }) do
    LSlib.recipe.setCraftingCategory(string.format("infused-%s", scienceRecipeName), "advanced-chemistry")
  end



  -- add orange science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  LSlib.technology.addIngredient("angels-advanced-chemistry-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-advanced-chemistry-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-advanced-chemistry-4", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("angels-advanced-chemistry-2", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("angels-advanced-chemistry-3", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("gas-steam-cracking-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("oil-steam-cracking-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-advanced-gas-processing", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-advanced-oil-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addIngredient("chlorine-processing-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("chlorine-processing-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("resin-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("resin-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("flammables", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("flammables", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("explosives", "flammables")
  LSlib.technology.addPrerequisite("battery", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("battery", "oil-processing")
  LSlib.technology.addPrerequisite("plastics", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("plastic-1", "plastics")
  LSlib.technology.addIngredient("plastic-1", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("plastic-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("plastic-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("rubber", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-coal-cracking", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-nitrogen-processing-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-nitrogen-processing-4", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("rocket-booster-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("gas-synthesis", 1, string.format(scienceNames.orange, "pack"))



  -- add blue science requirements ---------------------------------------------
  ------------------------------------------------------------------------------
  LSlib.technology.addPrerequisite("angels-advanced-gas-processing", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("angels-advanced-oil-processing", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("oil-steam-cracking-2", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("gas-steam-cracking-2", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("chlorine-processing-2", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("angels-sulfur-processing-3", string.format(scienceNames.blue, "pack"))



  -- add yellow science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  LSlib.technology.addPrerequisite("angels-advanced-chemistry-4", string.format(scienceNames.yellow, "pack"))
  LSlib.technology.addPrerequisite("resin-3", string.format(scienceNames.yellow, "pack"))



  -- add rocket science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  if data.raw["technology"]["angels-rocket-fuel"] then
    --LSlib.technology.removeRecipeUnlock("rocket", "rocket-fuel")
    LSlib.technology.removePrerequisite("rocket-silo", "angels-rocket-fuel")
    --LSlib.technology.addPrerequisite("rocketpart-fusion-reactor", "angels-rocket-fuel")
    LSlib.technology.addPrerequisite("rocketpart-ion-thruster", "angels-rocket-fuel")
    data.raw["technology"]["angels-rocket-fuel"].icon = data.raw["technology"]["rocketry"].icon
    data.raw["technology"]["angels-rocket-fuel"].icon_size = data.raw["technology"]["rocketry"].icon_size
    LSlib.technology.addPrerequisite("angels-rocket-fuel", "rocketry")
  end



--[[
  -- add green science requirements --------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addPrerequisite("angels-sulfur-processing-2", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("chlorine-processing-1", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("oil-gas-extraction", "basic-science-research-1")

  -- replace chemical plant with angelschemical plants
  MoreScience.lib.technology.removePrerequisite("basic-science-research-1", "steel-processing")
  MoreScience.lib.technology.addPrerequisite("basic-chemistry-2", "steel-processing")
  MoreScience.lib.technology.addPrerequisite("bottling-research", "basic-chemistry-2")
  if mods["bobrevamp"] then
    MoreScience.lib.technology.removePrerequisite("basic-science-research-1", "chemical-plant")
    MoreScience.lib.technology.addPrerequisite("basic-chemistry-2", "chemical-plant")
  else
    MoreScience.lib.technology.removeRecipeUnlock("basic-science-research-1", "chemical-plant")
  end
  -- add new recipe category to only use the regular chemical plants
  data:extend({
    {
      type = "recipe-category",
      name = "basic-chemistry",
    },
  })
  for _, buildingName in pairs({
    "angels-chemical-plant",
    "angels-chemical-plant-2",
    "angels-chemical-plant-3",
    "angels-chemical-plant-4",
  }) do
    table.insert(data.raw["assembling-machine"][buildingName].crafting_categories, "basic-chemistry")
  end

  -- adapt science fluids: only craftable in regular chemical plants
  for _, scienceRecipeName in pairs({
    "basic-science-fluid-1",
    "basic-science-fluid-2",
    "basic-science-fluid-3",
    "advanced-science-fluid-1",
    "advanced-science-fluid-2",
    "extreme-science-fluid",
    "basic-military-science-fluid",
    "basic-automation-science-fluid",
    "basic-power-science-fluid",
    "basic-logistics-science-fluid",
  }) do
    data.raw["recipe"][scienceRecipeName].category = "basic-chemistry"
  end

  -- adapt infused science packs: only craftable in advanced chemical plants
  for _, scienceRecipeName in pairs({
    "infused-basic-science-pack-1",
    "infused-basic-science-pack-2",
    "infused-basic-science-pack-3",
    "infused-advanced-science-pack-1",
    "infused-advanced-science-pack-2",
    "infused-extreme-science-pack",
    "infused-basic-military-science-pack",
    "infused-basic-automation-science-pack",
    "infused-basic-power-science-pack",
    "infused-basic-logistics-science-pack",
  }) do
    data.raw["recipe"][scienceRecipeName].category = "advanced-chemistry"
  end





  -- add orange science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addIngredient("angels-advanced-chemistry-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-advanced-chemistry-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-advanced-chemistry-4", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("angels-advanced-chemistry-2", "basic-automation-science-research")
  MoreScience.lib.technology.addPrerequisite("angels-advanced-chemistry-3", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("gas-steam-cracking-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("oil-steam-cracking-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-advanced-gas-processing", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-advanced-oil-processing", 1, "basic-automation-science-pack")

  MoreScience.lib.technology.addIngredient("chlorine-processing-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("chlorine-processing-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("resin-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("resin-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("flammables", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("flammables", "basic-automation-science-research")
  MoreScience.lib.technology.addPrerequisite("explosives", "flammables")
  MoreScience.lib.technology.addPrerequisite("battery", "basic-automation-science-research")
  MoreScience.lib.technology.addPrerequisite("battery", "oil-processing")
  MoreScience.lib.technology.addPrerequisite("plastics", "basic-automation-science-research")
  MoreScience.lib.technology.addPrerequisite("plastic-1", "plastics")
  MoreScience.lib.technology.addIngredient("plastic-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("plastic-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("plastic-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("rubber", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-coal-cracking", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-nitrogen-processing-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("angels-nitrogen-processing-4", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("rocket-booster-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("gas-synthesis", 1, "basic-automation-science-pack")




  -- add blue science requirements ---------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addPrerequisite("angels-advanced-gas-processing", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("angels-advanced-oil-processing", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("oil-steam-cracking-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("gas-steam-cracking-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("chlorine-processing-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("angels-sulfur-processing-3", "basic-science-research-2")





  -- add yellow science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addPrerequisite("angels-advanced-chemistry-4", "advanced-science-research-2")
  MoreScience.lib.technology.addPrerequisite("resin-3", "advanced-science-research-2")





  -- add rocket science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  if data.raw["technology"]["angels-rocket-fuel"] then
    MoreScience.lib.technology.removeRecipeUnlock("rocket", "rocket-fuel")
    MoreScience.lib.technology.removePrerequisite("rocket-silo", "angels-rocket-fuel")
    MoreScience.lib.technology.addPrerequisite("rocketpart-fusion-reactor", "angels-rocket-fuel")
    MoreScience.lib.technology.addPrerequisite("rocketpart-ion-thruster", "angels-rocket-fuel")
    data.raw["technology"]["angels-rocket-fuel"].icon = data.raw["technology"]["rocketry"].icon
    data.raw["technology"]["angels-rocket-fuel"].icon_size = data.raw["technology"]["rocketry"].icon_size
    MoreScience.lib.technology.addPrerequisite("angels-rocket-fuel", "rocketry")
  end
]]
end
