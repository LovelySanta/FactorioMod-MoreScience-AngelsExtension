local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Angels Refining                                                      -----
--------------------------------------------------------------------------------

if mods["angelsrefining"] then

  -- adapt purified-water recipe to use water-purified
  if data.raw["fluid"]["water-purified"] and data.raw["fluid"]["purified-water"] then
    -- adapt recipes its used in
    LSlib.technology.addPrerequisite("water-treatment", "steel-processing")
    LSlib.technology.addPrerequisite("purification-research", "water-treatment")
    LSlib.technology.moveRecipeUnlock("water-treatment", "purification-research", "water-purification")
    LSlib.technology.removeRecipeUnlock("purification-research", "purified-water")

    for _, scienceRecipeName in pairs({ -- science recipes
      string.format(scienceNames.red   , "fluid"),
      string.format(scienceNames.green , "fluid"),
      string.format(scienceNames.orange, "fluid"),
      string.format(scienceNames.gray  , "fluid"),
      string.format(scienceNames.blue  , "fluid"),
      string.format(scienceNames.cyan  , "fluid"),
      string.format(scienceNames.purple, "fluid"),
      string.format(scienceNames.yellow, "fluid"),
      string.format(scienceNames.pink  , "fluid"),
      string.format(scienceNames.white , "fluid"),
    }) do
        LSlib.recipe.editIngredient(scienceRecipeName, "purified-water", "water-purified", 2)
    end
    if settings.startup["MS-rocket-launching-extended"].value == true then
      LSlib.recipe.editIngredient(string.format(scienceNames.mixing, "pack"), "purified-water", "water-purified", 0.5)
    end
    for _, scienceRecipeName in pairs({ -- science recipes
      string.format(scienceNames.red   , "pack"),
      string.format(scienceNames.green , "pack"),
      string.format(scienceNames.orange, "pack"),
      string.format(scienceNames.gray  , "pack"),
      string.format(scienceNames.blue  , "pack"),
      string.format(scienceNames.cyan  , "pack"),
      string.format(scienceNames.purple, "pack"),
      string.format(scienceNames.yellow, "pack"),
      string.format(scienceNames.pink  , "pack"),
      string.format(scienceNames.white , "pack"),
    }) do
        LSlib.recipe.editIngredient(string.format("infused-%s", scienceRecipeName), "purified-water", "water-purified", 2)
    end
  end

  if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
    data.raw["recipe"]["empty-barrel-recycling"].subgroup = "angels-fluid-control"
    data.raw["recipe"]["empty-barrel-recycling"].order = "h"
  end

  -- add green science requirements
  LSlib.technology.addPrerequisite("advanced-ore-refining-1", string.format(scienceNames.green, "pack"))
  LSlib.technology.addPrerequisite("slag-processing-1", string.format(scienceNames.green, "pack"))

  -- add orange science requirements
  LSlib.technology.addIngredient("ore-floatation", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("advanced-ore-refining-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("advanced-ore-refining-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-leaching", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("slag-processing-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("thermal-water-extraction", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-refining", 1, string.format(scienceNames.orange, "pack"))

  -- add blue science requirements
  LSlib.technology.addPrerequisite("thermal-water-extraction", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("slag-processing-2", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("ore-leaching", string.format(scienceNames.blue, "pack"))



--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
  if mods["angelspetrochem"] then
    -- add green science requirements
    LSlib.technology.addPrerequisite("water-treatment-3", string.format(scienceNames.green, "pack"))

    -- adapt fluid handling
    LSlib.technology.addPrerequisite("angels-fluid-control", "fluid-handling")
    LSlib.technology.removePrerequisite("fluid-handling-2", "fluid-handling")
    LSlib.technology.addPrerequisite("fluid-handling-2", "angels-fluid-control")
    data.raw["technology"]["fluid-handling-2"].icon = data.raw["technology"]["angels-fluid-control"].icon
    data.raw["technology"]["fluid-handling-3"].icon = data.raw["technology"]["angels-fluid-control"].icon
    data.raw["technology"]["fluid-handling-2"].icon_size = data.raw["technology"]["angels-fluid-control"].icon_size
    data.raw["technology"]["fluid-handling-3"].icon_size = data.raw["technology"]["angels-fluid-control"].icon_size

    -- add orange science requirements
    LSlib.technology.addPrerequisite("ore-floatation", string.format(scienceNames.orange, "pack"))
    LSlib.technology.addPrerequisite("water-treatment-3", string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient("water-treatment-3", 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient("water-treatment-4", 1, string.format(scienceNames.orange, "pack"))
  end



--------------------------------------------------------------------------------
----- Angels Smelting                                                      -----
--------------------------------------------------------------------------------
  if mods["angelssmelting"] then
    -- move sand over to solid-sand
    if data.raw["item"]["solid-sand"] and data.raw["item"]["sand"] then
      -- delete sand
      LSlib.technology.removeRecipeUnlock("purification-research", "sand")
      data.raw["recipe"]["sand"] = nil
      data.raw["item"]["sand"] = nil

      -- use solid-sand instead
      LSlib.recipe.editIngredient("glass", "sand", "solid-sand", 1)
      LSlib.technology.addPrerequisite("bottling-research", "water-washing-1")
      LSlib.recipe.editIngredient("tree-seed-creator", "sand", "solid-sand", 1)
      LSlib.recipe.editIngredient("wood-plantation", "sand", "solid-sand", 1)

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
    LSlib.technology.addPrerequisite("geode-processing-1", string.format(scienceNames.green, "pack"))

    -- add orange science prerequisites
    LSlib.technology.addPrerequisite("geode-processing-2", string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient("geode-processing-2", 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient("ore-advanced-floatation", 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient("ore-electro-whinning-cell", 1, string.format(scienceNames.orange, "pack"))
  end


--[[
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
    MoreScience.lib.technology.removeRecipeUnlock("bottling-research", "purified-water")
    MoreScience.lib.technology.addPrerequisite("basic-science-research-1", "water-treatment")
    MoreScience.lib.technology.removePrerequisite("MoreScience.lib.technology.removePrerequisite", "basic-science-research-1", "steel-processing")
    MoreScience.lib.technology.addPrerequisite("water-treatment", "steel-processing")
    for _, scienceRecipeName in pairs({ -- science recipes
      "basic-science-fluid-1",
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








]]
end
