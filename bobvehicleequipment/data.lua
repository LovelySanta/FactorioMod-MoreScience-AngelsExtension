
--------------------------------------------------------------------------------
----- Bob vehicle equipment                                                       -----
--------------------------------------------------------------------------------

if mods["bobvehicleequipment"] then

  -- solar panel equipment
  if mods["angelsindustries"] then
    MoreScience.lib.technology.addPrerequisite("vehicle-solar-panel-equipment-1", "angels-vequipment-1")
  end

  MoreScience.lib.technology.addIngredient("vehicle-solar-panel-equipment-1", 1, "basic-automation-science-pack")

  MoreScience.lib.technology.addPrerequisite("vehicle-solar-panel-equipment-2", "advanced-electronics")
  MoreScience.lib.technology.addIngredient("vehicle-solar-panel-equipment-2", 1, "basic-automation-science-pack")
  if mods["angelssmelting"] then
    MoreScience.lib.technology.addPrerequisite("vehicle-solar-panel-equipment-2", "angels-silver-smelting-1")
  end

  MoreScience.lib.technology.addPrerequisite("vehicle-solar-panel-equipment-3", "basic-power-science-research")
  for level = 3, 6 do
    MoreScience.lib.technology.addIngredient("vehicle-solar-panel-equipment-" .. level, 1, "basic-power-science-pack")
  end

  MoreScience.lib.technology.addPrerequisite("vehicle-solar-panel-equipment-4", "advanced-science-research-1")


  -- battery equipment
  MoreScience.lib.technology.addPrerequisite("vehicle-battery-equipment-1", "basic-power-science-research")
  MoreScience.lib.technology.addPrerequisite("vehicle-battery-equipment-1", "battery-equipment")
  MoreScience.lib.technology.addPrerequisite("vehicle-battery-equipment-2", "battery-mk2-equipment")
  for level = 1, 6 do
    MoreScience.lib.technology.addIngredient("vehicle-battery-equipment-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("vehicle-battery-equipment-4", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("vehicle-battery-equipment-4", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-battery-equipment-5", 1, "high-tech-science-pack")
  if mods["bobwarfare"] then
    for level = 3, 6 do
      MoreScience.lib.technology.addPrerequisite("vehicle-battery-equipment-" .. level, "battery-equipment-" .. level)
    end
  end


  -- fusion cell equipment
  MoreScience.lib.technology.movePrerequisite("vehicle-fusion-cell-equipment-1", "vehicle-solar-panel-equipment-1", "vehicle-solar-panel-equipment-3")
  for level = 4, 6 do
    MoreScience.lib.technology.addPrerequisite("vehicle-fusion-cell-equipment-" .. level - 2, "vehicle-solar-panel-equipment-" .. level)
  end
  for level = 1, 6 do
    MoreScience.lib.technology.addIngredient("vehicle-fusion-cell-equipment-" .. level, 1, "basic-power-science-pack")
  end


  -- fusion reactor equipment
  MoreScience.lib.technology.addPrerequisite("vehicle-fusion-reactor-equipment-1", "basic-logistics-science-research")
  for level = 1, 6 do
    MoreScience.lib.technology.addPrerequisite("vehicle-fusion-reactor-equipment-" .. level, "vehicle-fusion-cell-equipment-" .. level)
    MoreScience.lib.technology.addIngredient("vehicle-fusion-reactor-equipment-" .. level, 1, "basic-logistics-science-pack")
  end


  -- overdrive motor/engine
  MoreScience.lib.technology.addPrerequisite("vehicle-motor-equipment", "braking-force-3")
  MoreScience.lib.technology.addIngredient("vehicle-motor-equipment", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-motor-equipment", 1, "basic-power-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-motor-equipment", 1, "basic-logistics-science-pack")

  MoreScience.lib.technology.addPrerequisite("vehicle-engine-equipment", "braking-force-6")
  MoreScience.lib.technology.addIngredient("vehicle-engine-equipment", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-engine-equipment", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-engine-equipment", 1, "basic-power-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-engine-equipment", 1, "basic-logistics-science-pack")


  -- robot equipment
  MoreScience.lib.technology.movePrerequisite("vehicle-roboport-equipment", "construction-robotics", "personal-roboport-equipment")
  MoreScience.lib.technology.addIngredient("vehicle-roboport-equipment", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-roboport-equipment", 1, "basic-power-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-roboport-equipment", 1, "basic-logistics-science-pack")

  MoreScience.lib.technology.addPrerequisite("vehicle-roboport-equipment-2", "personal-roboport-equipment-2")
  MoreScience.lib.technology.addIngredient("vehicle-roboport-equipment-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-roboport-equipment-2", 1, "basic-power-science-pack")
  MoreScience.lib.technology.addIngredient("vehicle-roboport-equipment-2", 1, "basic-logistics-science-pack")


  -- shield equipement
  MoreScience.lib.technology.addPrerequisite("vehicle-energy-shield-equipment-1", "energy-shield-equipment")
  MoreScience.lib.technology.addPrerequisite("vehicle-energy-shield-equipment-2", "energy-shield-mk2-equipment")
  if mods["bobwarfare"] then
    MoreScience.lib.technology.addIngredient("vehicle-energy-shield-equipment-3", 1, "high-tech-science-pack")
    for level = 3, 5, 1 do
      MoreScience.lib.technology.addPrerequisite("vehicle-energy-shield-equipment-" .. level, "energy-shield-equipment-" .. level)
    end
    MoreScience.lib.technology.addPrerequisite("vehicle-energy-shield-equipment-3", "energy-shield-mk2-equipment")
  end
  for level = 1, 6 do
    MoreScience.lib.technology.addIngredient("vehicle-energy-shield-equipment-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("vehicle-energy-shield-equipment-4", "military-4")


  -- laser equipment
  MoreScience.lib.technology.addPrerequisite("vehicle-laser-defense-equipment-1", "personal-laser-defense-equipment")
  for level = 1, 6 do
    MoreScience.lib.technology.addIngredient("vehicle-laser-defense-equipment-" .. level, 1, "basic-power-science-pack")
  end
  if mods["bobwarfare"] then
    for level = 2, 6 do
      MoreScience.lib.technology.addPrerequisite("vehicle-laser-defense-equipment-" .. level, "personal-laser-defense-equipment-" .. level)
    end
    for level = 4, 5 do
      MoreScience.lib.technology.addIngredient("vehicle-laser-defense-equipment-" .. level, 1, "high-tech-science-pack")
    end
  else
    MoreScience.lib.technology.addPrerequisite("vehicle-laser-defense-equipment-6", "military-4")
  end


  -- plasma equipment
  MoreScience.lib.technology.addPrerequisite("vehicle-big-turret-equipment-3", "military-4")
  for level = 1, 6 do
    MoreScience.lib.technology.addPrerequisite("vehicle-big-turret-equipment-" .. level, "vehicle-laser-defense-equipment-" .. level)
    MoreScience.lib.technology.addIngredient("vehicle-fusion-reactor-equipment-" .. level, 1, "basic-power-science-pack")
  end

end
