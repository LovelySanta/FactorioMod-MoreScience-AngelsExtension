
Debug = {}

Debug.enabled = false
Debug.returnValue = -1

function Debug:reseachAllTechnologies()
  force = game.forces["player"]

  local function researchTechnology(technologyName)
    local function reportFail(technologyName)
      log("WARNING: Could not research " .. technologyName)
      return false
    end

    if force.technologies[technologyName] and force.technologies[technologyName].enabled then
      -- check prerequisites
      for _,prerequisite in pairs(force.technologies[technologyName].prerequisites) do
        if not prerequisite.researched then
          return reportFail(technologyName)
        end
      end
      -- do the research
      force.technologies[technologyName].researched = true
      return true
    end
    return reportFail(technologyName)
  end


--------------------------------------------------------------------------------
----- Red science                                                          -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("basic-automation")
  researchTechnology("automation")
  researchTechnology("logistics")
  researchTechnology("military")
  researchTechnology("stone-walls")
  researchTechnology("turrets")
  researchTechnology("bullet-damage-1")
  researchTechnology("bullet-speed-1")
  researchTechnology("shotgun-shell-damage-1")
  researchTechnology("shotgun-shell-speed-1")
  researchTechnology("optics")
  researchTechnology("electronics")
  researchTechnology("automation-2")
  researchTechnology("steel-processing")
  researchTechnology("fluid-handling")
  researchTechnology("heavy-armor")

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

  -- PART 5: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("electrolysis-1")
    researchTechnology("chemical-processing-1")
    researchTechnology("water-bore-1")
    researchTechnology("alloy-processing-1")
  end

  if Debug.returnValue == 1 then
    return
  end

  -- PART 6: morescience
  researchTechnology("basic-science-research-1")
  researchTechnology("research-speed-1")
  researchTechnology("bottling-research")
  researchTechnology("research-speed-2")



--------------------------------------------------------------------------------
----- Green science                                                        -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-2")
  researchTechnology("toolbelt")
  researchTechnology("landfill")
  researchTechnology("electric-energy-distribution-1")
  researchTechnology("military-2")
  researchTechnology("gates")
  researchTechnology("bullet-damage-2")
  researchTechnology("bullet-speed-2")
  researchTechnology("bullet-speed-3")
  researchTechnology("gun-turret-damage-1")
  researchTechnology("gun-turret-damage-2")
  researchTechnology("shotgun-shell-damage-2")
  researchTechnology("shotgun-shell-speed-2")
  researchTechnology("shotgun-shell-speed-3")

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

  -- PART 5: bobplates
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

  if Debug.returnValue == 2 then
    return
  end

  -- PART 6: morescience
  researchTechnology("basic-military-science-research")



--------------------------------------------------------------------------------
----- gray science                                                         -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("bullet-damage-3")
  researchTechnology("bullet-damage-4")
  researchTechnology("bullet-speed-4")
  researchTechnology("gun-turret-damage-3")
  researchTechnology("gun-turret-damage-4")
  researchTechnology("shotgun-shell-damage-3")
  researchTechnology("shotgun-shell-damage-4")
  researchTechnology("shotgun-shell-speed-4")
  researchTechnology("grenade-damage-1")
  researchTechnology("grenade-damage-2")
  researchTechnology("grenade-damage-3")

  if Debug.returnValue == 3 then
    return
  end

  -- PART 2: morescience
  researchTechnology("basic-automation-science-research")



--------------------------------------------------------------------------------
----- orange science                                                       -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-3")
  researchTechnology("circuit-network")
  researchTechnology("oil-processing")
  researchTechnology("plastics")
  researchTechnology("advanced-electronics")
  researchTechnology("sulfur-processing")
  researchTechnology("battery")
  researchTechnology("engine")
  researchTechnology("advanced-material-processing")
  researchTechnology("concrete")
  researchTechnology("modules")
  researchTechnology("speed-module")
  researchTechnology("productivity-module")
  researchTechnology("mining-productivity-1")
  researchTechnology("railway")
  researchTechnology("automated-rail-transportation")
  researchTechnology("rail-signals")
  researchTechnology("modular-armor")
  researchTechnology("night-vision-equipment")
  researchTechnology("flammables")
  researchTechnology("flamethrower")
  researchTechnology("explosives")
  researchTechnology("land-mine")
  researchTechnology("rocketry")
  researchTechnology("laser")
  researchTechnology("cliff-explosives")
  researchTechnology("flamethrower-damage-1")
  researchTechnology("flamethrower-damage-2")
  researchTechnology("rocket-damage-1")
  researchTechnology("rocket-damage-2")
  researchTechnology("rocket-speed-1")
  researchTechnology("rocket-speed-2")

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

  -- PART 5: bobplates
  if game.active_mods["bobplates"] then
    researchTechnology("mixing-steel-furnace")
    researchTechnology("water-bore-2")
    researchTechnology("polishing")
  end

  if self.returnValue == 4 then
    return
  end

  -- PART 6: morescience
  researchTechnology("basic-power-science-research")



--------------------------------------------------------------------------------
----- light blue science                                                   -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("solar-energy")
  researchTechnology("electric-energy-accumulators-1")
  researchTechnology("effectivity-module")
  researchTechnology("laser-turrets")
  researchTechnology("solar-panel-equipment")
  researchTechnology("battery-equipment")
  researchTechnology("energy-shield-equipment")
  researchTechnology("laser-turret-damage-1")
  researchTechnology("laser-turret-damage-2")
  researchTechnology("laser-turret-speed-1")
  researchTechnology("laser-turret-speed-2")

  if self.returnValue == 5 then
    return
  end

  -- PART 2: morescience
  researchTechnology("basic-science-research-2")



--------------------------------------------------------------------------------
-----  blue science                                                        -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-4")
  researchTechnology("advanced-oil-processing")
  researchTechnology("advanced-material-processing-2")
  researchTechnology("advanced-electronics-2")
  researchTechnology("electric-engine")
  researchTechnology("speed-module-2")
  researchTechnology("productivity-module-2")
  researchTechnology("mining-productivity-4")
  researchTechnology("fluid-handling-2")
  researchTechnology("electric-energy-distribution-2")
  researchTechnology("nuclear-power")
  researchTechnology("effectivity-module-2")
  researchTechnology("flying")
  researchTechnology("combat-robotics")
  researchTechnology("military-3")
  researchTechnology("explosive-rocketry")
  researchTechnology("combat-robotics-2")
  researchTechnology("battery-mk2-equipment")
  researchTechnology("exoskeleton-equipment")
  researchTechnology("power-armor")
  researchTechnology("energy-shield-mk2-equipment")
  researchTechnology("personal-laser-defense-equipment")
  researchTechnology("discharge-defense-equipment")
  researchTechnology("bullet-damage-5")
  researchTechnology("bullet-speed-5")
  researchTechnology("gun-turret-damage-5")
  researchTechnology("shotgun-shell-damage-5")
  researchTechnology("shotgun-shell-speed-5")
  researchTechnology("grenade-damage-4")
  researchTechnology("grenade-damage-5")
  researchTechnology("flamethrower-damage-3")
  researchTechnology("flamethrower-damage-4")
  researchTechnology("rocket-damage-3")
  researchTechnology("rocket-damage-4")
  researchTechnology("rocket-damage-5")
  researchTechnology("rocket-speed-3")
  researchTechnology("rocket-speed-4")
  researchTechnology("rocket-speed-5")
  researchTechnology("laser-turret-damage-3")
  researchTechnology("laser-turret-damage-4")
  researchTechnology("laser-turret-speed-3")
  researchTechnology("laser-turret-speed-4")
  researchTechnology("combat-robot-damage-1")
  researchTechnology("combat-robot-damage-2")
  researchTechnology("combat-robot-damage-3")
  researchTechnology("combat-robot-damage-4")
  researchTechnology("follower-robot-count-1")
  researchTechnology("follower-robot-count-2")
  researchTechnology("follower-robot-count-3")
  researchTechnology("follower-robot-count-4")


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

  -- PART 5: bobplates
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

  if self.returnValue == 6 then
    return
  end

  -- PART 6: morescience
  researchTechnology("basic-logistics-science-research")



--------------------------------------------------------------------------------
-----  pink science                                                        -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("logistics-2")
  researchTechnology("stack-inserter")
  researchTechnology("fluid-wagon")
  researchTechnology("fluid-handling-3")
  researchTechnology("robotics")
  researchTechnology("construction-robotics")
  researchTechnology("logistic-robotics")
  researchTechnology("character-logistic-slots-1")
  researchTechnology("character-logistic-slots-2")
  researchTechnology("character-logistic-slots-3")
  researchTechnology("character-logistic-trash-slots-1")
  researchTechnology("character-logistic-trash-slots-2")
  researchTechnology("auto-character-logistic-trash-slots")
  researchTechnology("personal-roboport-equipment")
  researchTechnology("automobilism")
  researchTechnology("tanks")
  researchTechnology("inserter-capacity-bonus-1")
  researchTechnology("inserter-capacity-bonus-2")
  researchTechnology("inserter-capacity-bonus-3")
  researchTechnology("braking-force-1")
  researchTechnology("braking-force-2")
  researchTechnology("worker-robots-storage-1")
  researchTechnology("worker-robots-speed-1")
  researchTechnology("worker-robots-speed-2")
  researchTechnology("cannon-shell-damage-1")
  researchTechnology("cannon-shell-damage-2")
  researchTechnology("cannon-shell-damage-3")
  researchTechnology("cannon-shell-speed-1")
  researchTechnology("cannon-shell-speed-2")
  researchTechnology("cannon-shell-speed-3")

  if self.returnValue == 7 then
    return
  end

  -- PART 2: morescience
  researchTechnology("advanced-science-research-1")



--------------------------------------------------------------------------------
----- purple science                                                       -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("research-speed-5")
  researchTechnology("automation-3")
  researchTechnology("logistics-3")
  researchTechnology("coal-liquefaction")
  researchTechnology("productivity-module-3")
  researchTechnology("wood-plantation")
  researchTechnology("character-logistic-slots-4")
  researchTechnology("character-logistic-slots-5")
  researchTechnology("mining-productivity-8")
  researchTechnology("inserter-capacity-bonus-4")
  researchTechnology("inserter-capacity-bonus-5")
  researchTechnology("inserter-capacity-bonus-6")
  researchTechnology("braking-force-3")
  researchTechnology("braking-force-4")
  researchTechnology("braking-force-5")
  researchTechnology("worker-robots-storage-2")
  researchTechnology("worker-robots-speed-3")
  researchTechnology("worker-robots-speed-4")
  researchTechnology("nuclear-fuel-reprocessing")

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

  if self.returnValue == 8 then
    return
  end

  -- PART 4: morescience
  researchTechnology("advanced-science-research-2")



--------------------------------------------------------------------------------
----- yellow science                                                      -----
--------------------------------------------------------------------------------

  -- PART 1: vanilla research
  researchTechnology("advanced-science-research-2")
  researchTechnology("research-speed-6")
  researchTechnology("speed-module-3")
  researchTechnology("effectivity-module-3")
  researchTechnology("effect-transmission")
  researchTechnology("logistic-system")
  researchTechnology("character-logistic-slots-6")
  researchTechnology("kovarex-enrichment-process")
  researchTechnology("military-4")
  researchTechnology("combat-robotics-3")
  researchTechnology("uranium-ammo")
  researchTechnology("atomic-bomb")
  researchTechnology("artillery")
  researchTechnology("fusion-reactor-equipment")
  researchTechnology("personal-roboport-equipment-2")
  researchTechnology("power-armor-2")
  researchTechnology("mining-productivity-12")
  researchTechnology("inserter-capacity-bonus-7")
  researchTechnology("braking-force-6")
  researchTechnology("braking-force-7")
  researchTechnology("worker-robots-storage-3")
  researchTechnology("worker-robots-speed-5")
  researchTechnology("bullet-damage-6")
  researchTechnology("bullet-speed-6")
  researchTechnology("gun-turret-damage-6")
  researchTechnology("shotgun-shell-damage-6")
  researchTechnology("shotgun-shell-speed-6")
  researchTechnology("grenade-damage-6")
  researchTechnology("flamethrower-damage-5")
  researchTechnology("flamethrower-damage-6")
  researchTechnology("rocket-damage-6")
  researchTechnology("rocket-speed-6")
  researchTechnology("rocket-speed-7")
  researchTechnology("laser-turret-damage-5")
  researchTechnology("laser-turret-damage-6")
  researchTechnology("laser-turret-damage-7")
  researchTechnology("laser-turret-speed-5")
  researchTechnology("laser-turret-speed-6")
  researchTechnology("laser-turret-speed-7")
  researchTechnology("combat-robot-damage-5")
  researchTechnology("follower-robot-count-5")
  researchTechnology("follower-robot-count-6")
  researchTechnology("cannon-shell-damage-4")
  researchTechnology("cannon-shell-damage-5")
  researchTechnology("cannon-shell-speed-4")
  researchTechnology("cannon-shell-speed-5")

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

  if game.active_mods["bobplates"] then
    researchTechnology("battery-3")
    researchTechnology("advanced-electronics-3")
    researchTechnology("water-bore-4")
  end

  if self.returnValue == 9 then
    return
  end

  -- PART 4: morescience
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




end
