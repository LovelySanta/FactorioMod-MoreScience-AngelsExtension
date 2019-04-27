local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob warfare                                                          -----
--------------------------------------------------------------------------------

if mods["bobwarfare"] then
  -- GUN -----------------------------------------------------------------------
  LSlib.technology.addIngredient("bob-laser-rifle", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("bob-laser-rifle", 1, string.format(scienceNames.cyan, "pack"))

  -- AMMO ----------------------------------------------------------------------
  -- intermediate research
  LSlib.technology.addIngredient("nitroglycerin-processing", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("cordite-processing", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("cordite-processing", string.format(scienceNames.gray, "pack"))

  -- bullets
  LSlib.technology.addIngredient("bob-bullets", 1, string.format(scienceNames.orange, "pack"))
  for _,techName in pairs{
    "bob-ap-bullets",
    "bob-electric-bullets",
    "bob-he-bullets",
    "bob-flame-bullets",
    "bob-acid-bullets",
    "bob-poison-bullets",
  } do
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addPrerequisite(techName, "military-3")
  end

  -- shotgun shells
  LSlib.technology.addIngredient("bob-shotgun-shells", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("uranium-ammo", "bob-shotgun-shells")
  for _,techName in pairs{
    "bob-shotgun-ap-shells",
    "bob-shotgun-electric-shells",
    "bob-shotgun-explosive-shells",
    "bob-shotgun-flame-shells",
    "bob-shotgun-acid-shells",
    "bob-shotgun-poison-shells",
  } do
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addPrerequisite(techName, "military-3")
  end

  -- laser rifle
  for level = 1, 6 do
    LSlib.technology.addIngredient(string.format("bob-laser-rifle-ammo-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-laser-rifle-ammo-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- rocket
  LSlib.technology.addIngredient("bob-rocket", 1, string.format(scienceNames.orange, "pack"))
  for _,techName in pairs{
    "bob-piercing-rocket",
    "bob-electric-rocket",
    "bob-explosive-rocket",
    "bob-acid-rocket",
    "bob-flame-rocket",
    "bob-poison-rocket",
  } do
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addPrerequisite(techName, "military-3")
  end

  -- ARMOR ---------------------------------------------------------------------
  for level = 3, 4 do
    LSlib.technology.addIngredient(string.format("bob-armor-making-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end
  for level = 3, 5 do
    LSlib.technology.addIngredient(string.format("bob-power-armor-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-power-armor-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- MINE ----------------------------------------------------------------------
  for _,techName in pairs{
    "poison-mine"    ,
    "slowdown-mine"  ,
    "distractor-mine",
  } do
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.gray, "pack"))
  end

  -- DRONE ---------------------------------------------------------------------
  LSlib.technology.addIngredient("bob-robot-tanks", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("bob-robot-tanks", 1, string.format(scienceNames.cyan, "pack"))
  LSlib.technology.addIngredient("bob-robot-tanks", 1, string.format(scienceNames.blue, "pack"))

  -- WALL ----------------------------------------------------------------------
  LSlib.technology.addPrerequisite("reinforced-wall", string.format(scienceNames.gray, "pack"))
  LSlib.technology.addIngredient("reinforced-wall", 1, string.format(scienceNames.gray, "pack"))

  -- EQUIPMENT -----------------------------------------------------------------
  -- energy shield equipment
  LSlib.technology.addPrerequisite("bob-energy-shield-equipment-4", "military-4")
  for level = 3, 6 do
    LSlib.technology.addIngredient(string.format("bob-energy-shield-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-energy-shield-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    LSlib.technology.addIngredient(string.format("bob-energy-shield-equipment-%i", level), 1, string.format(scienceNames.purple, "pack"))
  end

  -- battery equipment
  LSlib.technology.addPrerequisite("bob-battery-equipment-6", "military-4")
  for level = 3, 6 do
    LSlib.technology.addIngredient(string.format("bob-battery-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-battery-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- fusion reactor equipment
  LSlib.technology.addIngredient("fusion-reactor-equipment", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("fusion-reactor-equipment", 1, string.format(scienceNames.cyan, "pack"))
  for level = 2, 4 do
    LSlib.technology.addIngredient(string.format("fusion-reactor-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("fusion-reactor-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- night vision equipment
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("night-vision-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("night-vision-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- solar panel equipment
  for level = 2, 4 do
    LSlib.technology.addIngredient(string.format("solar-panel-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("solar-panel-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- laser equipment
  LSlib.technology.addPrerequisite("personal-laser-defense-equipment-4", "military-4")
  for level = 2, 6 do
    LSlib.technology.addIngredient(string.format("personal-laser-defense-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("personal-laser-defense-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- exoskeleton
  LSlib.technology.addPrerequisite("exoskeleton-equipment-2", string.format(scienceNames.blue, "pack"))
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("exoskeleton-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("exoskeleton-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- TURRETS -------------------------------------------------------------------
  -- regular turrets
  LSlib.technology.addPrerequisite("bob-turrets-2", "military-2")
  LSlib.technology.addPrerequisite("bob-turrets-3", string.format(scienceNames.gray, "pack"))
  for level = 3, 5 do
    LSlib.technology.addIngredient(string.format("bob-turrets-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end
  LSlib.technology.addPrerequisite("bob-turrets-4", "military-3")
  LSlib.technology.addIngredient("bob-turrets-4", 1, string.format(scienceNames.gray, "pack"))
  LSlib.technology.addPrerequisite("bob-turrets-5", string.format(scienceNames.purple, "pack"))

  -- laser turrets
  LSlib.technology.addPrerequisite("bob-laser-turrets-3", "military-3")
  LSlib.technology.addIngredient("bob-laser-turrets-3", 1, string.format(scienceNames.gray, "pack"))
  LSlib.technology.addPrerequisite("bob-laser-turrets-5", "military-4")
  for level = 2, 5 do
    LSlib.technology.addIngredient(string.format("bob-laser-turrets-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-laser-turrets-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- sniper turrets
  LSlib.technology.addPrerequisite("bob-sniper-turrets-1", string.format(scienceNames.gray, "pack"))
  LSlib.technology.addPrerequisite("bob-sniper-turrets-2", "military-3")
  LSlib.technology.addPrerequisite("bob-sniper-turrets-3", "military-4")
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("bob-sniper-turrets-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end

  -- artillery turrets
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("bob-artillery-turret-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end

  -- TANKS ---------------------------------------------------------------------
  LSlib.technology.addPrerequisite("bob-tanks-3", "military-4")
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("bob-tanks-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end

  -- RADAR ---------------------------------------------------------------------
  for level = 2, 4 do
    LSlib.technology.addIngredient(string.format("radars-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end

  -- ROBOTS --------------------------------------------------------------------
  if settings.startup["bobmods-warfare-robotupdate"].value == true then
    LSlib.technology.addIngredient("combat-robotics-4", 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient("combat-robotics-4", 1, string.format(scienceNames.cyan, "pack"))
  end

  -- TRAINS --------------------------------------------------------------------
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("bob-artillery-wagon-%i", level), 1, string.format(scienceNames.orange, "pack"))
  end

  --[[
  -- radars
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("radars-" .. level, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addIngredient("radars-3", 1, "military-science-pack")
  MoreScience.lib.technology.addIngredient("radars-4", 1, "high-tech-science-pack")

  -- turrets
  MoreScience.lib.technology.addPrerequisite("bob-turrets-2", "military-2")
  MoreScience.lib.technology.addPrerequisite("bob-turrets-3", "basic-military-science-research")
  MoreScience.lib.technology.addPrerequisite("bob-turrets-4", "military-3")
  MoreScience.lib.technology.addIngredient("bob-turrets-4", 1, "military-science-pack")
  MoreScience.lib.technology.addPrerequisite("bob-turrets-5", "military-4")
  MoreScience.lib.technology.addIngredient("bob-turrets-5", 1, "high-tech-science-pack")

  -- sniper turrets
  MoreScience.lib.technology.addPrerequisite("bob-sniper-turrets-1", "basic-military-science-research")
  MoreScience.lib.technology.removePrerequisite("bob-sniper-turrets-1", "turrets")
  MoreScience.lib.technology.addPrerequisite("bob-sniper-turrets-1", "bob-turrets-2")
  MoreScience.lib.technology.addPrerequisite("bob-sniper-turrets-2", "military-3")
  MoreScience.lib.technology.addPrerequisite("bob-sniper-turret-damage-5", "military-3")
  MoreScience.lib.technology.addPrerequisite("bob-sniper-turrets-3", "military-4")
  MoreScience.lib.technology.addPrerequisite("bob-sniper-turret-damage-6", "military-4")
  MoreScience.lib.technology.addIngredient("bob-sniper-turret-damage-7", 1, "basic-automation-science-pack")
  MoreScience.infusedScience.changeToInfusedSciencePack("bob-sniper-turret-damage-7", {"military-science-pack","high-tech-science-pack","basic-automation-science-pack"})

  -- laser turrets
  for level = 2, 5, 1 do
    MoreScience.lib.technology.addIngredient("bob-laser-turrets-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("bob-laser-turrets-" .. level, 1, "basic-power-science-pack")
  end

  -- laser riffle
  MoreScience.lib.technology.addPrerequisite("bob-laser-rifle-damage-6", "military-4")
  MoreScience.lib.technology.addPrerequisite("bob-laser-rifle-speed-6", "military-4")
  MoreScience.lib.technology.addIngredient("bob-laser-rifle-damage-7", 1, "basic-automation-science-pack")
  MoreScience.infusedScience.changeToInfusedSciencePack("bob-laser-rifle-damage-7", {"military-science-pack","high-tech-science-pack","basic-automation-science-pack"})

  -- portable solar pannels
  for level = 2, 4, 1 do
    MoreScience.lib.technology.addIngredient("solar-panel-equipment-" .. level, 1, "basic-automation-science-pack")
    MoreScience.lib.technology.addIngredient("solar-panel-equipment-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addIngredient("solar-panel-equipment-4", 1, "high-tech-science-pack")

  -- nightvision equipment
  for level = 2, 3, 1 do
    MoreScience.lib.technology.addIngredient("night-vision-equipment-" .. level, 1, "basic-automation-science-pack")
  end
  MoreScience.lib.technology.addIngredient("night-vision-equipment-3", 1, "production-science-pack")
  MoreScience.lib.technology.addIngredient("night-vision-equipment-3", 1, "high-tech-science-pack")

  -- exoskeleton equipment
  MoreScience.lib.technology.addIngredient("exoskeleton-equipment-2", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addIngredient("exoskeleton-equipment-3", 1, "production-science-pack")

  -- battery equipment
  for level = 3, 6, 1 do
    MoreScience.lib.technology.addIngredient("battery-equipment-" .. level, 1, "basic-power-science-pack")
  end
  --MoreScience.lib.technology.removeIngredient("battery-equipment-4", 1, "production-science-pack")
  MoreScience.lib.technology.addPrerequisite("battery-equipment-4", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("battery-equipment-4", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addIngredient("battery-equipment-5", 1, "high-tech-science-pack")

  -- personal laser defence
  for level = 2, 6, 1 do
    MoreScience.lib.technology.addIngredient("personal-laser-defense-equipment-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("personal-laser-defense-equipment-4", "military-4")

  -- energy shield equipments
  for level = 3, 6, 1 do
    MoreScience.lib.technology.addIngredient("energy-shield-equipment-" .. level, 1, "basic-power-science-pack")
  end
  MoreScience.lib.technology.addIngredient("energy-shield-equipment-3", 1, "high-tech-science-pack")
  MoreScience.lib.technology.addIngredient("energy-shield-equipment-6", 1, "space-science-pack")
  MoreScience.lib.technology.changeCount("energy-shield-equipment-6", 1500)
  MoreScience.infusedScience.changeToInfusedSciencePack("energy-shield-equipment-6", {"military-science-pack","high-tech-science-pack","basic-power-science-pack"})

  MoreScience.lib.technology.addIngredient("fusion-reactor-equipment-4", 1, "space-science-pack")
  MoreScience.lib.technology.changeCount("fusion-reactor-equipment-4", 2000)
  MoreScience.infusedScience.changeToInfusedSciencePack("fusion-reactor-equipment-4", {"military-science-pack","production-science-pack","high-tech-science-pack","basic-power-science-pack"})

  -- tanks
  for level = 2, 3, 1 do
    MoreScience.lib.technology.addIngredient("bob-tanks-" .. level, 1, "basic-logistics-science-pack")
  end
  MoreScience.lib.technology.addPrerequisite("bob-tanks-3", "military-4")
  MoreScience.lib.technology.addIngredient("bob-robot-tanks", 1, "science-pack-3")
  MoreScience.lib.technology.addIngredient("bob-robot-tanks", 1, "basic-logistics-science-pack")

  -- ammo
  MoreScience.lib.technology.addPrerequisite("nitroglycerin-processing", "basic-military-science-research")
  MoreScience.lib.technology.addPrerequisite("uranium-ammo", "bob-shotgun-shells")

  if mods["angelssmelting"] then
    MoreScience.lib.technology.addPrerequisite("bob-bullets", "angels-lead-smelting-1")
    MoreScience.lib.technology.addPrerequisite("bob-shotgun-shells", "angels-lead-smelting-1")

    if mods["bobplates"] then
      MoreScience.lib.technology.addPrerequisite("bob-bullets", "angels-gunmetal-smelting-1")
      MoreScience.lib.technology.addPrerequisite("bob-shotgun-shells", "angels-gunmetal-smelting-1")
    end
  end

  -- landmines
  MoreScience.lib.technology.addIngredient("poison-mine", 1, "military-science-pack")
  MoreScience.lib.technology.addIngredient("slowdown-mine", 1, "military-science-pack")
  MoreScience.lib.technology.addIngredient("distractor-mine", 1, "military-science-pack")

  -- combat robotics
  for level = 1, 4, 1 do
    if level == 1 then
      MoreScience.lib.technology.addIngredient("combat-robotics", 1, "basic-logistics-science-pack")
    else
      MoreScience.lib.technology.addIngredient("combat-robotics-" .. level, 1, "basic-logistics-science-pack")
    end
  end

  -- artilelry shell damage
  MoreScience.lib.technology.addPrerequisite("bob-artillery-damage-4", "military-4")
  MoreScience.lib.technology.addIngredient("bob-artillery-damage-6", 1, "basic-automation-science-pack")
  MoreScience.infusedScience.changeToInfusedSciencePack("bob-artillery-damage-6", {"military-science-pack","high-tech-science-pack","basic-automation-science-pack"})

  -- armor
  MoreScience.lib.technology.addIngredient("bob-power-armor-5", 1, "basic-power-science-pack")
  MoreScience.lib.technology.addIngredient("bob-power-armor-5", 1, "space-science-pack")
  MoreScience.lib.technology.changeCount("bob-power-armor-5", 2500)
  MoreScience.infusedScience.changeToInfusedSciencePack("bob-power-armor-5", {"military-science-pack","high-tech-science-pack","basic-power-science-pack"})
  ]]
end
