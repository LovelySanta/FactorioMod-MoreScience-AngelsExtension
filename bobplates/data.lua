require "lib/prototyping"



--------------------------------------------------------------------------------
----- Bob plates                                                           -----
--------------------------------------------------------------------------------

if mods["bobplates"] then

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
  addScienceIngredient("gem-processing-2", 1, "basic-automation-science-pack")
  addScienceIngredient("battery-2", 1, "basic-automation-science-pack")
  addScienceIngredient("battery-3", 1, "basic-automation-science-pack")

  -- add blue science requirements
  addPrerequisiteTechnology("gem-processing-2", "basic-science-research-2")
  addPrerequisiteTechnology("titanium-processing", "basic-science-research-2")
  addPrerequisiteTechnology("ceramics", "basic-science-research-2")
  addPrerequisiteTechnology("battery-2", "basic-science-research-2")

  -- add purple science requirements
  addPrerequisiteTechnology("tungsten-alloy-processing", "advanced-science-research-1")
  addPrerequisiteTechnology("nitinol-processing", "advanced-science-research-1")
  addPrerequisiteTechnology("battery-3", "advanced-science-research-1")

  -- add yellow science requirements
  addPrerequisiteTechnology("advanced-electronics-3", "advanced-science-research-2")


end
