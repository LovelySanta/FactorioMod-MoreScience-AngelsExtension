local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Angels industries                                                    -----
--------------------------------------------------------------------------------
if mods["angelsindustries"] then

  -- vehicle equipment
  LSlib.technology.addPrerequisite("angels-vequipment-1", string.format(scienceNames.green, "pack"))
  LSlib.technology.addIngredient("angels-vequipment-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("angels-vequipment-2", string.format(scienceNames.blue, "pack"))

  -- crawler
  LSlib.technology.addIngredient("angels-crawler", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("angels-crawler", "automobilism")
  LSlib.technology.addIngredient("angels-crawler-train", 1, string.format(scienceNames.orange, "pack"))

  -- robots
  LSlib.technology.addIngredient("cargo-robots", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("cargo-robots-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("cargo-robots-2", "advanced-electronics")
  LSlib.technology.addIngredient("cargo-robots-3", 1, string.format(scienceNames.orange, "pack"))

--[[
  -- vehicle equipment
  MoreScience.lib.technology.addPrerequisite("angels-vequipment-1", "basic-science-research-1")
  MoreScience.lib.technology.addIngredient("angels-vequipment-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("angels-vequipment-2", "basic-science-research-2")

  -- crawler
  MoreScience.lib.technology.addIngredient("angels-crawler", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("angels-crawler", "automobilism")
  MoreScience.lib.technology.addIngredient("angels-crawler-train", 1, "basic-automation-science-pack")

  -- robots
  MoreScience.lib.technology.addIngredient("cargo-robots", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("cargo-robots-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("cargo-robots-2", "advanced-electronics")
  MoreScience.lib.technology.addIngredient("cargo-robots-3", 1, "basic-automation-science-pack")
]]
end
