LSlib.utils.log.enable()

for _,modName in pairs({

  "bobores",
  "bobenemies",
  "bobtech",
  "bobplates",
  "bobrevamp",
  "bobinserters",
  "boblogistics",
  "bobvehicleequipment",
  "bobpower",
  "bobmining",
  "bobwarfare",
  "bobelectronics",
  "bobassembly",
  "bobmodules",

  "CircuitProcessing",



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
  LSlib.utils.log.log(string.format("--- %q ---", modName))
  require("prototypes." .. modName .. ".data")
end
