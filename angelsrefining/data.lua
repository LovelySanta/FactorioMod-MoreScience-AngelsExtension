require "lib/prototyping"



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
    removeRecipeUnlock("fluid-handling-3", "fill-purified-water-barrel")
    removeRecipeUnlock("fluid-handling-3", "empty-purified-water-barrel")

    -- adapt recipes its used in
    removeRecipeUnlock("basic-science-research-1", "purified-water")
    addPrerequisiteTechnology("basic-science-research-1", "water-treatment")
    removePrerequisiteTechnology("removePrerequisiteTechnology", "basic-science-research-1", "steel-processing")
    addPrerequisiteTechnology("water-treatment", "steel-processing")
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
        editRecipeIngredient(scienceRecipeName, "purified-water", "water-purified", 2)
        --for index, ingredient in pairs(data.raw["recipe"][scienceRecipeName].ingredients) do
        --  if ingredient.name == "purified-water" then
        --    data.raw["recipe"][scienceRecipeName].ingredients[index].name = "water-purified"
        --  end
        --end
      end
    end
  end

  -- add green science requirements
  addPrerequisiteTechnology("advanced-ore-refining-1", "basic-science-research-1")
  addPrerequisiteTechnology("slag-processing-1", "basic-science-research-1")

  -- add orange science requirements
  addScienceIngredient("ore-floatation", 1, "basic-automation-science-pack")
  addScienceIngredient("advanced-ore-refining-2", 1, "basic-automation-science-pack")

  -- add blue science requirements
  addPrerequisiteTechnology("thermal-water-extraction", "basic-science-research-2")
  addPrerequisiteTechnology("slag-processing-2", "basic-science-research-2")
  addPrerequisiteTechnology("ore-leaching", "basic-science-research-2")

end
