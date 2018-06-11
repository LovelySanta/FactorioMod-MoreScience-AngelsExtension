
--------------------------------------------------------------------------------
----- Bob plates                                                           -----
--------------------------------------------------------------------------------

if mods["bobplates"] then

  -- add green science requirements
  MoreScience.lib.technology.addPrerequisite("electrolysis-2", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("lithium-processing", "basic-science-research-1")

  -- add orange science requirements
  MoreScience.lib.technology.addPrerequisite("polishing", "basic-automation-science-research")
  MoreScience.lib.technology.addPrerequisite("polishing", "gem-processing-1")
  MoreScience.lib.technology.addIngredient("polishing", 1, "basic-automation-science-pack")

  MoreScience.lib.technology.addIngredient("water-bore-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("water-bore-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("water-bore-4", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("mixing-steel-furnace", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("gem-processing-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("battery-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("battery-3", 1, "basic-automation-science-pack")
  --MoreScience.lib.technology.addIngredient("titanium-processing", 1, "basic-automation-science-pack")

  -- add blue science requirements
  MoreScience.lib.technology.addPrerequisite("gem-processing-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("titanium-processing", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("ceramics", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("battery-2", "basic-science-research-2")

  -- add purple science requirements
  MoreScience.lib.technology.addPrerequisite("tungsten-alloy-processing", "advanced-science-research-1")
  MoreScience.lib.technology.addPrerequisite("nitinol-processing", "advanced-science-research-1")
  MoreScience.lib.technology.addPrerequisite("battery-3", "advanced-science-research-1")

  -- add yellow science requirements
  MoreScience.lib.technology.addPrerequisite("advanced-electronics-3", "advanced-science-research-2")


end
