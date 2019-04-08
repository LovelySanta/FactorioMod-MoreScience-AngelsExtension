
--------------------------------------------------------------------------------
----- Bob plates                                                           -----
--------------------------------------------------------------------------------

if mods["bobplates"] then

  -- barrels -------------------------------------------------------------------
  for barrel, fluidTech in pairs{
    ["nitric-acid"  ] = "nitrogen-processing",
    ["tungstic-acid"] = "tungsten-processing",
  } do
    for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
      LSlib.technology.moveRecipeUnlock("fluid-handling", fluidTech, string.format(barreling, barrel))
    end
  end

  -- gas bottle ----------------------------------------------------------------
  LSlib.technology.addPrerequisite("gas-canisters", "electrolysis-1")
  LSlib.technology.addPrerequisite("nitrogen-processing", "gas-canisters")
  LSlib.technology.addPrerequisite("electrolysis-2", "gas-canisters")
  LSlib.technology.addPrerequisite("chemical-processing-2", "gas-canisters")
  --LSlib.technology.addPrerequisite("sulfur-processing", "gas-canisters")
  for barrel, gasTech in pairs{
    --["hydrogen"         ] = "electrolysis-1"       ,
    --["oxygen"           ] = "electrolysis-1"       ,
    ["nitrogen"         ] = "nitrogen-processing"  ,
    ["nitrogen-dioxide" ] = "nitrogen-processing"  ,
    ["chlorine"         ] = "electrolysis-2"       ,
    ["hydrogen-chloride"] = "chemical-processing-2",
    ["sulfur-dioxide"   ] = "sulfur-processing"    ,
  } do
    for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
      LSlib.technology.moveRecipeUnlock("gas-canisters", gasTech, string.format(barreling, barrel))
    end
  end
  for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
    LSlib.technology.removeRecipeUnlock("gas-canisters", string.format(barreling, "petroleum-gas"))
  end

  -- cannisters ----------------------------------------------------------------
  for barrel, fuelTech in pairs{
    ["liquid-fuel"             ] = "fuel-canisters",
    ["ferric-chloride-solution"] = "fuel-canisters",
  } do
    for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
      LSlib.technology.moveRecipeUnlock("fluid-handling", fuelTech, string.format(barreling, barrel))
    end
  end
  LSlib.technology.moveRecipeUnlock("oil-processing", "flammables", "liquid-fuel")
  LSlib.technology.removeRecipeUnlock("fluid-handling", "empty-canister")

  -- battery -------------------------------------------------------------------
  if settings.startup["bobmods-plates-batteryupdate"].value == true then
    LSlib.technology.addPrerequisite("battery", "lead-processing")
  end


  --[[
  if mods["angelsrefining"] then
    for _,scienceFluid in pairs({
      "basic-science-fluid-1",
      "basic-science-fluid-2",
      "basic-science-fluid-3",
      "advanced-science-fluid-1",
      "advanced-science-fluid-2",
      "extreme-science-fluid",
      "basic-military-science-fluid",
      "basic-automation-science-fluid",
      "basic-power-science-fluid",
      "basic-logistics-science-fluid",
    }) do
      data.raw["recipe"]["empty-"..scienceFluid.."-barrel"].category = "barreling-pump"
      data.raw["recipe"]["fill-"..scienceFluid.."-barrel"].category = "barreling-pump"
    end
  end
  ]]
end
