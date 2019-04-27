local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bobs assembly                                                      -----
--------------------------------------------------------------------------------

if mods["bobassembly"] then

  -- assembling machine
  LSlib.technology.addIngredient("automation-3", 1, string.format(scienceNames.orange, "pack"))


  --[[
  MoreScience.lib.technology.addIngredient("automation-3", 1, "basic-automation-science-pack")
  ]]
end
