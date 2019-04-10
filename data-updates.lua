
for _,modName in pairs({

  "bobores",
  "bobenemies",
  "bobtech",
  "bobplates",
  "bobrevamp",
  "bobinserters",
  "boblogistics",
  "bobvehicleequipment",
  --"bobmining",
  --"bobelectronics",
  --"bobassembly",
  --"bobmodules",
  --"bobpower",
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
  require("prototypes." .. modName .. ".data-updates")
end
