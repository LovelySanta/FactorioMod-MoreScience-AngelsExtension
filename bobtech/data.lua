
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

end
