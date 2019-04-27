require "util"


--------------------------------------------------------------------------------
----- Angels petrotrain                                                    -----
--------------------------------------------------------------------------------
if mods["angelsaddons-petrotrain"] then

  if data.raw["technology"]["angels-petro-train"] then
    -- update prerequisits
    MoreScience.lib.technology.movePrerequisite("angels-petro-train", "railway", "fluid-wagon")

    -- update technology ingredients
    data.raw["technology"]["angels-petro-train"].unit.count       = 2 * util.table.deepcopy(data.raw["technology"]["railway"    ].unit.count      )
    data.raw["technology"]["angels-petro-train"].unit.ingredients =     util.table.deepcopy(data.raw["technology"]["fluid-wagon"].unit.ingredients)
    data.raw["technology"]["angels-petro-train"].unit.time        =     util.table.deepcopy(data.raw["technology"]["railway"    ].unit.time       )
  end

end
