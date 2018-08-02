
for _,modName in pairs({

  --"bobenemies",
  "bobtech",
  --"bobplates",
  --"bobinserters",
  "boblogistics",
  --"bobmining",
  --"bobelectronics",
  "bobassembly",
  --"bobmodules",
  --"bobpower",
  "bobrevamp",
  --"bobwarfare",

  --"CircuitProcessing",



  "angelsrefining",
  "angelspetrochem",
  "angelssmelting",
  "angelsbioprocessing",

  --"angelsaddons-warehouses",
  --"angelsaddons-petrotrain",
  --"angelsaddons-smeltingtrain",
  --"angelsaddons-pressuretanks",

}) do
  require(modName .. ".data-updates")
end
