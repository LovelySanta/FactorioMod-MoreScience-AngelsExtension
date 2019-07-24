local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bobs equipment                                                       -----
--------------------------------------------------------------------------------

if mods["bobequipment"] then

  if mods["bobenemies"] and mods["bobtech"] and
     settings.startup["bobmods-enemies-enableartifacts"   ].value and
     settings.startup["bobmods-enemies-enablenewartifacts"].value then

    for _,techName in pairs{
      "bob-energy-shield-equipment-4",
      "bob-battery-equipment-4",
      "fusion-reactor-equipment-2",
    } do
      LSlib.technology.addPrerequisite(techName, "alien-research")
    end
  end

  LSlib.technology.addIngredient("personal-roboport-mk3-equipment", 1, string.format(scienceNames.yellow, "pack"))
  LSlib.technology.addIngredient("personal-roboport-modular-equipment-3", 1, string.format(scienceNames.yellow, "pack"))

end
