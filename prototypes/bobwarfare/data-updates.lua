
--------------------------------------------------------------------------------
----- Bob warfare                                                          -----
--------------------------------------------------------------------------------

if mods["bobwarfare"] then

  for barrel, fuelTech in pairs{
    ["glycerol"            ] = "nitroglycerin-processing",
    ["nitroglycerin"       ] = "nitroglycerin-processing",
    ["sulfuric-nitric-acid"] = data.raw.fluid["nitric-acid"] and "nitroglycerin-processing" or nil,
  } do
    for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
      LSlib.technology.moveRecipeUnlock("fluid-handling", fuelTech, string.format(barreling, barrel))
    end
  end

  if mods["bobenemies"] and mods["bobtech"] and
     settings.startup["bobmods-enemies-enableartifacts"   ].value and
     settings.startup["bobmods-enemies-enablenewartifacts"].value then

    for _,techName in pairs{
      -- bullets
      "bob-ap-bullets",
      "bob-electric-bullets",
      "bob-he-bullets",
      "bob-flame-bullets",
      "bob-acid-bullets",
      "bob-poison-bullets",

      -- shotgun shells
      "bob-shotgun-ap-shells",
      "bob-shotgun-electric-shells",
      "bob-shotgun-explosive-shells",
      "bob-shotgun-flame-shells",
      "bob-shotgun-acid-shells",
      "bob-shotgun-poison-shells",

      -- rockets
      "bob-piercing-rocket",
      "bob-electric-rocket",
      "bob-explosive-rocket",
      "bob-acid-rocket",
      "bob-flame-rocket",
      "bob-poison-rocket",

      -- power armor & equipment
      "bob-power-armor-3",
      --"bob-energy-shield-equipment-4",
      --"bob-battery-equipment-4",
      --"fusion-reactor-equipment-2",
    } do
      LSlib.technology.addPrerequisite(techName, "alien-research")
    end
  end

end
