
--------------------------------------------------------------------------------
----- Bob inserters                                                        -----
--------------------------------------------------------------------------------

if mods["bobinserters"] then
  -- add blue science requirements
  MoreScience.lib.technology.addIngredient("more-inserters-1", 1, "science-pack-3")

  -- add purple science requirements
  MoreScience.lib.technology.addIngredient("more-inserters-2", 1, "production-science-pack")
  if mods["bobtech"] then
    MoreScience.lib.technology.addPrerequisite("more-inserters-2", "advanced-research")
  else
    MoreScience.lib.technology.addPrerequisite("more-inserters-2", "logistics-3")
  end
  MoreScience.lib.technology.addIngredient("long-inserters-2", 1, "production-science-pack")

  -- add logistics science requirements
  MoreScience.lib.technology.addIngredient("more-inserters-1", 1, "basic-logistics-science-pack")
  MoreScience.lib.technology.addIngredient("more-inserters-2", 1, "basic-logistics-science-pack")
  MoreScience.lib.technology.addIngredient("long-inserters-2", 1, "basic-logistics-science-pack")



end
