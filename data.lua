
for _,modName in pairs({

  --"bobenemies",
  "bobtech",
  "bobplates",
  "bobinserters",
  "boblogistics",
  "bobmining",
  "bobelectronics",
  "bobassembly",
  "bobmodules",
  "bobpower",
  "bobrevamp",
  "bobvehicleequipment",
  "bobwarfare",

  "CircuitProcessing",



  "angelsrefining",
  "angelspetrochem",
  "angelssmelting",
  "angelsbioprocessing",
  "angelsindustries",

  "angelsaddons-warehouses",
  "angelsaddons-petrotrain",
  "angelsaddons-smeltingtrain",
  "angelsaddons-pressuretanks",

}) do
  require(modName .. ".data")
end
