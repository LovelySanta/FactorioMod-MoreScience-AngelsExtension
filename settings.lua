
if mods["bobvehicleequipment"] then
  data:extend{{
    type = "bool-setting",
    name = "MS-bobvehicleequipment-personal-equipment-prerequisite",
    setting_type = "startup",
    default_value = true,
    order = "MS-b[bobmods]-v[vehicleequipment]",
  }}
end
