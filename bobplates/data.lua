require "lib/prototyping"



--------------------------------------------------------------------------------
----- Bob plates                                                           -----
--------------------------------------------------------------------------------

-- add green science requirements
addPrerequisiteTechnology("electrolysis-2", "basic-science-research-1")
addPrerequisiteTechnology("lithium-processing", "basic-science-research-1")

-- add orange science requirements
addPrerequisiteTechnology("polishing", "basic-automation-science-research")
addPrerequisiteTechnology("polishing", "gem-processing-1")
addScienceIngredient("polishing", 1, "basic-automation-science-pack")

addScienceIngredient("water-bore-2", 1, "basic-automation-science-pack")
addScienceIngredient("water-bore-3", 1, "basic-automation-science-pack")
addScienceIngredient("water-bore-4", 1, "basic-automation-science-pack")
addScienceIngredient("mixing-steel-furnace", 1, "basic-automation-science-pack")
