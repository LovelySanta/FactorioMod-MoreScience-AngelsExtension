local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob plates                                                           -----
--------------------------------------------------------------------------------

if mods["bobplates"] then

  --LSlib.technology.addPrerequisite("electrolysis-1", "purification-research")
  LSlib.technology.addPrerequisite("electrolysis-1", "brick-processing")
  LSlib.technology.removeRecipeUnlock("electrolysis-2", "storage-tank")

  LSlib.technology.addPrerequisite("chemical-processing-1", "brick-processing")
  LSlib.technology.addPrerequisite("chemical-processing-2", "advanced-material-processing")
  LSlib.technology.removeRecipeUnlock("chemical-processing-2", "chemical-plant")
  LSlib.technology.addIngredient("chemical-processing-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("chemical-processing-3", 1, string.format(scienceNames.cyan, "pack"))

  LSlib.technology.addPrerequisite("alloy-processing-1", "advanced-material-processing")
  LSlib.technology.addIngredient("alloy-processing-1", 1, string.format(scienceNames.green, "pack"))
  LSlib.technology.addIngredient("alloy-processing-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("alloy-processing-2", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient("alloy-processing-2", 1, string.format(scienceNames.cyan, "pack"))
  LSlib.technology.addIngredient("alloy-processing-2", 1, string.format(scienceNames.purple, "pack"))

  LSlib.technology.addPrerequisite("ceramics", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ceramics", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.removeIngredient("ceramics", string.format(scienceNames.blue, "pack"))

  LSlib.technology.addPrerequisite("air-compressor-1", "basic-automation")
  LSlib.technology.addIngredient("air-compressor-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("air-compressor-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("air-compressor-4", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("water-bore-1", "basic-automation")
  LSlib.technology.addIngredient("water-bore-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("water-bore-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("water-bore-4", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("advanced-electronics-3", string.format(scienceNames.purple, "pack"))

  -- gas bottle ----------------------------------------------------------------
  LSlib.technology.addPrerequisite("gas-canisters", string.format(scienceNames.green, "pack"))
  LSlib.technology.addPrerequisite("fluid-handling-2", "gas-canisters")

  LSlib.recipe.addIngredient("gas-canister", "empty-barrel", 1)
  if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
    local gasBottleRecycling = util.table.deepcopy(data.raw["recipe"]["gas-canister"])
    gasBottleRecycling.name = gasBottleRecycling.name.."-recycling"
    gasBottleRecycling.icons = LSlib.item.getIcons("item", "gas-canister")
    table.insert(gasBottleRecycling.icons, data.raw["recipe"]["empty-barrel-recycling"].icons[2])
    gasBottleRecycling.normal = nil
    gasBottleRecycling.expensive = nil
    gasBottleRecycling.ingredients = {{"gas-canister", 5}}
    gasBottleRecycling.category = "advanced-crafting"
    gasBottleRecycling.results = {{type="item", name="empty-barrel", amount=1, probability=.95}}
    gasBottleRecycling.order = data.raw["item"]["gas-canister"].order .. "-b[recycle]"
    data:extend{gasBottleRecycling}
    data.raw.recipe[gasBottleRecycling.name].allow_as_intermediate = false
    LSlib.technology.addRecipeUnlock("gas-canisters", "gas-canister-recycling")
  end

  -- canister -----------------------------------------------------------------
  data:extend{{
    type = "technology",
    name = "fuel-canisters",
    icon = "__MoreScience-BobAngelsExtension__/graphics/canister.png",
    icon_size = 720,
    prerequisites = {"fluid-handling-2", "flammables", "plastics"},
    unit = util.table.deepcopy(data.raw.technology["flammables"].unit),
    effects = {},
    order = "c-b-i0",
  }}
  LSlib.technology.addRecipeUnlock("fuel-canisters", "empty-canister")

  LSlib.recipe.editIngredient("empty-canister", "iron-plate", "empty-barrel", 1)
  if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
    local canisterRecycling = util.table.deepcopy(data.raw["recipe"]["empty-canister"])
    canisterRecycling.name = canisterRecycling.name.."-recycling"
    canisterRecycling.icons = LSlib.item.getIcons("item", "empty-canister")
    table.insert(canisterRecycling.icons, data.raw["recipe"]["empty-barrel-recycling"].icons[2])
    canisterRecycling.normal = nil
    canisterRecycling.expensive = nil
    canisterRecycling.ingredients = {{"empty-canister", 5}}
    canisterRecycling.category = "advanced-crafting"
    canisterRecycling.results = {{type="item", name="empty-barrel", amount=1, probability=.95}}
    canisterRecycling.order = data.raw["item"]["empty-canister"].order .. "-b[recycle]"
    data:extend{canisterRecycling}
    data.raw.recipe[canisterRecycling.name].allow_as_intermediate = false
    LSlib.technology.addRecipeUnlock("fuel-canisters", "empty-canister-recycling")
  end

  -- gem processing ------------------------------------------------------------
  data:extend{{
    type = "technology",
    name = "gems",
    icons = LSlib.technology.getIcons("gem-processing-1"),
    prerequisites = {"automation-2"},
    unit = util.table.deepcopy(data.raw.technology["grinding"].unit),
    effects = {},
    order = "c-b-i0",
  }}
  LSlib.technology.addPrerequisite("gem-processing-1", "gems")
  for _,gem in pairs{"ruby", "sapphire", "emerald", "amethyst", "topaz", "diamond"} do
    LSlib.recipe.disable(string.format("bob-%s-3", gem))
    LSlib.technology.addRecipeUnlock("gems", string.format("bob-%s-3", gem))
  end
  LSlib.technology.addIngredient("polishing", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("gem-processing-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.removeIngredient("gem-processing-2", 1, string.format(scienceNames.blue, "pack"))

  LSlib.technology.addIngredient("advanced-electronics-3", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("battery-2", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addIngredient("battery-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("battery-2", 1, string.format(scienceNames.cyan, "pack"))
  LSlib.technology.addPrerequisite("battery-3", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient("battery-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("battery-3", 1, string.format(scienceNames.cyan, "pack"))

  -- metals --------------------------------------------------------------------
  LSlib.technology.addIngredient("zinc-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("titanium-processing", "advanced-material-processing-2")
  LSlib.technology.addIngredient("titanium-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("tungsten-processing", "advanced-material-processing-2")
  LSlib.technology.addPrerequisite("tungsten-processing", "nickel-processing")
  LSlib.technology.addIngredient("tungsten-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("invar-processing", "advanced-material-processing")

  LSlib.technology.movePrerequisite("nitinol-processing", "alloy-processing-1", "alloy-processing-2")
  LSlib.technology.addIngredient("nitinol-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.movePrerequisite("tungsten-alloy-processing", "alloy-processing-1", "alloy-processing-2")
  LSlib.technology.addIngredient("tungsten-alloy-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("cobalt-processing", "sulfur-processing")
  LSlib.technology.addIngredient("cobalt-processing", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addPrerequisite("lithium-processing", "advanced-material-processing")

  --[[
  -- add green science requirements
  LSlib.technology.addPrerequisite("electrolysis-2", string.format(scienceNames.green, "pack"))
  LSlib.technology.addPrerequisite("lithium-processing", string.format(scienceNames.green, "pack"))

  -- add orange science requirements
  LSlib.technology.addPrerequisite("polishing", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("polishing", "gem-processing-1")
  LSlib.technology.addIngredient("polishing", 1, string.format(scienceNames.orange, "pack"))

  for level = 2, 4, 1 do
    LSlib.technology.addIngredient("water-bore-" .. level, 1, string.format(scienceNames.orange, "pack"))
  end
  LSlib.technology.addIngredient("mixing-steel-furnace", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("gem-processing-2", 1, string.format(scienceNames.orange, "pack"))
  for level = 2, 3, 1 do
    LSlib.technology.addIngredient("battery-" .. level, 1, string.format(scienceNames.orange, "pack"))
  end
  --LSlib.technology.addIngredient("titanium-processing", 1, string.format(scienceNames.orange, "pack"))

  -- add blue science requirements
  LSlib.technology.addPrerequisite("gem-processing-2", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("titanium-processing", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("ceramics", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("battery-2", string.format(scienceNames.blue, "pack"))

  -- add purple science requirements
  LSlib.technology.addPrerequisite("tungsten-alloy-processing", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addPrerequisite("nitinol-processing", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addPrerequisite("battery-3", string.format(scienceNames.purple, "pack"))

  -- add yellow science requirements
  LSlib.technology.addPrerequisite("advanced-electronics-3", string.format(scienceNames.yellow, "pack"))

  -- add light blue science requirements
  LSlib.technology.addPrerequisite("battery-3", string.format(scienceNames.cyan, "pack"))
  LSlib.technology.addIngredient("battery-3", 1, string.format(scienceNames.cyan, "pack"))
  ]]


end
