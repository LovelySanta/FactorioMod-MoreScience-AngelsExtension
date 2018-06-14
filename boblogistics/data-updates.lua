
--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then

  if mods["angelspetrochem"] then
    if data.raw["item"]["angels-storage-tank-3"] then
      data.raw["item"]["storage-tank"].subgroup = data.raw["item"]["angels-storage-tank-3"].subgroup
    end
  end

  MoreScience.lib.technology.addPrerequisite("logistics-3", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("logistics-3", 1, "production-science-pack")

end
