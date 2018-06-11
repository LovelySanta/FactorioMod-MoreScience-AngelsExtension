require "util"

if mods["angelsrefining"] then
  -- move all barreling recipes over to fluid-handling-2
  for _,effect in pairs(util.table.deepcopy(data.raw["technology"]["fluid-handling"].effects)) do
    if effect.type == "unlock-recipe" then
      -- analyse recipe name to check for barreling recipes
      local effectNameParts = MoreScience.lib.util.stringSplit(effect.recipe, "-")
      if (#effectNameParts > 2 and effectNameParts[#effectNameParts] =="barrel") and (effectNameParts[1] == "fill" or effectNameParts[1] =="empty") then
        MoreScience.lib.technology.removeRecipeUnlock("fluid-handling", effect.recipe)
        MoreScience.lib.technology.addRecipeUnlock("fluid-handling-2", effect.recipe)
      end
    end
  end

end
