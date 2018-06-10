require "util"


--------------------------------------------------------------------------------
----- Angels warehouses                                                    -----
--------------------------------------------------------------------------------

if mods["angelsaddons-warehouses"] then
  data.raw["technology"]["angels-logistic-warehouses"].unit.ingredients = util.table.deepcopy(data.raw["technology"]["logistic-system"].unit.ingredients)
end
