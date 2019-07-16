local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bobs equipment                                                       -----
--------------------------------------------------------------------------------

if mods["bobequipment"] then

  -- energy shield equipment
  LSlib.technology.addPrerequisite("bob-energy-shield-equipment-4", "military-4")
  for level = 3, 6 do
    LSlib.technology.addIngredient(string.format("bob-energy-shield-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-energy-shield-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
    LSlib.technology.addIngredient(string.format("bob-energy-shield-equipment-%i", level), 1, string.format(scienceNames.purple, "pack"))
  end

  -- battery equipment
  LSlib.technology.addPrerequisite("bob-battery-equipment-6", "military-4")
  for level = 3, 6 do
    LSlib.technology.addIngredient(string.format("bob-battery-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("bob-battery-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- fusion reactor equipment
  LSlib.technology.addIngredient("fusion-reactor-equipment", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("fusion-reactor-equipment", 1, string.format(scienceNames.cyan, "pack"))
  for level = 2, 4 do
    LSlib.technology.addIngredient(string.format("fusion-reactor-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("fusion-reactor-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- night vision equipment
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("night-vision-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("night-vision-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- solar panel equipment
  for level = 2, 4 do
    LSlib.technology.addIngredient(string.format("solar-panel-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("solar-panel-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- laser equipment
  LSlib.technology.addPrerequisite("personal-laser-defense-equipment-4", "military-4")
  for level = 2, 6 do
    LSlib.technology.addIngredient(string.format("personal-laser-defense-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("personal-laser-defense-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

  -- exoskeleton
  LSlib.technology.addPrerequisite("exoskeleton-equipment-2", string.format(scienceNames.blue, "pack"))
  for level = 2, 3 do
    LSlib.technology.addIngredient(string.format("exoskeleton-equipment-%i", level), 1, string.format(scienceNames.orange, "pack"))
    LSlib.technology.addIngredient(string.format("exoskeleton-equipment-%i", level), 1, string.format(scienceNames.cyan, "pack"))
  end

end
