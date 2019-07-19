require "util"


--------------------------------------------------------------------------------
----- Angels warehouses                                                    -----
--------------------------------------------------------------------------------

if mods["angelsaddons-warehouses"] then
  data.raw["technology"]["angels-logistic-warehouses"].unit.ingredients = util.table.deepcopy(data.raw["technology"]["logistic-system"].unit.ingredients)

  if mods["boblogistics"] then
    LSlib.technology.removePrerequisite("angels-logistic-warehouses", "logistic-system")
    LSlib.technology.addPrerequisite("angels-logistic-warehouses", "logistic-system-3")
  end
end
