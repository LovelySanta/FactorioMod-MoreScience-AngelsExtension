require "lib/prototyping"
require "util"

if mods["angelsrefining"] then
  -- move all barreling recipes over to fluid-handling-2
  local unlocksNotToMove = {
    ["storage-tank"] = true,
    ["empty-barrel"] = true,
    ["pipe-to-ground"] = true,
  }

  for _,effect in pairs(util.table.deepcopy(data.raw["technology"]["fluid-handling"].effects)) do
    if effect.type == "unlock-recipe" and not unlocksNotToMove[effect.recipe] then
      removeRecipeUnlock("fluid-handling", effect.recipe)
      addRecipeUnlock("fluid-handling-2", effect.recipe)
    end
  end

  -- add stuff angel deleted again
  if mods["angelspetrochem"] then
    
  end
end
