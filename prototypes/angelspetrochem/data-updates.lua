local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
if mods["angelspetrochem"] then
    -- Make sure it also has the correct ingredient_count for it
    local maxIngredientCount = 0
    for _,recipeName in pairs(scienceNames) do
      local count = LSlib.recipe.getIngredientsCount(string.format(recipeName, "fluid"))
      count = count[1] > count[2] and count[1] or count[2]
  
      maxIngredientCount = count > maxIngredientCount and count or maxIngredientCount
    end
  
    for _, buildingName in pairs({
      "angels-chemical-plant",
      "angels-chemical-plant-2",
      "angels-chemical-plant-3",
      "angels-chemical-plant-4",
    }) do
      local count = data.raw["assembling-machine"][buildingName].ingredient_count
      if count and count < maxIngredientCount then
        data.raw["assembling-machine"][buildingName].ingredient_count = maxIngredientCount
      end
    end

--[[
  if mods["bobplates"] then
    -- check if we can disable gas-canisters
    if data.raw["technology"]["gas-canisters"] then
      local hasPrerequisites = false
      for _,technology in pairs(data.raw["technology"]) do
        if technology.prerequisites then
          for _,prerequisite in pairs(technology.prerequisites) do
            if prerequisite == "gas-canisters" then
              hasPrerequisites = true
              break
            end
          end
        end
      end

      if not hasPrerequisites then
        data.raw["technology"]["gas-canisters"].enabled = false
      end
    end
  end
]]
end
