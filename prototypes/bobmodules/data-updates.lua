local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob modules                                                          -----
--------------------------------------------------------------------------------

if mods["bobmodules"] then

  -- update productivity modules
  if settings.startup["bobmods-modules-enablerawproductivitymodules"].value == true then
    for lvl = 1, 8 do
      LSlib.recipe.removeModuleEffect(string.format("raw-productivity-module-%i", lvl), string.format(scienceNames.pink, "pack"))
    end
  end

end
