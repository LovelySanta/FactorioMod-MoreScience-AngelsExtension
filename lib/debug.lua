
Debug = {}

Debug.enabled = true
Debug.returnValue = 6

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

  -- PART 4: morescience
  researchTechnology("basic-science-research-1")
  researchTechnology("research-speed-1")
  researchTechnology("bottling-research")
  researchTechnology("research-speed-2")

  if Debug.returnValue == 1 then
    return
  end

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

  -- PART 3: morescience
  researchTechnology("basic-military-science-research")

  if Debug.returnValue == 2 then
    return
  end

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

  -- PART 2: morescience
  researchTechnology("basic-automation-science-research")

  if Debug.returnValue == 3 then
    return
  end

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
    else
      researchTechnology("angels-explosives")
    end
  end


  -- PART 3: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("angels-advanced-chemistry-2")
    researchTechnology("rubber")
    researchTechnology("angels-explosives-1")
    researchTechnology("plastic-1")
  end

  -- PART 4: morescience
  researchTechnology("basic-power-science-research")

  if self.returnValue == 4 then
    return
  end

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

  -- PART 2: morescience
  researchTechnology("basic-science-research-2")

  if self.returnValue == 5 then
    return
  end

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
  end

  -- PART 3: angelspetrochem
  if game.active_mods["angelspetrochem"] then
    researchTechnology("gas-steam-cracking-2")
    researchTechnology("oil-steam-cracking-2")
    researchTechnology("angels-advanced-gas-processing")
    researchTechnology("angels-advanced-chemistry-3")

    researchTechnology("plastic-2")
  end

  -- PART 4: morescience
  --researchTechnology("basic-logistics-science-research")

  if self.returnValue == 6 then
    return
  end

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

  -- PART 2: morescience
  researchTechnology("advanced-science-research-1")

  if self.returnValue == 7 then
    return
  end



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

  -- PART 2: morescience
  researchTechnology("advanced-science-research-2")

  if self.returnValue == 8 then
    return
  end



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

  -- PART 2: morescience
  researchTechnology("rocket")
  researchTechnology("rocketpart-hull-component")
  researchTechnology("rocketpart-ion-thruster")
  researchTechnology("rocketpart-fusion-reactor")
  researchTechnology("rocketpart-shield-array")
  researchTechnology("rocket-silo")
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

  if self.returnValue == 9 then
    return
  end

--------------------------------------------------------------------------------
----- Infinite science research                                            -----
--------------------------------------------------------------------------------

  -- nothing new here, just the infinite sciences

  if self.returnValue == 10 then
    return
  end


end