
--------------------------------------------------------------------------------
----- Bob technology                                                       -----
--------------------------------------------------------------------------------

if mods["bobtech"] then

  if mods["bobplates"] then
    -- adapt blue science fluid to ingredients from blue science pack
    MoreScience.lib.recipe.removeIngredient("science-pack-3", "bronze-alloy")
    MoreScience.lib.recipe.addIngredient("basic-science-fluid-3", "bronze-alloy", 1, "item")
    MoreScience.lib.technology.addPrerequisite("basic-science-research-2", "angels-bronze-smelting-1")

    --adapt yellow science fluid to ingredients from yellow science pack
    MoreScience.lib.recipe.removeIngredient("high-tech-science-pack", "lithium-ion-battery")
    MoreScience.lib.recipe.addIngredient("advanced-science-fluid-2", "lithium-ion-battery", 1, "item")
    MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "battery-2")
    MoreScience.lib.recipe.removeIngredient("high-tech-science-pack", "silicon-nitride")
    MoreScience.lib.recipe.addIngredient("advanced-science-fluid-2", "silicon-nitride", 2, "item")
    MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "ceramics")
  end
end
