require 'util'

--------------------------------------------------------------------------------
----- Angels bio processing                                                -----
--------------------------------------------------------------------------------

if mods["angelsbioprocessing"] then

  -- remove bio token from the lab
  if data.raw["tool"]["token-bio"] and data.raw["lab"]["lab"] and data.raw["lab"]["lab"].inputs then
    for inputIndex, inputName in pairs(data.raw["lab"]["lab"].inputs) do
      if inputName == "token-bio" then
        table.remove(data.raw["lab"]["lab"].inputs, inputIndex)
        break
      end
    end
  end

  -- update organic tree cutting recipes as 1 solid-tree produces 8 wood
  for recipeTier = 1, 3 do
    LSlib.recipe.editResult("organic-wood" .. recipeTier, "solid-tree", "wood", 8)
    LSlib.recipe.setLocalisedName("organic-wood" .. recipeTier, {"recipe-name.recipe-amount", string.format("%i", LSlib.recipe.getResultCount("organic-wood" .. recipeTier, "wood")), {"item-name.wood"}})
  end

end
