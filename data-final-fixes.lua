
for _,modName in pairs({

  "bobores",
  "bobenemies",
  "bobtech",
  --"bobplates",
  --"bobinserters",
  --"boblogistics",
  --"bobmining",
  --"bobelectronics",
  --"bobassembly",
  --"bobmodules",
  --"bobpower",
  --"bobrevamp",
  --"bobvehicleequipment",
  --"bobwarfare",

  --"CircuitProcessing",



  --"angelsrefining",
  --"angelspetrochem",
  --"angelssmelting",
  --"angelsbioprocessing",
  --"angelsindustries",

  --"angelsaddons-shred",
  --"angelsaddons-warehouses",
  --"angelsaddons-petrotrain",
  --"angelsaddons-smeltingtrain",
  --"angelsaddons-pressuretanks",

  }) do
    require("prototypes." .. modName .. ".data-final-fixes")
  end

-- technology tree cleanup
local containsExtension = false
for _,extension in pairs({
  "ScienceCostTweakerExtension",
  --"SeaBlockExtension",
}) do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  LSlib.utils.log.log("----- Cleaning up the tech tree -----")
  LSlib.technology.removeAllRedundantPrerequisites()
end
log(serpent.block(data.raw.tool["alien-artifact-yellow"]))
