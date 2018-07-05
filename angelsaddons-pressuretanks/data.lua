require "util"


--------------------------------------------------------------------------------
----- Angels pressuretanks                                                 -----
--------------------------------------------------------------------------------
if mods["angelsaddons-pressuretanks"] then

  if data.raw["technology"]["angels-flare-stack"] then
    if mods["boblogistics"] and data.raw["technology"]["bob-fluid-handling-4"] then
      -- update technology ingredients
      data.raw["technology"]["pressure-tanks"].unit.count       = 2 * util.table.deepcopy(data.raw["technology"]["bob-fluid-handling-4"].unit.count      )
      data.raw["technology"]["pressure-tanks"].unit.ingredients =     util.table.deepcopy(data.raw["technology"]["bob-fluid-handling-4"].unit.ingredients)
      MoreScience.lib.technology.addIngredient("pressure-tanks", 1, "basic-logistics-science-pack")
      MoreScience.lib.technology.addPrerequisite("pressure-tanks", "basic-logistics-science-research")
      data.raw["technology"]["pressure-tanks"].unit.time        =     util.table.deepcopy(data.raw["technology"]["bob-fluid-handling-4"].unit.time       )

      -- add prerequisite on bobs logistics
      MoreScience.lib.technology.addPrerequisite("pressure-tanks", "bob-fluid-handling-4")

    else
      -- update technology ingredients
      data.raw["technology"]["pressure-tanks"].unit.count       = 2 * util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].unit.count      )
      data.raw["technology"]["pressure-tanks"].unit.ingredients =     util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].unit.ingredients)
      data.raw["technology"]["pressure-tanks"].unit.time        =     util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].unit.time       )

      -- update prerequisites
      data.raw["technology"]["pressure-tanks"].prerequisites    =     util.table.deepcopy(data.raw["technology"]["angels-flare-stack"].prerequisites   )
    end
  end

end
