require "lib/prototyping"



--------------------------------------------------------------------------------
----- Bob technology                                                       -----
--------------------------------------------------------------------------------

if mods["bobtech"] then

  -- remove bobs logistics science pack since there is already a logistics science pack from moreScience that needs to be unlocked earlier then bobs.
  -- for that reason we remove bobs logistics science...
  if data.raw["tool"]["logistic-science-pack"] then
    data.raw["tool"]["logistic-science-pack"] = nil
    data.raw["recipe"]["logistic-science-pack"] = nil
    removeRecipeUnlock("logistics-3", "logistic-science-pack")

    -- bobs lab-2 is obsolete now, so we just remove that too
    data.raw["lab"]["lab-2"] = nil
    data.raw["item"]["lab-2"] = nil
    data.raw["recipe"]["lab-2"] = nil
    removeRecipeUnlock("advanced-research", "lab-2")

    -- remove science pack from the lab
    for inputIndex, inputName in pairs(data.raw["lab"]["lab"].inputs) do
      if inputName == "logistic-science-pack" then
        table.remove(data.raw["lab"]["lab"].inputs, inputIndex)
        break
      end
    end

    -- check all researches to make sure it does not require logistics-science-pack
    for technologyName, technology in pairs(data.raw["technology"]) do
      for ingredientIndex, ingredientName in pairs(technology.unit.ingredients) do
        if ingredientName == "logistic-science-pack" then
          table.remove(data.raw["technology"][technologyName].unit.ingredients, ingredientIndex)
        end
      end
    end

  end

  -- let rocket depend on advanced research
  addPrerequisiteTechnology("rocket", "advanced-research")

end
