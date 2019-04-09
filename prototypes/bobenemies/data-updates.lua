
--------------------------------------------------------------------------------
----- Bob enemies                                                          -----
--------------------------------------------------------------------------------

if mods["bobenemies"] then

  if mods["bobtech"] and mods["bobplates"] then
    if settings.startup["bobmods-enemies-enableartifacts"   ].value and
       settings.startup["bobmods-enemies-enablenewartifacts"].value then

      for barrel, fuelTech in pairs{
        ["alien-acid"     ] = "alien-purple-research",
        ["alien-explosive"] = "alien-yellow-research",
        ["alien-poison"   ] = "alien-green-research" ,
        ["alien-fire"     ] = "alien-red-research"   ,
      } do
        for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
          LSlib.technology.moveRecipeUnlock("fluid-handling", fuelTech, string.format(barreling, barrel))
        end
      end

    end
  end
end
