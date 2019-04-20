local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob power                                                            -----
--------------------------------------------------------------------------------

if mods["bobpower"] then

  if mods["boblogistics"] then
    for _,techName in pairs{
      "electric-pole-4"      ,
      "electric-substation-4",
    } do
      LSlib.technology.removeIngredient(techName, string.format(scienceNames.pink, "pack"))
      LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.purple, "pack"))
    end
  end
end
