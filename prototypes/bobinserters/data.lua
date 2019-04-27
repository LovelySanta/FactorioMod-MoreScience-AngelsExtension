local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob inserters                                                        -----
--------------------------------------------------------------------------------

if mods["bobinserters"] then
  -- long handed inserters
  if settings.startup["bobmods-inserters-long2"].value == true then
    LSlib.technology.addIngredient("long-inserters-2", 1, string.format(scienceNames.orange, "pack"))
    if mods["bobtech"] then
      LSlib.technology.addPrerequisite("long-inserters-2", "advanced-research")
    end
  end

  -- near inserters

  -- more inserters
  LSlib.technology.addIngredient("more-inserters-1", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("more-inserters-1", "advanced-electronics")
  if settings.startup["bobmods-inserters-more2"].value == true then
    LSlib.technology.addIngredient("more-inserters-2", 1, string.format(scienceNames.orange, "pack"))
    if mods["bobtech"] then
      LSlib.technology.addPrerequisite("more-inserters-2", "advanced-research")
    end
  end
  
  --[[
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
]]
end
