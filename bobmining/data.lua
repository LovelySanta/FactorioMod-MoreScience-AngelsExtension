
--------------------------------------------------------------------------------
----- Bob mining                                                           -----
--------------------------------------------------------------------------------

if mods["bobmining"] then

  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("bob-drills-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-area-drills-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-pumpjacks-" .. level, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addIngredient("bob-pumpjacks-4", 1, "high-tech-science-pack")

end
