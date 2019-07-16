require "util"

--------------------------------------------------------------------------------
----- Angels Refining                                                      -----
--------------------------------------------------------------------------------

if mods["angelsrefining"] then
  -- delete purified-water
  data.raw["fluid" ]["purified-water"] = nil
  data.raw["recipe"]["purified-water"] = nil

  data.raw["item"  ]["purified-water-barrel"] = nil
  data.raw["recipe"]["fill-purified-water-barrel"] = nil
  data.raw["recipe"]["empty-purified-water-barrel"] = nil
  LSlib.technology.removeRecipeUnlock("purification-research", "fill-purified-water-barrel")
  LSlib.technology.removeRecipeUnlock("purification-research", "empty-purified-water-barrel")

  -- move all barreling recipes over to fluid-handling-2
  for _,effect in pairs(util.table.deepcopy(data.raw["technology"]["fluid-handling"].effects)) do
    if effect.type == "unlock-recipe" then
      -- analyse recipe name to check for barreling recipes
      local effectNameParts = LSlib.utils.string.split(effect.recipe, "-")
      if (#effectNameParts > 2 and effectNameParts[#effectNameParts] =="barrel") and (effectNameParts[1] == "fill" or effectNameParts[1] =="empty") then
        LSlib.technology.removeRecipeUnlock("fluid-handling", effect.recipe)
        LSlib.technology.addRecipeUnlock("fluid-handling-2", effect.recipe)
      end
    end
  end

end
