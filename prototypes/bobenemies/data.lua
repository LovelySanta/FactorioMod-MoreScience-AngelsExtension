local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob enemies                                                          -----
--------------------------------------------------------------------------------

if mods["bobenemies"] then

  if mods["bobtech"] then
    -- update icons
    if settings.startup["bobmods-enemies-enableartifacts"   ].value and
       settings.startup["bobmods-enemies-enablenewartifacts"].value then

      local bottle = "empty-bottle"
      local bottleOrder = LSlib.item.getOrderstring("item", bottle)
      LSlib.item.setOrderstring("item", bottleOrder.."-a[regular]")

      local potionLocation = "__MoreScience__/graphics/icons/potion/set-04/potion-%02d.png"
      LSlib.item.changeIcon("tool", "alien-science-pack"       , string.format(potionLocation, 13), 32)
      LSlib.item.changeIcon("tool", "alien-science-pack-red"   , string.format(potionLocation, 14), 32)
      LSlib.item.changeIcon("tool", "alien-science-pack-orange", string.format(potionLocation, 15), 32)
      LSlib.item.changeIcon("tool", "alien-science-pack-yellow", string.format(potionLocation, 02), 32)
      LSlib.item.changeIcon("tool", "alien-science-pack-green" , string.format(potionLocation, 03), 32)
      LSlib.item.changeIcon("tool", "alien-science-pack-blue"  , string.format(potionLocation, 07), 32)
      LSlib.item.changeIcon("tool", "alien-science-pack-purple", string.format(potionLocation, 10), 32)
      LSlib.item.changeIcon("tool", "science-pack-gold"        , string.format(potionLocation, 09), 32)

      data:extend{
        {
          type = "item",
          name = "alien-"..bottle,
          icon = string.format(potionLocation, 00),
          icon_size = 32,
          stack_size = 50,
          subgroup = "ms-science-bottling",
          order = bottleOrder.."-b[alien]",
        },
        {
          type = "recipe",
          name = "alien-"..bottle,
          energy_required = 12,
          enabled = false,
          ingredients = {
            {"empty-bottle", 100},
            {"alien-artifact", 1},
            {name = string.format(scienceNames.gray, "fluid"), amount = 10, type = "fluid"},
          },
          result = "alien-"..bottle,
          result_count = 100,
          category = "ms-chemical-crafting",
        }
      }
      LSlib.technology.addRecipeUnlock("alien-research", "alien-"..bottle)
      LSlib.technology.addIngredient("alien-research", 1, string.format(scienceNames.gray, "pack"))

      local alienScienceGroup = "ms-science-alien-science-pack"
      data:extend{{
        type = "item-subgroup",
        name = alienScienceGroup,
        group = data.raw["item-subgroup"]["science-pack"].group,
        order = "g-c[science-pack]-c"
      }}
      local alienSciencePack = "alien-science-pack%s"
      for _,sciencePack in pairs{
        string.format(alienSciencePack, ""       ),
        string.format(alienSciencePack, "-red"   ),
        string.format(alienSciencePack, "-orange"),
        string.format(alienSciencePack, "-yellow"),
        string.format(alienSciencePack, "-green" ),
        string.format(alienSciencePack, "-blue"  ),
        string.format(alienSciencePack, "-purple"),
        "science-pack-gold"                       ,
      } do
        LSlib.item.setSubgroup("tool", sciencePack, alienScienceGroup)
        LSlib.item.setOrderstring("tool", sciencePack, string.format("%s-%s",
          LSlib.item.getOrderstring("tool", string.format(scienceNames.blue, "pack")),
          LSlib.item.getOrderstring("tool", sciencePack)))
        LSlib.recipe.addIngredient(sciencePack, "alien-"..bottle, 10)
      end
      LSlib.recipe.editIngredient("science-pack-gold", "alien-"..bottle, "alien-"..bottle, .1)

      LSlib.technology.addIngredient("alien-research", 1, string.format(scienceNames.orange, "pack"))

      -- move the unlocks around for astetics
      LSlib.technology.moveRecipeUnlock("alien-research", "alien-research", "science-pack-gold")
      LSlib.technology.moveRecipeUnlock("alien-research", "alien-research", "lab-alien")
      for _,color in pairs{
        ""       ,
        "-red"   ,
        "-orange",
        "-yellow",
        "-green" ,
        "-blue"  ,
        "-purple",
      } do
        LSlib.technology.moveRecipeUnlock("alien-research", "alien-research", string.format("alien-science-pack%s", color))
      end
    end
  end

end
