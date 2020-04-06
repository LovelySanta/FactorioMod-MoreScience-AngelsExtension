
--------------------------------------------------------------------------------
----- Bob plates                                                           -----
--------------------------------------------------------------------------------

if mods["bobplates"] then

  LSlib.technology.removePrerequisite("electronics", "alloy-processing-1")

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
