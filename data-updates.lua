
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
  --"bobmodules",

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
  require("prototypes." .. modName .. ".data-updates")
end
