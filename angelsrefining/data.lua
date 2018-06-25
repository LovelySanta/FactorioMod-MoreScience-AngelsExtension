


--------------------------------------------------------------------------------
----- Angels Refining                                                      -----
--------------------------------------------------------------------------------

if mods["angelsrefining"] then

  -- adapt purified water recipe
  if data.raw["fluid"]["water-purified"] and data.raw["fluid"]["purified-water"] then
    -- delete purified-water
    data.raw["fluid"]["purified-water"] = nil
    data.raw["recipe"]["purified-water"] = nil
    data.raw["item"]["purified-water-barrel"] = nil
    data.raw["recipe"]["fill-purified-water-barrel"] = nil
    data.raw["recipe"]["empty-purified-water-barrel"] = nil
    MoreScience.lib.technology.removeRecipeUnlock("fluid-handling-3", "fill-purified-water-barrel")
    MoreScience.lib.technology.removeRecipeUnlock("fluid-handling-3", "empty-purified-water-barrel")

    -- adapt recipes its used in
    MoreScience.lib.technology.removeRecipeUnlock("basic-science-research-1", "purified-water")
    MoreScience.lib.technology.addPrerequisite("basic-science-research-1", "water-treatment")
    MoreScience.lib.technology.removePrerequisite("MoreScience.lib.technology.removePrerequisite", "basic-science-research-1", "steel-processing")
    MoreScience.lib.technology.addPrerequisite("water-treatment", "steel-processing")
    for _, scienceRecipeName in pairs({ -- science recipes
      --"basic-science-fluid-1",
      "basic-science-fluid-2",
      "basic-science-fluid-3",
      "advanced-science-fluid-1",
      "advanced-science-fluid-2",
      --"extreme-science-fluid",
      "basic-military-science-fluid",
      "basic-automation-science-fluid",
      "basic-power-science-fluid",
      "basic-logistics-science-fluid",
    }) do
      if data.raw["recipe"][scienceRecipeName] then
        MoreScience.lib.recipe.editIngredient(scienceRecipeName, "purified-water", "water-purified", 2)
        --for index, ingredient in pairs(data.raw["recipe"][scienceRecipeName].ingredients) do
        --  if ingredient.name == "purified-water" then
        --    data.raw["recipe"][scienceRecipeName].ingredients[index].name = "water-purified"
        --  end
        --end
      end
    end
  end

  -- add green science requirements
  MoreScience.lib.technology.addPrerequisite("advanced-ore-refining-1", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("slag-processing-1", "basic-science-research-1")

  -- add orange science requirements
  MoreScience.lib.technology.addIngredient("ore-floatation", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("advanced-ore-refining-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("advanced-ore-refining-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("ore-leaching", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("slag-processing-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("thermal-water-extraction", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("ore-refining", 1, "basic-automation-science-pack")

  -- add blue science requirements
  MoreScience.lib.technology.addPrerequisite("thermal-water-extraction", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("slag-processing-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("ore-leaching", "basic-science-research-2")





--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
  if mods["angelspetrochem"] then
    -- add green science requirements
    MoreScience.lib.technology.addPrerequisite("water-treatment-3", "basic-science-research-1")

    -- adapt fluid handling
    MoreScience.lib.technology.addPrerequisite("angels-fluid-control", "fluid-handling")
    MoreScience.lib.technology.removePrerequisite("fluid-handling-2", "fluid-handling")
    MoreScience.lib.technology.addPrerequisite("fluid-handling-2", "angels-fluid-control")
    data.raw["technology"]["fluid-handling-2"].icon = data.raw["technology"]["angels-fluid-control"].icon
    data.raw["technology"]["fluid-handling-3"].icon = data.raw["technology"]["angels-fluid-control"].icon
    data.raw["technology"]["fluid-handling-2"].icon_size = data.raw["technology"]["angels-fluid-control"].icon_size
    data.raw["technology"]["fluid-handling-3"].icon_size = data.raw["technology"]["angels-fluid-control"].icon_size

    -- add orange science requirements
    MoreScience.lib.technology.addPrerequisite("ore-floatation", "basic-automation-science-research")
    MoreScience.lib.technology.addPrerequisite("water-treatment-3", "basic-automation-science-research")
    MoreScience.lib.technology.addIngredient("water-treatment-3", 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("water-treatment-4", 1, "basic-automation-science-pack")
  end





--------------------------------------------------------------------------------
----- Angels Smelting                                                      -----
--------------------------------------------------------------------------------
  if mods["angelssmelting"] then
    -- move sand over to solid-sand
    if data.raw["item"]["solid-sand"] and data.raw["item"]["sand"] then
      -- delete sand
      MoreScience.lib.technology.removeRecipeUnlock("bottling-research", "sand")
      data.raw["recipe"]["sand"] = nil
      data.raw["item"]["sand"] = nil

      -- use solid-sand instead
      MoreScience.lib.recipe.editIngredient("glass", "sand", "solid-sand", 1)
      MoreScience.lib.technology.addPrerequisite("bottling-research", "water-washing-1")
      MoreScience.lib.recipe.editIngredient("tree-seed-creator", "sand", "solid-sand", 1)
      MoreScience.lib.recipe.editIngredient("wood-plantation", "sand", "solid-sand", 1)

      for index,result in pairs(data.raw["recipe"]["tree-seed-creator"].results) do
        if result.name == "sand" then
          data.raw["recipe"]["tree-seed-creator"].results[index].name = "solid-sand"
          break
        end
      end
    end

  end





--------------------------------------------------------------------------------
----- bobs plates                                                          -----
--------------------------------------------------------------------------------
  if mods["bobplates"] then
    -- add green science prerequisites
    MoreScience.lib.technology.addPrerequisite("geode-processing-1", "basic-science-research-1")

    -- add orange science prerequisites
    MoreScience.lib.technology.addPrerequisite("geode-processing-2", "basic-automation-science-research")
    MoreScience.lib.technology.addIngredient("geode-processing-2", 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("ore-advanced-floatation", 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("ore-electro-whinning-cell", 1, "basic-automation-science-pack")

  end









end
