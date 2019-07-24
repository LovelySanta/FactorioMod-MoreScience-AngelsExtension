local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Angels C.A.B                                                         -----
--------------------------------------------------------------------------------
if mods["angelsaddons-cab"] then

  LSlib.technology.addIngredient("angels-cab", 1, string.format(scienceNames.orange, "pack"))

end
