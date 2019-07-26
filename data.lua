LSlib.utils.log.enable()

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
  require("prototypes." .. modName .. ".data")
end
