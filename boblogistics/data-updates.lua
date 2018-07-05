
--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then

  if mods["angelspetrochem"] then
    if data.raw["item"]["angels-storage-tank-3"] then
      data.raw["item"]["storage-tank"].subgroup = data.raw["item"]["angels-storage-tank-3"].subgroup
    end
  end

  MoreScience.lib.technology.addPrerequisite("logistics-3", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("logistics-3", 1, "production-science-pack")

  -- disable underground pipes
  MoreScience.lib.technology.removeRecipeUnlock("steel-processing", "steel-pipe-to-ground")

  -- Fix the inserter overhaul
  if settings.startup["bobmods-logistics-inserteroverhaul"] and settings.startup["bobmods-logistics-inserteroverhaul"].value == true then
    -- unlock fast inserter for green science early game
    MoreScience.lib.technology.removeRecipeUnlock("logistics-2", "long-handed-inserter")
    MoreScience.lib.technology.addRecipeUnlock("automation-2", "long-handed-inserter")
    -- change green science recipe over to fast inserter from express inserter
    MoreScience.lib.recipe.editIngredient("basic-science-fluid-2", "fast-inserter", "long-handed-inserter", 1)

    -- unlock filter inserter quicker
    MoreScience.lib.technology.removeRecipeUnlock("logistics-2", "red-filter-inserter")
    MoreScience.lib.technology.addRecipeUnlock("automation-2", "red-filter-inserter")
  end

end
