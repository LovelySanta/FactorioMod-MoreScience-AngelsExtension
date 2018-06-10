require "lib/prototyping"



--------------------------------------------------------------------------------
----- Bob inserters                                                        -----
--------------------------------------------------------------------------------

if mods["bobinserters"] then
  -- add blue science requirements
  addScienceIngredient("more-inserters-1", 1, "science-pack-3")

  -- add purple science requirements
  addScienceIngredient("more-inserters-2", 1, "production-science-pack")
  if mods["bobtech"] then
    addPrerequisiteTechnology("more-inserters-2", "advanced-research")
  else
    addPrerequisiteTechnology("more-inserters-2", "logistics-3")
  end
  addScienceIngredient("long-inserters-2", 1, "production-science-pack")

  -- add logistics science requirements
  addScienceIngredient("more-inserters-1", 1, "basic-logistics-science-pack")
  addScienceIngredient("more-inserters-2", 1, "basic-logistics-science-pack")
  addScienceIngredient("long-inserters-2", 1, "basic-logistics-science-pack")



end
