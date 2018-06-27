
--------------------------------------------------------------------------------
----- Bob revamp                                                       -----
--------------------------------------------------------------------------------

if mods["bobrevamp"] then
  -- Make sure the rocket can be made
  if data.raw["rocket-silo"]["rocket-silo"].ingredient_count < 6 then
    data.raw["rocket-silo"]["rocket-silo"].ingredient_count = 6
  end

  -- Remove heat shield ingredient as this is part of the components instead
  MoreScience.lib.recipe.removeIngredient("rocket-part", "heat-shield-tile")

end
