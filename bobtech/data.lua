
--------------------------------------------------------------------------------
----- Bob technology                                                       -----
--------------------------------------------------------------------------------

if mods["bobtech"] then

  -- remove bobs logistics science pack since there is already a logistics science pack from moreScience that needs to be unlocked earlier then bobs.
  -- for that reason we remove bobs logistics science...
  if data.raw["tool"]["logistic-science-pack"] then
    MoreScience.lib.recipe.disable("logistic-science-pack")
    MoreScience.lib.technology.removeRecipeUnlock("logistics-3", "logistic-science-pack")

    -- bobs lab-2 is obsolete now, so we just disable that too
    MoreScience.lib.recipe.disable("lab-2")
    MoreScience.lib.technology.removeRecipeUnlock("advanced-research", "lab-2")

    -- remove science pack from the lab
    for inputIndex, inputName in pairs(data.raw["lab"]["lab"].inputs) do
      if inputName == "logistic-science-pack" then
        table.remove(data.raw["lab"]["lab"].inputs, inputIndex)
        break
      end
    end

  end

  -- let rocket depend on advanced research
  MoreScience.lib.technology.addPrerequisite("rocket", "advanced-research")

  if data.raw["tool"]["science-pack-gold"] then
    -- subgroup
    local alienScienceGroup = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
    alienScienceGroup.name = "science-alien-packs"
    alienScienceGroup.order = MoreScience.lib.util.stringSplit(alienScienceGroup.order, "-c-a")[1] .. "-c-c"
    data:extend({alienScienceGroup})

    -- delete gold science pack, change it to an ingredient, required for alien sciences
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "science-pack-1")
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "science-pack-2")
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "military-science-pack")
    MoreScience.lib.recipe.addIngredient("science-pack-gold", "basic-military-science-fluid", 10, "fluid")
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "science-pack-3")
    MoreScience.lib.recipe.addIngredient("science-pack-gold", "basic-science-fluid-3", 10, "fluid")
    if mods["angelspetrochem"] then
      data.raw["recipe"]["science-pack-gold"].category = "basic-chemistry"
    else
      data.raw["recipe"]["science-pack-gold"].category = "chemistry"
    end
    data.raw["tool"]["science-pack-gold"].icon = "__bobtech__/graphics/icons/alien-technology.png"
    data.raw["tool"]["science-pack-gold"].icon_size = 128
    data.raw["tool"]["science-pack-gold"].localised_name = nil
    data.raw["tool"]["science-pack-gold"].subgroup = alienScienceGroup.name

    if data.raw["technology"]["advanced-research"] then
      MoreScience.lib.technology.removeRecipeUnlock("alien-research", "science-pack-gold")
      MoreScience.lib.technology.addRecipeUnlock("advanced-research", "science-pack-gold")
    end

    for _, packName in pairs({
      "alien-science-pack",
      "alien-science-pack-blue",
      "alien-science-pack-orange",
      "alien-science-pack-purple",
      "alien-science-pack-yellow",
      "alien-science-pack-green",
      "alien-science-pack-red",
    }) do
      MoreScience.lib.recipe.addIngredient(packName, "science-pack-gold", 1, "item")
      data.raw["tool"][packName].subgroup = alienScienceGroup.name
    end

    -- move the lab
    data.raw["item"]["lab-alien"].subgroup = data.raw["item"]["lab-burner"].subgroup
    data.raw["item"]["lab-alien"].order = data.raw["item"]["lab"].order .. "-a[alien]"

    -- remove science pack gold from the lab ingredients
    for inputIndex, input in pairs(data.raw["lab"]["lab-alien"].inputs) do
      if input == "science-pack-gold" then
        table.remove(data.raw["lab"]["lab-alien"].inputs, inputIndex)
        break
      end
    end

  end
end
