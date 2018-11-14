
--------------------------------------------------------------------------------
----- Bob inserters                                                        -----
--------------------------------------------------------------------------------

if mods["bobinserters"] then
  -- add blue science requirements
  MoreScience.lib.technology.addIngredient("more-inserters-1", 1, "science-pack-3")

  -- add purple science requirements
  MoreScience.lib.technology.addIngredient("more-inserters-2", 1, "production-science-pack")
  MoreScience.lib.technology.addIngredient("long-inserters-2", 1, "production-science-pack")
  if mods["bobtech"] then
    MoreScience.lib.technology.addPrerequisite("more-inserters-2", "advanced-research")
    MoreScience.lib.technology.addPrerequisite("long-inserters-2", "advanced-research")
  else
    MoreScience.lib.technology.addPrerequisite("more-inserters-2", "logistics-3")
    MoreScience.lib.technology.addPrerequisite("long-inserters-2", "logistics-3")
  end

  -- add logistics science requirements
  MoreScience.lib.technology.addIngredient("more-inserters-1", 1, "basic-logistics-science-pack")
  MoreScience.lib.technology.addIngredient("more-inserters-2", 1, "basic-logistics-science-pack")
  MoreScience.lib.technology.addIngredient("long-inserters-2", 1, "basic-logistics-science-pack")

  -- make sure the green science uses yellow inserters
  MoreScience.lib.recipe.editIngredient("basic-science-fluid-2", "fast-inserter", "inserter", 1)

end
