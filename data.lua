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
  --"bobelectronics",
  --"bobassembly",
  --"bobmodules",
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
  require("prototypes." .. modName .. ".data")
end
