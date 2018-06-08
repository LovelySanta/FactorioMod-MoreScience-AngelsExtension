
--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
if mods["angelspetrochem"] then

  -- add green science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  addPrerequisiteTechnology("angels-sulfur-processing-2", "basic-science-research-1")
  addPrerequisiteTechnology("chlorine-processing-1", "basic-science-research-1")
  addPrerequisiteTechnology("oil-gas-extraction", "basic-science-research-1")

  -- replace chemical plant with angelschemical plants
  removeRecipeUnlock("basic-science-research-1", "chemical-plant")
  removePrerequisiteTechnology("basic-science-research-1", "steel-processing")
  addPrerequisiteTechnology("basic-science-research-1", "basic-chemistry-2")
  addPrerequisiteTechnology("basic-chemistry-2", "steel-processing")

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
  addScienceIngredient("angels-advanced-chemistry-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-advanced-chemistry-3", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-advanced-chemistry-4", 1, "basic-automation-science-pack")
  addPrerequisiteTechnology("angels-advanced-chemistry-2", "basic-automation-science-research")
  addPrerequisiteTechnology("angels-advanced-chemistry-3", "basic-automation-science-research")
  addScienceIngredient("gas-steam-cracking-2", 1, "basic-automation-science-pack")
  addScienceIngredient("oil-steam-cracking-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-advanced-gas-processing", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-advanced-oil-processing", 1, "basic-automation-science-pack")

  addScienceIngredient("chlorine-processing-2", 1, "basic-automation-science-pack")
  addScienceIngredient("chlorine-processing-3", 1, "basic-automation-science-pack")
  addScienceIngredient("resin-2", 1, "basic-automation-science-pack")
  addScienceIngredient("resin-3", 1, "basic-automation-science-pack")
  addScienceIngredient("flammables", 1, "basic-automation-science-pack")
  addPrerequisiteTechnology("flammables", "basic-automation-science-research")
  addPrerequisiteTechnology("explosives", "flammables")
  addPrerequisiteTechnology("battery", "basic-automation-science-research")
  addPrerequisiteTechnology("battery", "oil-processing")
  addPrerequisiteTechnology("plastics", "basic-automation-science-research")
  addPrerequisiteTechnology("plastic-1", "plastics")
  addScienceIngredient("plastic-1", 1, "basic-automation-science-pack")
  addScienceIngredient("plastic-2", 1, "basic-automation-science-pack")
  addScienceIngredient("plastic-3", 1, "basic-automation-science-pack")
  addScienceIngredient("rubber", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-coal-cracking", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-nitrogen-processing-3", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-nitrogen-processing-4", 1, "basic-automation-science-pack")
  addScienceIngredient("rocket-booster-2", 1, "basic-automation-science-pack")
  addScienceIngredient("gas-synthesis", 1, "basic-automation-science-pack")




  -- add blue science requirements ---------------------------------------------
  ------------------------------------------------------------------------------
  addPrerequisiteTechnology("angels-advanced-gas-processing", "basic-science-research-2")
  addPrerequisiteTechnology("angels-advanced-oil-processing", "basic-science-research-2")
  addPrerequisiteTechnology("chlorine-processing-2", "basic-science-research-2")





  -- add yellow science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  addPrerequisiteTechnology("angels-advanced-chemistry-4", "advanced-science-research-2")
  addPrerequisiteTechnology("resin-3", "advanced-science-research-2")





  -- add rocket science requirements -------------------------------------------
  ------------------------------------------------------------------------------
  if data.raw["technology"]["angels-rocket-fuel"] then
    removeRecipeUnlock("rocket", "rocket-fuel")
    removePrerequisiteTechnology("rocket-silo", "angels-rocket-fuel")
    addPrerequisiteTechnology("rocketpart-fusion-reactor", "angels-rocket-fuel")
    addPrerequisiteTechnology("rocketpart-ion-thruster", "angels-rocket-fuel")
    data.raw["technology"]["angels-rocket-fuel"].icon = data.raw["technology"]["rocket"].icon
    data.raw["technology"]["angels-rocket-fuel"].icon_size = data.raw["technology"]["rocket"].icon_size
  end
end
