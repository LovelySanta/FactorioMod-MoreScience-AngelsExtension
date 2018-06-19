
--------------------------------------------------------------------------------
----- Bob technology                                                       -----
--------------------------------------------------------------------------------

if mods["bobtech"] then

  if mods["bobplates"] then

    if mods["angelssmelting"] then
      -- adapt blue science fluid to ingredients from blue science pack
      MoreScience.lib.recipe.removeIngredient("science-pack-3", "bronze-alloy")
      MoreScience.lib.recipe.addIngredient("basic-science-fluid-3", "bronze-alloy", 1, "item")
      MoreScience.lib.technology.addPrerequisite("basic-science-research-2", "angels-bronze-smelting-1")
    end

    --adapt yellow science fluid to ingredients from yellow science pack
    MoreScience.lib.recipe.removeIngredient("high-tech-science-pack", "lithium-ion-battery")
    MoreScience.lib.recipe.addIngredient("advanced-science-fluid-2", "lithium-ion-battery", 1, "item")
    MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "battery-2")
    MoreScience.lib.recipe.removeIngredient("high-tech-science-pack", "silicon-nitride")
    MoreScience.lib.recipe.addIngredient("advanced-science-fluid-2", "silicon-nitride", 2, "item")
    MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "ceramics")
  end

  -- check all researches to make sure it does not require logistics-science-pack or science-pack-gold
  for technologyName, technology in pairs(data.raw["technology"]) do
    for ingredientIndex, ingredient in pairs(technology.unit.ingredients) do
      if ingredient[1] == "logistic-science-pack" or ingredient["name"] == "logistic-science-pack" then
        table.remove(data.raw["technology"][technologyName].unit.ingredients, ingredientIndex)
      elseif ingredient[1] == "science-pack-gold" or ingredient["name"] == "science-pack-gold" then
        table.remove(data.raw["technology"][technologyName].unit.ingredients, ingredientIndex)
      end
    end
  end

end
