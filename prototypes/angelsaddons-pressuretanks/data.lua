require "util"
local scienceNames = require("prototypes/settings").scienceNames



--------------------------------------------------------------------------------
----- Angels pressuretanks                                                 -----
--------------------------------------------------------------------------------
if mods["angelsaddons-pressuretanks"] then

  if data.raw["technology"]["angels-flare-stack"] then
    if mods["boblogistics"] and data.raw["technology"]["bob-fluid-handling-4"] then
      -- update technology ingredients
      data.raw["technology"]["pressure-tanks"].unit.count       = 2 * util.table.deepcopy(data.raw["technology"]["bob-fluid-handling-4"].unit.count      )
      data.raw["technology"]["pressure-tanks"].unit.ingredients =     util.table.deepcopy(data.raw["technology"]["bob-fluid-handling-4"].unit.ingredients)
      LSlib.technology.addIngredient("pressure-tanks", 1, string.format(scienceNames.pink, "pack"))
      LSlib.technology.addPrerequisite("pressure-tanks", string.format(scienceNames.pink, "pack"))
      data.raw["technology"]["pressure-tanks"].unit.time        =     util.table.deepcopy(data.raw["technology"]["bob-fluid-handling-4"].unit.time       )

      -- add prerequisite on bobs logistics
      LSlib.technology.addPrerequisite("pressure-tanks", "bob-fluid-handling-4")

    else
      -- update technology ingredients
      data.raw["technology"]["pressure-tanks"].unit.count       = 2 * util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].unit.count      )
      data.raw["technology"]["pressure-tanks"].unit.ingredients =     util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].unit.ingredients)
      data.raw["technology"]["pressure-tanks"].unit.time        =     util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].unit.time       )

      -- update prerequisites
      data.raw["technology"]["pressure-tanks"].prerequisites    =     util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].prerequisites   )
    end
  end

  -- move pressure tank over to barreling
  data.raw["item"]["angels-pressure-tank-1"].subgroup = data.raw["item"]["angels-storage-tank-3"].subgroup
  data.raw["recipe"]["angels-pressure-tank-1"].subgroup = nil
  data.raw["item"]["angels-pressure-tank-1"].order = "b" .. string.format("-a[%s]", data.raw["item"]["angels-pressure-tank-1"].name)
  data.raw["recipe"]["angels-pressure-tank-1"].order = nil

end
