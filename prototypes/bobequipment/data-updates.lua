
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

end
