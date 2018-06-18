

if mods["CircuitProcessing"] then
  -- advanced electronics 2 ----------------------------------------------------
  ------------------------------------------------------------------------------
  if mods["angelssmelting"] then
    MoreScience.lib.technology.addPrerequisite("advanced-electronics-2", "angels-titanium-smelting-1")
    MoreScience.lib.technology.addPrerequisite("advanced-electronics-3", "angels-chrome-smelting-1")
  end
  MoreScience.lib.technology.addPrerequisite("rocket", "advanced-electronics-3")



  -- modules lvl 1 -------------------------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addPrerequisite("productivity-module-2", "advanced-electronics-2")
  MoreScience.lib.technology.addPrerequisite("speed-module-2", "advanced-electronics-2")
  MoreScience.lib.technology.addPrerequisite("effectivity-module-2", "advanced-electronics-2")



  -- modules lvl 2 -------------------------------------------------------------
  ------------------------------------------------------------------------------
  MoreScience.lib.technology.addPrerequisite("productivity-module-3", "advanced-electronics-3")
  MoreScience.lib.technology.addPrerequisite("speed-module-3", "advanced-electronics-3")
  MoreScience.lib.technology.addPrerequisite("effectivity-module-3", "advanced-electronics-3")
  if mods["bobplates"] then
    MoreScience.lib.technology.addPrerequisite("productivity-module-3", "gem-processing-2")
    MoreScience.lib.technology.addPrerequisite("speed-module-3", "gem-processing-2")
    MoreScience.lib.technology.addPrerequisite("effectivity-module-3", "gem-processing-2")
  end

end
