
for _,modName in pairs({

  --"bobenemies",
  --"bobtech",
  --"bobplates",
  --"bobinserters",
  "boblogistics",
  --"bobmining",
  --"bobelectronics",
  "bobassembly",
  --"bobmodules",
  --"bobpower",
  --"bobrevamp",
  --"bobwarfare",

  --"CircuitProcessing",



  "angelsrefining",
  --"angelspetrochem",
  --"angelssmelting",
  --"angelsbioprocessing",

  --"angelsaddons-warehouses",
  --"angelsaddons-petrotrain",
  --"angelsaddons-smeltingtrain",
  --"angelsaddons-pressuretanks",

  }) do
    require(modName .. ".data-final-fixes")
  end



-- technology tree cleanup
local containsExtension = false
for _,extension in pairs({
  "ScienceCostTweakerExtension",
  "SeaBlockExtension",
}) do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  log("cleaning up the tech tree")
  MoreScience.lib.technology.removeAllRedundantPrerequisites()
end
