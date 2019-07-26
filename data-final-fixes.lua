
for _,modName in pairs{

  "bobores",
  "bobenemies",
  "bobtech",
  "bobplates",
  "bobrevamp",
  "bobinserters",
  "bobassembly",
  "boblogistics",
  "bobequipment",
  "bobvehicleequipment",
  "bobpower",
  "bobmining",
  "bobwarfare",
  "bobelectronics",
  "bobmodules",

  "CircuitProcessing",
  "ShinyBobGFX",



  "angelsrefining",
  "angelspetrochem",
  "angelssmelting",
  "angelsbioprocessing",
  "angelsindustries",

  "angelsaddons-shred",
  "angelsaddons-warehouses",
  "angelsaddons-petrotrain",
  "angelsaddons-smeltingtrain",
  "angelsaddons-pressuretanks",
  "angelsaddons-cab",

  } do
    LSlib.utils.log.log(string.format("--- %q ---", modName))
    require("prototypes." .. modName .. ".data-final-fixes")
  end

-- technology tree cleanup
local containsExtension = false
for _,extension in pairs{
  "ScienceCostTweakerExtension",
  --"SeaBlockExtension",
} do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  LSlib.utils.log.log("----- Cleaning up the tech tree -----")
  LSlib.technology.removeAllRedundantPrerequisites()
end
