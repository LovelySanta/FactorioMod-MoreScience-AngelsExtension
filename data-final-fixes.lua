
--require("bobenemies.data-final-fixes")
--require("bobtech.data-final-fixes")
--require("bobplates.data-final-fixes")
--require("bobinserters.data-final-fixes")
require("boblogistics.data-final-fixes")
--require("bobmining.data-final-fixes")
--require("bobelectronics.data-final-fixes")
require("bobassembly.data-final-fixes")
--require("bobmodules.data-final-fixes")
--require("bobpower.data-final-fixes")
--require("bobrevamp.data-final-fixes")
--require("bobwarfare.data-final-fixes")

--require("CircuitProcessing.data-final-fixes")



require("angelsrefining.data-final-fixes")
--require("angelspetrochem.data-final-fixes")
--require("angelssmelting.data-final-fixes")
--require("angelsbioprocessing.data-final-fixes")

--require("angelsaddons-warehouses.data-final-fixes")
--require("angelsaddons-petrotrain.data-final-fixes")
--require("angelsaddons-smeltingtrain.data-final-fixes")



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
