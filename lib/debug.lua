
Debug = {}

Debug.enabled = true
Debug.returnValue = 11

function Debug:reseachAllTechnologies()
  force = game.forces["player"]

  local function researchTechnology(technologyName, printWarning)
    if not (printWarning == true or printWarning == false) then printWarning = true end

    if force.technologies[technologyName] and force.technologies[technologyName].enabled then
      -- check prerequisites
      for _,prerequisite in pairs(force.technologies[technologyName].prerequisites) do
        if not prerequisite.researched then
          if printWarning then
            log(string.format("WARNING: Could not research %q", technologyName))
          end
          return false
        end
      end
      -- do the research
      force.technologies[technologyName].researched = true
      return true
    end
    return false
  end


--------------------------------------------------------------------------------
----- Red science                                                          -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("basic-automation", false)
  researchTechnology("automation", false)
  researchTechnology("logistics", false)
  researchTechnology("military", false)
  researchTechnology("stone-walls", false)
  researchTechnology("turrets", false)
  researchTechnology("bullet-damage-1", false)
  researchTechnology("bullet-speed-1", false)
  researchTechnology("shotgun-shell-damage-1", false)
  researchTechnology("shotgun-shell-speed-1", false)
  researchTechnology("optics", false)
  researchTechnology("electronics", false)
  researchTechnology("automation-2", false)
  researchTechnology("steel-processing", false)
  researchTechnology("fluid-handling", false)
  researchTechnology("heavy-armor", false)

  -- PART 2: angelsrefining
  if game.active_mods["angelsrefining"] then
    researchTechnology("ore-crushing")
    researchTechnology("water-treatment")
    researchTechnology("water-treatment-2")
    if game.active_mods["angelssmelting"] then
      researchTechnology("water-washing-1")
    end
    if game.active_mods["bobplates"] then
      researchTechnology("ore-advanced-crushing")
    end
  end

  -- PART 3: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("basic-chemistry")
    researchTechnology("angels-fluid-control")
    researchTechnology("angels-coal-processing")
    researchTechnology("basic-chemistry-2")
    researchTechnology("angels-nitrogen-processing-1")
    researchTechnology("angels-sulfur-processing-1")
  end

  -- PART 4: angelssmelting
  if game.active_mods["angelssmelting"] then
    researchTechnology("angels-metallurgy-1")
    researchTechnology("angels-lead-smelting-1")
    researchTechnology("angels-tin-smelting-1")
    researchTechnology("angels-solder-smelting-1")
    researchTechnology("angels-copper-smelting-1")
    researchTechnology("angels-iron-smelting-1")
    researchTechnology("angels-stone-smelting-1")
    if game.active_mods["bobplates"] then
      researchTechnology("angels-bronze-smelting-1")
    end
  end

  -- PART 5: angelsbioprocessing
  if game.active_mods["angelsbioprocessing"] then
    researchTechnology("bio-processing-green")
    researchTechnology("bio-processing-brown")
    researchTechnology("bio-wood-processing")
    researchTechnology("bio-wood-processing-2")
    researchTechnology("gardens")
    researchTechnology("bio-farm")
    researchTechnology("bio-aboretum-1")
    researchTechnology("bio-paper-1")

    researchTechnology("bio-desert-farming")
    researchTechnology("bio-temperate-farming")
    researchTechnology("bio-swamp-farming")
  end

  -- PART 6: angelswarehouses
  if game.active_mods["angelsaddons-warehouses"] then
    researchTechnology("angels-warehouses")
  end

  -- PART 6: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("electrolysis-1")
    researchTechnology("chemical-processing-1")
    researchTechnology("water-bore-1")
    researchTechnology("alloy-processing-1")
  end

  -- PART 7: bobassembly
  if game.active_mods["bobassembly"] then
    researchTechnology("electronics-machine-1")
  end

  -- PART 8: bobinserters
  if game.active_mods["bobinserters"] then
    researchTechnology("long-inserters-1")
    researchTechnology("near-inserters")
  end

  -- PART 9: bobmining
  if game.active_mods["bobmining"] then
    researchTechnology("bob-drills-1")
    researchTechnology("bob-area-drills-1")
  end

  if Debug.returnValue == 1 then
    return
  end

  -- PART 10: morescience
  researchTechnology("basic-science-research-1")
  researchTechnology("research-speed-1")
  researchTechnology("bottling-research")
  researchTechnology("research-speed-2")



--------------------------------------------------------------------------------
----- Green science                                                        -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-2", false)
  researchTechnology("toolbelt", false)
  researchTechnology("landfill", false)
  researchTechnology("electric-energy-distribution-1", false)
  researchTechnology("military-2", false)
  researchTechnology("gates", false)
  researchTechnology("bullet-damage-2", false)
  researchTechnology("bullet-speed-2", false)
  researchTechnology("bullet-speed-3", false)
  researchTechnology("gun-turret-damage-1", false)
  researchTechnology("gun-turret-damage-2", false)
  researchTechnology("shotgun-shell-damage-2", false)
  researchTechnology("shotgun-shell-speed-2", false)
  researchTechnology("shotgun-shell-speed-3", false)

  -- PART 2: angelsrefining
  if game.active_mods["angelsrefining"] then
    researchTechnology("advanced-ore-refining-1")
    researchTechnology("slag-processing-1")
    if game.active_mods["angelssmelting"] then
      researchTechnology("water-washing-2")
    end
    if game.active_mods["bobplates"] then
      researchTechnology("geode-processing-1")
    end
  end

  -- PART 3: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("chlorine-processing-1")
    researchTechnology("angels-sulfur-processing-2")
    researchTechnology("oil-gas-extraction")
    researchTechnology("angels-flare-stack")
    researchTechnology("gas-processing")
    researchTechnology("gas-steam-cracking-1")
    researchTechnology("angels-oil-processing")
    researchTechnology("angels-advanced-chemistry-1")
    researchTechnology("angels-coal-processing-2")
    researchTechnology("angels-nitrogen-processing-2")
    researchTechnology("rocket-booster-1")
    researchTechnology("oil-steam-cracking-1")
    researchTechnology("angels-electric-boiler")
    researchTechnology("resin-1")
  end

  -- PART 4: angelssmelting
  if game.active_mods["angelssmelting"] then
    researchTechnology("angels-coolant-1")
    researchTechnology("angels-metallurgy-2")
    researchTechnology("powder-metallurgy-1")

    researchTechnology("angels-chrome-smelting-1")
    researchTechnology("angels-cobalt-smelting-1")
    researchTechnology("angels-gold-smelting-1")
    researchTechnology("angels-manganese-smelting-1")
    researchTechnology("angels-nickel-smelting-1")
    researchTechnology("angels-silicon-smelting-1")
    researchTechnology("angels-silver-smelting-1")
    researchTechnology("angels-steel-smelting-1")
    researchTechnology("angels-titanium-smelting-1")
    researchTechnology("angels-zinc-smelting-1")
    researchTechnology("angels-aluminium-smelting-1")
    researchTechnology("angels-glass-smelting-1")
    researchTechnology("angels-solder-smelting-2")
    if game.active_mods["bobplates"] then
      researchTechnology("angels-brass-smelting-1")
      researchTechnology("angels-cobalt-steel-smelting-1")
      researchTechnology("angels-electrum-smelting-1")
      researchTechnology("angels-gunmetal-smelting-1")
      researchTechnology("angels-invar-smelting-1")
      researchTechnology("angels-bronze-smelting-2")
    else
      researchTechnology("angels-platinum-smelting-1")
    end
  end

  -- PART 5: angelsbioprocessing
  if game.active_mods["angelsbioprocessing"] then
    researchTechnology("bio-fermentation")
    researchTechnology("bio-nutrient-paste")
    researchTechnology("bio-desert-farm")
    researchTechnology("bio-temperate-farm")
    researchTechnology("bio-swamp-farm")
    researchTechnology("bio-pressing")
    researchTechnology("bio-aboretum-2")
    researchTechnology("bio-paper-2")
    researchTechnology("bio-processing-blue")
    researchTechnology("bio-wood-processing-3")
    researchTechnology("bio-plastic-1")
    researchTechnology("bio-processing-paste")
  end

  -- PART 6: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("electrolysis-2")
    researchTechnology("chemical-processing-2")
    researchTechnology("water-bore-1")
    researchTechnology("alloy-processing-1")
    researchTechnology("lithium-processing")
    researchTechnology("zinc-processing")
    researchTechnology("silicon-processing")
    researchTechnology("cobalt-processing")
    researchTechnology("grinding")
    researchTechnology("gem-processing-1")
    if game.active_mods["angelsrefining"] then
      researchTechnology("ore-powderizer")
    end
  end


  -- PART 7: boblogistics
  if game.active_mods["boblogistics"] then
    researchTechnology("character-inventory-slots-1")
    researchTechnology("toolbelt")
  end

  -- PART 8: bobmining
  if game.active_mods["bobmining"] then
    researchTechnology("bob-pumpjacks-1")
  end

  if Debug.returnValue == 2 then
    return
  end

  -- PART 9: morescience
  researchTechnology("basic-military-science-research")



--------------------------------------------------------------------------------
----- gray science                                                         -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("bullet-damage-3", false)
  researchTechnology("bullet-damage-4", false)
  researchTechnology("bullet-speed-4", false)
  researchTechnology("gun-turret-damage-3", false)
  researchTechnology("gun-turret-damage-4", false)
  researchTechnology("shotgun-shell-damage-3", false)
  researchTechnology("shotgun-shell-damage-4", false)
  researchTechnology("shotgun-shell-speed-4", false)
  researchTechnology("grenade-damage-1", false)
  researchTechnology("grenade-damage-2", false)
  researchTechnology("grenade-damage-3", false)

  if Debug.returnValue == 3 then
    return
  end

  -- PART 2: morescience
  researchTechnology("basic-automation-science-research")



--------------------------------------------------------------------------------
----- orange science                                                       -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-3", false)
  researchTechnology("circuit-network", false)
  researchTechnology("oil-processing", false)
  researchTechnology("plastics", false)
  researchTechnology("advanced-electronics", false)
  researchTechnology("sulfur-processing", false)
  researchTechnology("battery", false)
  researchTechnology("engine", false)
  researchTechnology("advanced-material-processing", false)
  researchTechnology("concrete", false)
  researchTechnology("modules", false)
  researchTechnology("speed-module", false)
  researchTechnology("productivity-module", false)
  researchTechnology("mining-productivity-1", false)
  researchTechnology("railway", false)
  researchTechnology("automated-rail-transportation", false)
  researchTechnology("rail-signals", false)
  researchTechnology("modular-armor", false)
  researchTechnology("night-vision-equipment", false)
  researchTechnology("flammables", false)
  researchTechnology("flamethrower", false)
  researchTechnology("explosives", false)
  researchTechnology("land-mine", false)
  researchTechnology("rocketry", false)
  researchTechnology("laser", false)
  researchTechnology("cliff-explosives", false)
  researchTechnology("flamethrower-damage-1", false)
  researchTechnology("flamethrower-damage-2", false)
  researchTechnology("rocket-damage-1", false)
  researchTechnology("rocket-damage-2", false)
  researchTechnology("rocket-speed-1", false)
  researchTechnology("rocket-speed-2", false)

  -- PART 2: angelsrefining
  if game.active_mods["angelsrefining"] then
    researchTechnology("ore-floatation")
    researchTechnology("advanced-ore-refining-2")
    if game.active_mods["angelspetrochem"] then
      researchTechnology("water-treatment-3")
    end
    if game.active_mods["bobplates"] then
      researchTechnology("geode-processing-2")
    end
  end

  -- PART 3: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("angels-advanced-chemistry-2")
    researchTechnology("rubber")
    researchTechnology("angels-explosives-1")
    researchTechnology("plastic-1")
  end

  -- PART 4: angelssmelting
  if game.active_mods["angelssmelting"] then
    researchTechnology("ore-processing-1")
    researchTechnology("strand-casting-1")

    researchTechnology("angels-copper-smelting-2")
    researchTechnology("angels-glass-smelting-2")
    researchTechnology("angels-iron-smelting-2")
    researchTechnology("angels-lead-smelting-2")
    researchTechnology("angels-stone-smelting-2")
    researchTechnology("angels-tin-smelting-2")
  end

  -- PART 5: angelsbioprocessing
  if game.active_mods["angelsbioprocessing"] then
    researchTechnology("bio-aboretum-temperate-1")
    researchTechnology("bio-aboretum-swamp-1")
    researchTechnology("bio-aboretum-desert-1")
  end

  -- PART 6: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("mixing-steel-furnace")
    researchTechnology("water-bore-2")
    researchTechnology("polishing")
  end

  -- PART 7: bobassembly
  if game.active_mods["bobassembly"] then
    researchTechnology("automation-3")
    researchTechnology("electronics-machine-2")
    researchTechnology("electrolyser-2")
  end

  --PART 8: boblogistics
  if game.active_mods["boblogistics"] then
    researchTechnology("bob-fluid-handling-2")
    researchTechnology("bob-railway-2")
    researchTechnology("inserter-stack-size-bonus-1")
  end

  -- PART 9: bobmining
  if game.active_mods["bobmining"] then
    researchTechnology("bob-drills-2")
    researchTechnology("bob-area-drills-2")
    researchTechnology("bob-pumpjacks-2")
  end

  if self.returnValue == 4 then
    return
  end

  -- PART 10: morescience
  researchTechnology("basic-power-science-research")



--------------------------------------------------------------------------------
----- light blue science                                                   -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("solar-energy", false)
  researchTechnology("electric-energy-accumulators-1", false)
  researchTechnology("effectivity-module", false)
  researchTechnology("laser-turrets", false)
  researchTechnology("solar-panel-equipment", false)
  researchTechnology("battery-equipment", false)
  researchTechnology("energy-shield-equipment", false)
  researchTechnology("laser-turret-damage-1", false)
  researchTechnology("laser-turret-damage-2", false)
  researchTechnology("laser-turret-speed-1", false)
  researchTechnology("laser-turret-speed-2", false)

  if self.returnValue == 5 then
    return
  end

  -- PART 2: morescience
  researchTechnology("basic-science-research-2")



--------------------------------------------------------------------------------
-----  blue science                                                        -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-4", false)
  researchTechnology("advanced-oil-processing", false)
  researchTechnology("advanced-material-processing-2", false)
  researchTechnology("advanced-electronics-2", false)
  researchTechnology("electric-engine", false)
  researchTechnology("speed-module-2", false)
  researchTechnology("productivity-module-2", false)
  researchTechnology("mining-productivity-4", false)
  researchTechnology("fluid-handling-2", false)
  researchTechnology("electric-energy-distribution-2", false)
  researchTechnology("nuclear-power", false)
  researchTechnology("effectivity-module-2", false)
  researchTechnology("flying", false)
  researchTechnology("combat-robotics", false)
  researchTechnology("military-3", false)
  researchTechnology("explosive-rocketry", false)
  researchTechnology("combat-robotics-2", false)
  researchTechnology("battery-mk2-equipment", false)
  researchTechnology("exoskeleton-equipment", false)
  researchTechnology("power-armor", false)
  researchTechnology("energy-shield-mk2-equipment", false)
  researchTechnology("personal-laser-defense-equipment", false)
  researchTechnology("discharge-defense-equipment", false)
  researchTechnology("bullet-damage-5", false)
  researchTechnology("bullet-speed-5", false)
  researchTechnology("gun-turret-damage-5", false)
  researchTechnology("shotgun-shell-damage-5", false)
  researchTechnology("shotgun-shell-speed-5", false)
  researchTechnology("grenade-damage-4", false)
  researchTechnology("grenade-damage-5", false)
  researchTechnology("flamethrower-damage-3", false)
  researchTechnology("flamethrower-damage-4", false)
  researchTechnology("rocket-damage-3", false)
  researchTechnology("rocket-damage-4", false)
  researchTechnology("rocket-damage-5", false)
  researchTechnology("rocket-speed-3", false)
  researchTechnology("rocket-speed-4", false)
  researchTechnology("rocket-speed-5", false)
  researchTechnology("laser-turret-damage-3", false)
  researchTechnology("laser-turret-damage-4", false)
  researchTechnology("laser-turret-speed-3", false)
  researchTechnology("laser-turret-speed-4", false)
  researchTechnology("combat-robot-damage-1", false)
  researchTechnology("combat-robot-damage-2", false)
  researchTechnology("combat-robot-damage-3", false)
  researchTechnology("combat-robot-damage-4", false)
  researchTechnology("follower-robot-count-1", false)
  researchTechnology("follower-robot-count-2", false)
  researchTechnology("follower-robot-count-3", false)
  researchTechnology("follower-robot-count-4", false)


  -- PART 2: angelsrefining
  if game.active_mods["angelsrefining"] then
    researchTechnology("slag-processing-2")
    researchTechnology("ore-leaching")
    researchTechnology("advanced-ore-refining-3")
    researchTechnology("thermal-water-extraction")
    researchTechnology("ore-refining")
    researchTechnology("advanced-ore-refining-4")
    if game.active_mods["angelspetrochem"] then
      researchTechnology("water-treatment-4")
    end
    if game.active_mods["bobplates"] then
      researchTechnology("ore-advanced-floatation")
      researchTechnology("geode-crystallization")
      researchTechnology("ore-electro-whinning-cell")
    end
  end

  -- PART 3: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("gas-steam-cracking-2")
    researchTechnology("oil-steam-cracking-2")
    researchTechnology("angels-advanced-gas-processing")
    researchTechnology("angels-advanced-chemistry-3")
    researchTechnology("resin-2")

    researchTechnology("plastic-2")
    researchTechnology("angels-explosives-2")
    researchTechnology("angels-advanced-oil-processing")
    researchTechnology("angels-coal-cracking")
    researchTechnology("angels-nitrogen-processing-3")
    researchTechnology("rocket-booster-2")
    researchTechnology("chlorine-processing-2")
    researchTechnology("chlorine-processing-3")
    researchTechnology("sodium-processing")
    researchTechnology("gas-synthesis")
  end

  -- PART 4: angelssmelting
  if game.active_mods["angelssmelting"] then
    researchTechnology("angels-metallurgy-3")
    researchTechnology("ore-processing-2")
    researchTechnology("strand-casting-2")
    researchTechnology("powder-metallurgy-2")
    researchTechnology("angels-coolant-2")

    researchTechnology("angels-tungsten-smelting-1")
    researchTechnology("angels-steel-smelting-2")
    researchTechnology("angels-chrome-smelting-2")
    researchTechnology("angels-cobalt-smelting-2")
    researchTechnology("angels-manganese-smelting-2")
    researchTechnology("angels-nickel-smelting-2")
    researchTechnology("angels-lead-smelting-2")
    researchTechnology("angels-zinc-smelting-2")
    researchTechnology("angels-aluminium-smelting-2")
    researchTechnology("angels-gold-smelting-2")
    researchTechnology("angels-silver-smelting-2")
    researchTechnology("angels-titanium-smelting-2")
    researchTechnology("angels-silicon-smelting-2")
    researchTechnology("angels-solder-smelting-3")
    researchTechnology("angels-copper-smelting-3")
    researchTechnology("angels-iron-smelting-3")
    researchTechnology("angels-lead-smelting-3")
    researchTechnology("angels-tin-smelting-3")
    researchTechnology("angels-glass-smelting-3")
    researchTechnology("angels-stone-smelting-3")

    if game.active_mods["bobplates"] then
      researchTechnology("angels-brass-smelting-2")
      researchTechnology("angels-bronze-smelting-3")
      researchTechnology("angels-nitinol-smelting-1")
    else
      researchTechnology("angels-platinum-smelting-2")
    end
  end

  -- PART 5: angelsbioprocessing
  if game.active_mods["angelsbioprocessing"] then
    researchTechnology("bio-plastic-2")
    researchTechnology("bio-aboretum-3")
    researchTechnology("bio-paper-3")
    researchTechnology("bio-processing-red")
    researchTechnology("bio-aboretum-temperate-2")
    researchTechnology("bio-aboretum-temperate-3")
    researchTechnology("bio-aboretum-swamp-2")
    researchTechnology("bio-aboretum-swamp-3")
    researchTechnology("bio-aboretum-desert-2")
    researchTechnology("bio-aboretum-desert-3")
    researchTechnology("bio-processing-alien")
  end

  -- PART 6: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("ceramics")
    researchTechnology("titanium-processing")
    researchTechnology("tungsten-processing")
    researchTechnology("alloy-processing-2")
    researchTechnology("chemical-processing-3")
    researchTechnology("battery-2")
    researchTechnology("water-bore-3")
    researchTechnology("gem-processing-2")
  end

  -- PART 7: bobassembly
  if game.active_mods["bobassembly"] then
    researchTechnology("automation-4")
    researchTechnology("electronics-machine-3")
    researchTechnology("electrolyser-3")
    researchTechnology("chemical-plant-2")
    researchTechnology("chemical-plant-3")
    researchTechnology("advanced-material-processing-3")
    researchTechnology("multi-purpose-furnace-1")
  end

  --PART 8: boblogistics
  if game.active_mods["boblogistics"] then
    researchTechnology("bob-fluid-handling-3")
    researchTechnology("bob-railway-3")
    researchTechnology("bob-armoured-railway")
    researchTechnology("inserter-stack-size-bonus-2")
    researchTechnology("express-inserters")
    researchTechnology("character-inventory-slots-2")
    researchTechnology("toolbelt-2")
  end

  -- PART 9: bobmining
  if game.active_mods["bobmining"] then
    researchTechnology("bob-drills-3")
    researchTechnology("bob-area-drills-3")
    researchTechnology("bob-pumpjacks-3")
  end

  if self.returnValue == 6 then
    return
  end

  -- PART 10: morescience
  researchTechnology("basic-logistics-science-research")



--------------------------------------------------------------------------------
-----  pink science                                                        -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("logistics-2", false)
  researchTechnology("stack-inserter", false)
  researchTechnology("fluid-wagon", false)
  researchTechnology("fluid-handling-3", false)
  researchTechnology("robotics", false)
  researchTechnology("construction-robotics", false)
  researchTechnology("logistic-robotics", false)
  researchTechnology("character-logistic-slots-1", false)
  researchTechnology("character-logistic-slots-2", false)
  researchTechnology("character-logistic-slots-3", false)
  researchTechnology("character-logistic-trash-slots-1", false)
  researchTechnology("character-logistic-trash-slots-2", false)
  researchTechnology("auto-character-logistic-trash-slots", false)
  researchTechnology("personal-roboport-equipment", false)
  researchTechnology("automobilism", false)
  researchTechnology("tanks", false)
  researchTechnology("inserter-capacity-bonus-1", false)
  researchTechnology("inserter-capacity-bonus-2", false)
  researchTechnology("inserter-capacity-bonus-3", false)
  researchTechnology("braking-force-1", false)
  researchTechnology("braking-force-2", false)
  researchTechnology("worker-robots-storage-1", false)
  researchTechnology("worker-robots-speed-1", false)
  researchTechnology("worker-robots-speed-2", false)
  researchTechnology("cannon-shell-damage-1", false)
  researchTechnology("cannon-shell-damage-2", false)
  researchTechnology("cannon-shell-damage-3", false)
  researchTechnology("cannon-shell-speed-1", false)
  researchTechnology("cannon-shell-speed-2", false)
  researchTechnology("cannon-shell-speed-3", false)

  -- PART 2: bobinserters
  if game.active_mods["bobinserters"] then
    researchTechnology("more-inserters-1")
  end

  --PART 3: boblogistics
  if game.active_mods["boblogistics"] then
    researchTechnology("bob-fluid-wagon-2")
    researchTechnology("bob-armoured-fluid-wagon")
    researchTechnology("bob-armoured-railway")
    researchTechnology("bob-robo-modular-1")
    researchTechnology("bob-robotics-2")
    researchTechnology("bob-robo-modular-2")
    researchTechnology("bob-robots-1")
    researchTechnology("stack-inserter-2")
    researchTechnology("inserter-capacity-bonus-3")
    researchTechnology("inserter-capacity-bonus-4")
    researchTechnology("logistic-system")
  end

  if self.returnValue == 7 then
    return
  end

  -- PART 4: morescience
  researchTechnology("advanced-science-research-1")



--------------------------------------------------------------------------------
----- purple science                                                       -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-5", false)
  researchTechnology("automation-3", false)
  researchTechnology("logistics-3", false)
  researchTechnology("coal-liquefaction", false)
  researchTechnology("productivity-module-3", false)
  researchTechnology("wood-plantation", false)
  researchTechnology("character-logistic-slots-4", false)
  researchTechnology("character-logistic-slots-5", false)
  researchTechnology("mining-productivity-8", false)
  researchTechnology("inserter-capacity-bonus-4", false)
  researchTechnology("inserter-capacity-bonus-5", false)
  researchTechnology("inserter-capacity-bonus-6", false)
  researchTechnology("braking-force-3", false)
  researchTechnology("braking-force-4", false)
  researchTechnology("braking-force-5", false)
  researchTechnology("worker-robots-storage-2", false)
  researchTechnology("worker-robots-speed-3", false)
  researchTechnology("worker-robots-speed-4", false)
  researchTechnology("nuclear-fuel-reprocessing", false)

  -- PART 2: angelssmelting
  if game.active_mods["angelssmelting"] then
    researchTechnology("ore-processing-3")
    researchTechnology("strand-casting-3")
    researchTechnology("powder-metallurgy-3")
  end

  -- PART 3: bobtech
  if game.active_mods["bobtech"] then
    researchTechnology("advanced-research")
  end

  -- PART 4: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("tungsten-alloy-processing")
    researchTechnology("nitinol-processing")
    researchTechnology("battery-3")
  end

  -- PART 5: bobinserters
  if game.active_mods["bobinserters"] then
    researchTechnology("more-inserters-2")
    researchTechnology("long-inserters-2")
  end

  -- PART 6: bobassembly
  if game.active_mods["bobassembly"] then
    researchTechnology("automation-5")
  end

  --PART 7: boblogistics
  if game.active_mods["boblogistics"] then
    researchTechnology("bob-fluid-wagon-3")
    researchTechnology("bob-armoured-fluid-wagon-2")
    researchTechnology("bob-armoured-railway-2")
    researchTechnology("bob-robotics-3")
    researchTechnology("bob-robo-modular-3")
    researchTechnology("bob-robots-2")
    researchTechnology("character-logistic-slots-6")
    researchTechnology("character-logistic-slots-7")
    researchTechnology("inserter-stack-size-bonus-3")
    researchTechnology("inserter-capacity-bonus-5")
    researchTechnology("inserter-capacity-bonus-6")
    researchTechnology("character-inventory-slots-3")
    researchTechnology("toolbelt-3")
    researchTechnology("bob-logistics-4")
    researchTechnology("bob-fluid-handling-4")
    researchTechnology("logistic-system-2")
  end

  if self.returnValue == 8 then
    return
  end

  -- PART 8: morescience
  researchTechnology("advanced-science-research-2")



--------------------------------------------------------------------------------
----- yellow science                                                      -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("advanced-science-research-2", false)
  researchTechnology("research-speed-6", false)
  researchTechnology("speed-module-3", false)
  researchTechnology("effectivity-module-3", false)
  researchTechnology("effect-transmission", false)
  researchTechnology("logistic-system", false)
  researchTechnology("character-logistic-slots-6", false)
  researchTechnology("kovarex-enrichment-process", false)
  researchTechnology("military-4", false)
  researchTechnology("combat-robotics-3", false)
  researchTechnology("uranium-ammo", false)
  researchTechnology("atomic-bomb", false)
  researchTechnology("artillery", false)
  researchTechnology("fusion-reactor-equipment", false)
  researchTechnology("personal-roboport-equipment-2", false)
  researchTechnology("power-armor-2", false)
  researchTechnology("mining-productivity-12", false)
  researchTechnology("inserter-capacity-bonus-7", false)
  researchTechnology("braking-force-6", false)
  researchTechnology("braking-force-7", false)
  researchTechnology("worker-robots-storage-3", false)
  researchTechnology("worker-robots-speed-5", false)
  researchTechnology("bullet-damage-6", false)
  researchTechnology("bullet-speed-6", false)
  researchTechnology("gun-turret-damage-6", false)
  researchTechnology("shotgun-shell-damage-6", false)
  researchTechnology("shotgun-shell-speed-6", false)
  researchTechnology("grenade-damage-6", false)
  researchTechnology("flamethrower-damage-5", false)
  researchTechnology("flamethrower-damage-6", false)
  researchTechnology("rocket-damage-6", false)
  researchTechnology("rocket-speed-6", false)
  researchTechnology("rocket-speed-7", false)
  researchTechnology("laser-turret-damage-5", false)
  researchTechnology("laser-turret-damage-6", false)
  researchTechnology("laser-turret-damage-7", false)
  researchTechnology("laser-turret-speed-5", false)
  researchTechnology("laser-turret-speed-6", false)
  researchTechnology("laser-turret-speed-7", false)
  researchTechnology("combat-robot-damage-5", false)
  researchTechnology("follower-robot-count-5", false)
  researchTechnology("follower-robot-count-6", false)
  researchTechnology("cannon-shell-damage-4", false)
  researchTechnology("cannon-shell-damage-5", false)
  researchTechnology("cannon-shell-speed-4", false)
  researchTechnology("cannon-shell-speed-5", false)

  -- PART 2: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("angels-advanced-chemistry-4")
    researchTechnology("resin-3")

    researchTechnology("plastic-3")
    researchTechnology("angels-nitrogen-processing-4")
    researchTechnology("angels-rocket-fuel")
  end

  -- PART 3: angelssmelting
  if game.active_mods["angelssmelting"] then
    researchTechnology("angels-metallurgy-4")
    researchTechnology("ore-processing-4")
    researchTechnology("ore-processing-5")
    researchTechnology("strand-casting-4")
    researchTechnology("powder-metallurgy-4")

    researchTechnology("angels-tungsten-smelting-2")
    researchTechnology("angels-steel-smelting-3")
    researchTechnology("angels-aluminium-smelting-3")
    researchTechnology("angels-titanium-smelting-3")
    researchTechnology("angels-chrome-smelting-3")
    researchTechnology("angels-cobalt-smelting-3")
    researchTechnology("angels-gold-smelting-3")
    researchTechnology("angels-manganese-smelting-3")
    researchTechnology("angels-nickel-smelting-3")
    researchTechnology("angels-silicon-smelting-3")
    researchTechnology("angels-silver-smelting-3")
    researchTechnology("angels-tungsten-smelting-3")
    researchTechnology("angels-zinc-smelting-3")

    if game.active_mods["bobplates"] then
      researchTechnology("angels-brass-smelting-3")
    else
      researchTechnology("advanced-electronics-3")
    end
  end

  -- PART 4: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("battery-3")
    researchTechnology("advanced-electronics-3")
    researchTechnology("water-bore-4")
  end

  -- PART 5: bobassembly
  if game.active_mods["bobassembly"] then
    researchTechnology("automation-6")
    researchTechnology("multi-purpose-furnace-2")
    researchTechnology("electrolyser-4")
    researchTechnology("chemical-plant-4")
    researchTechnology("advanced-material-processing-4")
  end

  --PART 6: boblogistics
  if game.active_mods["boblogistics"] then
    researchTechnology("bob-robotics-4")
    researchTechnology("bob-robo-modular-4")
    researchTechnology("bob-robots-3")
    researchTechnology("character-logistic-slots-8")
    researchTechnology("character-logistic-slots-9")
    researchTechnology("inserter-stack-size-bonus-4")
    researchTechnology("inserter-capacity-bonus-7")
    researchTechnology("bob-logistics-5")
    researchTechnology("logistic-system-3")
  end

  -- PART 7: angels warehouses
  if game.active_mods["angelsaddons-warehouses"] then
    researchTechnology("angels-logistic-warehouses")
  end

  -- PART 8: bobmining
  if game.active_mods["bobmining"] then
    researchTechnology("bob-drills-4")
    researchTechnology("bob-area-drills-4")
    researchTechnology("bob-pumpjacks-4")
  end

  if self.returnValue == 9 then
    return
  end

  -- PART 9: morescience
  researchTechnology("rocket")
  researchTechnology("rocketpart-hull-component")
  researchTechnology("rocketpart-ion-thruster")
  researchTechnology("rocketpart-fusion-reactor")
  researchTechnology("rocketpart-shield-array")
  researchTechnology("rocket-silo")



--------------------------------------------------------------------------------
----- Infinite science research                                            -----
--------------------------------------------------------------------------------

  if self.returnValue == 10 then
    return
  end

  -- PART 1: infinite science research
  researchTechnology("infinite-science-research")
  researchTechnology("infused-basic-science-research-1")
  researchTechnology("infused-basic-science-research-2")
  researchTechnology("infused-basic-science-research-3")
  researchTechnology("infused-advanced-science-research-1")
  researchTechnology("infused-advanced-science-research-2")
  researchTechnology("infused-basic-military-science-research")
  researchTechnology("infused-basic-automation-science-research")
  researchTechnology("infused-basic-power-science-research")
  researchTechnology("infused-basic-logistics-science-research")

  -- PART 2: not-so-infinte-researches
  researchTechnology("bob-robots-4")
  researchTechnology("character-logistic-slots-10")
  researchTechnology("character-inventory-slots-4")


end
