require "util"


--------------------------------------------------------------------------------
----- Angels smeltingtrain                                                 -----
--------------------------------------------------------------------------------

if mods["angelsaddons-smeltingtrain"] then

  -- update technology ingredients
  if data.raw["technology"]["angels-smelting-train"] then
    data.raw["technology"]["angels-smelting-train"].unit.count       = 2 * util.table.deepcopy(data.raw["technology"]["railway"].unit.count      )
    data.raw["technology"]["angels-smelting-train"].unit.ingredients =     util.table.deepcopy(data.raw["technology"]["railway"].unit.ingredients)
    data.raw["technology"]["angels-smelting-train"].unit.time        =     util.table.deepcopy(data.raw["technology"]["railway"].unit.time       )
  end

end
