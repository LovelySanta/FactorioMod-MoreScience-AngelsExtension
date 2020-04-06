local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob revamp                                                       -----
--------------------------------------------------------------------------------

if mods["bobrevamp"] then

  -- chemical plant has its own research, let's require it for the green science
  LSlib.technology.removePrerequisite("chemical-plant", "oil-processing")
  --LSlib.technology.addPrerequisite("chemical-plant", "electronics")
  --LSlib.technology.addPrerequisite("chemical-plant", "steel-processing")

  LSlib.technology.removePrerequisite("chemical-plant", "logistic-science-pack")
  --LSlib.technology.addPrerequisite("purification-research", "chemical-plant")
  LSlib.technology.removePrerequisite("purification-research", "electronics")
  LSlib.technology.removeRecipeUnlock("purification-research", "chemical-plant")

  LSlib.technology.removeIngredient("chemical-plant", string.format(scienceNames.green, "pack"))

  -- oil research
  LSlib.technology.addPrerequisite("pumpjack", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("pumpjack", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("oil-processing", "pumpjack")
  LSlib.technology.movePrerequisite("lubricant", "chemical-plant", "oil-processing")
  LSlib.technology.removePrerequisite("plastics", "chemical-plant")

  -- Remove heat shield ingredient as this is part of the components instead
  LSlib.recipe.removeIngredient("rocket-part", "heat-shield-tile")

  -- update rocket control units to contain speed modules anyway
  if data.raw.item["basic-electronic-components"] and
     data.raw.item["electronic-components"      ] and
     data.raw.item["intergrated-electronics"    ] and
     data.raw.item["processing-electronics"     ]
  then
    LSlib.recipe.addIngredient("rocket-control-unit", "speed-module")
  end

  if data.raw.fluid.hydrogen and data.raw.fluid.oxygen and data.raw.fluid.nitrogen then
    LSlib.technology.addPrerequisite("hydrazine", "solid-fuel")
    for barrel, fuelTech in pairs{
      ["dinitrogen-tetroxide"    ] = "rocket-fuel",
      ["hydrazine"               ] = "hydrazine",
      ["hydrogen-peroxide"       ] = "hydrazine",
    } do
      for _,barreling in pairs{"fill-%s-barrel", "empty-%s-barrel"} do
        LSlib.technology.moveRecipeUnlock("fluid-handling", fuelTech, string.format(barreling, barrel))
      end
    end
  end

end
