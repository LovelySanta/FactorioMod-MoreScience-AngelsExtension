
--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
if mods["angelspetrochem"] then

  -- add green science requirements --------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addPrerequisite("angels-sulfur-processing-2", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("chlorine-processing-1", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("oil-gas-extraction", "basic-science-research-1")

  -- replace chemical plant with angelschemical plants
  MoreScience.lib.technology.removeRecipeUnlock("basic-science-research-1", "chemical-plant")
  MoreScience.lib.technology.removePrerequisite("basic-science-research-1", "steel-processing")
  MoreScience.lib.technology.addPrerequisite("basic-science-research-1", "basic-chemistry-2")
  MoreScience.lib.technology.addPrerequisite("basic-chemistry-2", "steel-processing")

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
    data.raw["technology"]["angels-rocket-fuel"].icon = data.raw["technology"]["rocket"].icon
    data.raw["technology"]["angels-rocket-fuel"].icon_size = data.raw["technology"]["rocket"].icon_size
  end

end
