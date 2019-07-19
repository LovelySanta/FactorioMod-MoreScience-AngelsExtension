
for _,modName in pairs{

  "bobores",
  "bobenemies",
  "bobtech",
  "bobplates",
  "bobrevamp",
  "bobinserters",
  "boblogistics",
  "bobequipment",
  "bobvehicleequipment",
  "bobpower",
  "bobmining",
  "bobwarfare",
  "bobelectronics",
  "bobassembly",
  "bobmodules",

  "CircuitProcessing",
  "ShinyBobGFX",



  "angelsrefining",
  "angelspetrochem",
  "angelssmelting",
  "angelsbioprocessing",
  "angelsindustries",

  --"angelsaddons-shred",
  --"angelsaddons-warehouses",
  --"angelsaddons-petrotrain",
  --"angelsaddons-smeltingtrain",
  --"angelsaddons-pressuretanks",

} do
  LSlib.utils.log.log(string.format("--- %q ---", modName))
  require("prototypes." .. modName .. ".data-updates")
end
