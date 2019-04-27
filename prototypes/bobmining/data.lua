local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob mining                                                           -----
--------------------------------------------------------------------------------

if mods["bobmining"] then

  if settings.startup["bobmods-mining-miningdrills"].value == true then
    -- mining drill
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("bob-drills-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
  end

  if settings.startup["bobmods-mining-areadrills"].value == true then
    -- large area mining drill
    for level = 2, 4 do
      LSlib.technology.addIngredient(string.format("bob-area-drills-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
  end

  if settings.startup["bobmods-mining-miningaxes"].value == true then
    -- mining axes
    for level = 2, 6 do
      LSlib.technology.addIngredient(string.format("steel-axe-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
  end

  if settings.startup["bobmods-mining-pumpjacks"].value == true then
    -- pumpjacks
    for level = 1, 4 do
      LSlib.technology.addIngredient(string.format("bob-pumpjacks-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end
  end

  if settings.startup["bobmods-mining-waterminers"].value == true and data.raw["resource-category"]["water"] then
    LSlib.technology.addIngredient("water-miner-2", 1, string.format(scienceNames.green, "pack"))
    for level = 3, 5 do
      LSlib.technology.addIngredient(string.format("water-miner-%i", level), 1, string.format(scienceNames.orange, "pack"))
    end

    if mods["bobplates"] then
      LSlib.technology.addPrerequisite("water-miner-1", "water-bore-1")
      LSlib.technology.addPrerequisite("water-miner-3", "water-bore-2")
      LSlib.technology.addPrerequisite("water-miner-4", "water-bore-3")
      LSlib.technology.addPrerequisite("water-miner-5", "water-bore-4")
    else
      LSlib.technology.addPrerequisite("water-miner-1", "basic-automation")
    end
  end

--[[
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
]]
end
