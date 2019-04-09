LSlib.utils.log.enable()

for _,modName in pairs({

  "bobores",
  "bobenemies",
  "bobtech",
  "bobplates",
  "bobrevamp",
  "bobinserters",
  "boblogistics",
  --"bobmining",
  --"bobelectronics",
  --"bobassembly",
  --"bobmodules",
  --"bobpower",
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
  require("prototypes." .. modName .. ".data")
end
