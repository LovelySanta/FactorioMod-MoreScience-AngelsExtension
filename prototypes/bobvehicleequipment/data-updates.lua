local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob vehicle equipment                                                -----
--------------------------------------------------------------------------------

if mods["bobvehicleequipment"] then

  if settings.startup["MS-bobvehicleequipment-personal-equipment-prerequisite"].value == true then
    -- add additional prerequisites
    LSlib.technology.addPrerequisite("vehicle-solar-panel-equipment-1", "solar-panel-equipment")
    LSlib.technology.addIngredient("vehicle-solar-panel-equipment-1", 1, string.format(scienceNames.orange, "pack"))

    LSlib.technology.addPrerequisite("vehicle-battery-equipment-1", "battery-equipment")
    LSlib.technology.addIngredient("vehicle-battery-equipment-1", 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addPrerequisite("vehicle-battery-equipment-2", "battery-mk2-equipment")

    LSlib.technology.addPrerequisite("vehicle-fusion-reactor-equipment-1", "fusion-reactor-equipment")
    for level = 1, 2 do
      LSlib.technology.addIngredient(string.format("vehicle-fusion-reactor-equipment-%i", level), 1, string.format(scienceNames.yellow, "pack"))
    end

    LSlib.technology.addPrerequisite("vehicle-roboport-equipment", "personal-roboport-equipment")
    LSlib.technology.addPrerequisite("vehicle-roboport-equipment-2", "personal-roboport-mk2-equipment")

    LSlib.technology.addPrerequisite("vehicle-energy-shield-equipment-1", "energy-shield-equipment")
    LSlib.technology.addPrerequisite("vehicle-energy-shield-equipment-2", "energy-shield-mk2-equipment")

    LSlib.technology.addPrerequisite("vehicle-laser-defense-equipment-1", "personal-laser-defense-equipment")

    LSlib.technology.addPrerequisite("vehicle-big-turret-equipment-1", "discharge-defense-equipment")

    if mods["bobequipment"] then

      for level = 3, 6 do -- energy shield equipment
        LSlib.technology.addPrerequisite(string.format("vehicle-energy-shield-equipment-%i", level), string.format("bob-energy-shield-equipment-%i", level))
      end

      for level = 3, 6 do -- battery equipment
        LSlib.technology.addPrerequisite(string.format("vehicle-battery-equipment-%i", level), string.format("bob-battery-equipment-%i", level))
      end

      for level = 2, 4 do -- fusion reactor equipment
        LSlib.technology.addPrerequisite(string.format("vehicle-fusion-reactor-equipment-%i", level + 2), string.format("fusion-reactor-equipment-%i", level))
      end

      for level = 2, 4 do -- solar panel equipment
        LSlib.technology.addPrerequisite(string.format("vehicle-solar-panel-equipment-%i", level), string.format("solar-panel-equipment-%i", level))
      end

      for level = 2, 6 do -- laser equipment
        LSlib.technology.addPrerequisite(string.format("vehicle-laser-defense-equipment-%i", level), string.format("personal-laser-defense-equipment-%i", level))
      end

      -- exoskeleton
      LSlib.technology.addPrerequisite("vehicle-motor-equipment", "exoskeleton-equipment")
      LSlib.technology.addPrerequisite("vehicle-engine-equipment", "exoskeleton-equipment-2")

    end
  end

  if mods["bobenemies"] and mods["bobtech"] and
     settings.startup["bobmods-enemies-enableartifacts"   ].value and
     settings.startup["bobmods-enemies-enablenewartifacts"].value then

    for _,techName in pairs{
      "vehicle-battery-equipment-4",
      "vehicle-fusion-cell-equipment-4",
      "vehicle-fusion-reactor-equipment-4",
      "vehicle-energy-shield-equipment-4",
      "vehicle-big-turret-equipment-4",
    } do
      LSlib.technology.addPrerequisite(techName, "alien-research")
    end

    -- remove obsolete prerequisites
    LSlib.technology.removePrerequisite("vehicle-energy-shield-equipment-4", "military-4")
  end

end
