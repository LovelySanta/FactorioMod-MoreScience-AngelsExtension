local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then
  -- fluid handling ------------------------------------------------------------
  LSlib.technology.removeIngredient("bob-fluid-handling-4", string.format(scienceNames.pink, "pack"))
  LSlib.technology.removeRecipeUnlock("steel-processing", "steel-pipe-to-ground")

  -- railway -------------------------------------------------------------------
  LSlib.technology.removeIngredient("bob-armoured-railway-2", string.format(scienceNames.pink, "pack"))
  LSlib.technology.addIngredient("bob-armoured-railway-2", 1, string.format(scienceNames.purple, "pack"))

  LSlib.technology.removeIngredient("bob-armoured-fluid-wagon-2", string.format(scienceNames.pink, "pack"))
  LSlib.technology.addIngredient("bob-armoured-fluid-wagon-2", 1, string.format(scienceNames.purple, "pack"))

  -- logistics -----------------------------------------------------------------
  LSlib.technology.removeIngredient("logistics-4", string.format(scienceNames.pink, "pack"))
  LSlib.technology.addIngredient("logistics-4", 1, string.format(scienceNames.purple, "pack"))
  LSlib.technology.movePrerequisite("logistics-4", string.format(scienceNames.pink, "pack"), string.format(scienceNames.purple, "pack"))
  LSlib.technology.removePrerequisite("logistics-4", string.format(scienceNames.pink, "pack"))

  LSlib.technology.removeIngredient("logistics-5", string.format(scienceNames.pink, "pack"))
  LSlib.technology.addIngredient("logistics-5", 1, string.format(scienceNames.purple, "pack"))
  LSlib.technology.addPrerequisite("logistics-5", string.format(scienceNames.yellow, "pack"))

  -- inserters -----------------------------------------------------------------
  local inserteroverhaul = settings.startup["bobmods-logistics-inserteroverhaul"].value
  for _,techName in pairs{
    "inserter-stack-size-bonus-3"                  ,
    "inserter-stack-size-bonus-4"                  ,
    "inserter-capacity-bonus-7"                    ,
    "inserter-capacity-bonus-8"                    ,
    inserteroverhaul and "turbo-inserter"    or nil,
    inserteroverhaul and "ultimate-inserter" or nil,
    inserteroverhaul and "stack-inserter-3"  or nil,
    inserteroverhaul and "stack-inserter-4"  or nil,
  } do
    LSlib.technology.removeIngredient(techName, string.format(scienceNames.pink, "pack"))
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.purple, "pack"))
  end
  LSlib.technology.addIngredient("inserter-capacity-bonus-5", 1, string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient("inserter-capacity-bonus-6", 1, string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient("inserter-capacity-bonus-8", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("inserter-capacity-bonus-8", 1, string.format(scienceNames.cyan, "pack"))
  LSlib.technology.addIngredient("inserter-capacity-bonus-8", 1, string.format(scienceNames.pink, "pack"))

  for _, scienceName in pairs{
    scienceNames.red,
    scienceNames.green,
    scienceNames.orange,
    scienceNames.cyan,
    scienceNames.blue,
    scienceNames.purple,
    scienceNames.yellow,
    scienceNames.pink,
    scienceNames.white,
  } do
    LSlib.technology.removeIngredient("inserter-capacity-bonus-8", string.format(scienceName, "pack"))
    LSlib.technology.addIngredient("inserter-capacity-bonus-8", 1, "infused-"..string.format(scienceName, "pack"))
  end
  LSlib.technology.addPrerequisite("inserter-capacity-bonus-8", "infused-"..string.format(scienceNames.pink, "pack"))

  -- character -----------------------------------------------------------------
  for _,techName in pairs{
    "toolbelt-3"                 ,
    "toolbelt-4"                 ,
    "toolbelt-5"                 ,

    "character-logistic-slots-5" ,
    "character-logistic-slots-6" ,
    "character-logistic-slots-7" ,
    "character-logistic-slots-8" ,
    "character-logistic-slots-9" ,
    --"character-logistic-slots-10",
  } do
    LSlib.technology.removeIngredient(techName, string.format(scienceNames.pink, "pack"))
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.purple, "pack"))
  end
  LSlib.technology.addIngredient("toolbelt-5", 1, string.format(scienceNames.pink, "pack"))
  LSlib.technology.addIngredient("character-logistic-slots-10", 1, string.format(scienceNames.purple, "pack"))

  -- infinite trash slots
  LSlib.technology.addIngredient("bob-infinite-character-logistic-trash-slots-1", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("bob-infinite-character-logistic-trash-slots-1", 1, string.format(scienceNames.cyan  , "pack"))

  -- logistic network ----------------------------------------------------------
  local flyingrobotframes = settings.startup["bobmods-logistics-flyingrobotframes"].value
  for _,techName in pairs{
    "bob-robo-modular-4"                         ,
    "logistic-system-2"                          ,
    "logistic-system-3"                          ,
    "bob-robots-2"                               ,
    "bob-robots-3"                               ,
    "bob-robots-4"                               ,
    flyingrobotframes and "bob-robotics-3" or nil,
    flyingrobotframes and "bob-robotics-4" or nil,
  } do
    LSlib.technology.removeIngredient(techName, string.format(scienceNames.pink, "pack"))
    LSlib.technology.addIngredient(techName, 1, string.format(scienceNames.purple, "pack"))
  end
  LSlib.technology.removePrerequisite("bob-robotics-3", string.format(scienceNames.pink, "pack"))

  -- infinite worker robot storage
  LSlib.technology.addIngredient("bob-infinite-worker-robots-storage-1", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("bob-infinite-worker-robots-storage-1", 1, string.format(scienceNames.cyan  , "pack"))
  LSlib.technology.addIngredient("bob-infinite-worker-robots-storage-1", 1, string.format(scienceNames.purple, "pack"))

  for _, scienceName in pairs{
    scienceNames.red,
    scienceNames.green,
    scienceNames.orange,
    scienceNames.cyan,
    scienceNames.blue,
    scienceNames.purple,
    scienceNames.yellow,
    scienceNames.pink,
    scienceNames.white,
  } do
    LSlib.technology.removeIngredient("bob-infinite-worker-robots-storage-1", string.format(scienceName, "pack"))
    LSlib.technology.addIngredient("bob-infinite-worker-robots-storage-1", 1, "infused-"..string.format(scienceName, "pack"))
  end
  LSlib.technology.addPrerequisite("bob-infinite-worker-robots-storage-1", "infused-"..string.format(scienceNames.pink, "pack"))

--[[
  if mods["angelspetrochem"] then
    if data.raw["item"]["angels-storage-tank-3"] then
      data.raw["item"]["storage-tank"].subgroup = data.raw["item"]["angels-storage-tank-3"].subgroup
    end
  end

  MoreScience.lib.technology.addPrerequisite("logistics-3", "advanced-science-research-1")
  MoreScience.lib.technology.addIngredient("logistics-3", 1, "production-science-pack")

  -- disable underground pipes
  MoreScience.lib.technology.removeRecipeUnlock("steel-processing", "steel-pipe-to-ground")

  -- Fix the inserter overhaul
  if settings.startup["bobmods-logistics-inserteroverhaul"] and settings.startup["bobmods-logistics-inserteroverhaul"].value == true then
    -- unlock fast inserter for green science early game
    MoreScience.lib.technology.removeRecipeUnlock("logistics-2", "long-handed-inserter")
    MoreScience.lib.technology.addRecipeUnlock("automation-2", "long-handed-inserter")
    -- change green science recipe over to fast inserter from express inserter
    MoreScience.lib.recipe.editIngredient("basic-science-fluid-2", "fast-inserter", "long-handed-inserter", 1)

    -- unlock filter inserter quicker
    MoreScience.lib.technology.removeRecipeUnlock("logistics-2", "red-filter-inserter")
    MoreScience.lib.technology.addRecipeUnlock("automation-2", "red-filter-inserter")
  end
]]
end
