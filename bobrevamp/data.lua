
--------------------------------------------------------------------------------
----- Bob revamp                                                       -----
--------------------------------------------------------------------------------

if mods["bobrevamp"] then

  -- chemical plant has its own research, let's require it for the green science
  MoreScience.lib.technology.addPrerequisite("bottling-research", "chemical-plant")
  MoreScience.lib.technology.removeRecipeUnlock("bottling-research", "chemical-plant")
  -- but we have to remove the green science requirement now
  MoreScience.lib.technology.removeIngredient("chemical-plant", "science-pack-2")
  if mods["bobplates"] then
    MoreScience.lib.technology.removePrerequisite("chemical-processing-2" ,"chemical-plant")
  end

  -- pumpjack research
  MoreScience.lib.technology.addPrerequisite("pumpjack", "basic-science-research-1")
  if mods["angelspetrochem"] then
    -- with angels petrochem we unlock pumpjacks with gas and oil extraction, need to take care of that
    MoreScience.lib.technology.removeRecipeUnlock("oil-gas-extraction", "pumpjack")
    MoreScience.lib.technology.addPrerequisite("oil-gas-extraction", "pumpjack")
    MoreScience.lib.technology.removePrerequisite("oil-gas-extraction", "basic-science-research-1")
  end

  -- rocket part: low density
  MoreScience.lib.technology.addPrerequisite("low-density-structure" ,"advanced-science-research-1")
  MoreScience.lib.technology.removeRecipeUnlock("rocket" ,"low-density-structure")
  MoreScience.lib.technology.addPrerequisite("rocketpart-ion-thruster" ,"low-density-structure")
  MoreScience.lib.technology.addPrerequisite("rocketpart-hull-component" ,"low-density-structure")
  MoreScience.lib.technology.addPrerequisite("rocketpart-shield-array" ,"low-density-structure")

  -- rocket part: heat shield
  MoreScience.lib.technology.addPrerequisite("rocketpart-ion-thruster" ,"heat-shield")
  MoreScience.lib.recipe.addIngredient("rocketpart-ion-thruster", "heat-shield-tile", 20)
  MoreScience.lib.recipe.addIngredient("rocketpart-ion-booster", "heat-shield-tile", 50)

  MoreScience.lib.technology.addPrerequisite("rocketpart-hull-component" ,"heat-shield")
  MoreScience.lib.recipe.addIngredient("rocketpart-hull-component", "heat-shield-tile", 25)

  MoreScience.lib.recipe.removeIngredient("rocket-part", "heat-shield-tile")

  -- satellite
  if data.raw["item"]["silver-zinc-battery"] then
    MoreScience.lib.technology.removePrerequisite("rocket-silo", "electric-energy-accumulators-1")
  end

end
