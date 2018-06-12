
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

  for index, axeName in pairs({
    "iron-axe",
    "steel-axe",
    "brass-axe",
    "cobalt-axe",
    "titanium-axe",
    "tungsten-axe",
    "diamond-axe",
  }) do
    if data.raw["mining-tool"][axeName] then
      data.raw["mining-tool"][axeName].order = string.format("%s-b%s", MoreScience.lib.util.stringSplit(data.raw["mining-tool"]["steel-axe"].order, "-")[1], index .. "[" .. axeName .. "]")
    end
  end

end
