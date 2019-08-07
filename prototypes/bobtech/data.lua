local scienceTech  = require("prototypes/settings").techIcons
local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Bob technology                                                       -----
--------------------------------------------------------------------------------

if mods["bobtech"] then
  -- fix the science packs -----------------------------------------------------
  -- fix lab input
  local packName  = string.format(scienceNames.pink, "pack" )
  local fluidName = string.format(scienceNames.pink, "fluid")
  local techInputs = data.raw["lab"]["lab"].inputs
  local techIndex = {}
  local spaceIndex = 0
  for i,name in pairs(techInputs) do
    if name == packName then
      table.insert(techIndex, i)
    elseif name == "space-science-pack" then
      spaceIndex = i
    end
  end
  for _,i in pairs(techIndex) do
    if i > spaceIndex then
      techInputs[i] = nil
    end
  end

  -- update advanced lab tech
  LSlib.technology.addIngredient("advanced-research", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.removeRecipeUnlock("advanced-research", "lab-2") -- we have our own lab-2
  LSlib.item.setHidden("item", "lab-2")

  -- fix the logistic science pack
  local function getFluidOrder(scienceName)
    return LSlib.utils.string.split(
             LSlib.utils.string.split(
               data.raw["fluid"][fluidName].order,
             "-")[3],
           "[")[1]
  end

  LSlib.item.setOrderstring("tool", packName,
    "z-MoreScience-"..getFluidOrder(scienceNames.pink).."["..packName.."]")
  LSlib.item.changeIcons("tool", packName, {
    {
      icon = string.format("__MoreScience__/graphics/icons/potion/set-01/potion-%02d.png", 13),
      icon_size = 32,
    },
    {
      icon = "__MoreScience__/graphics/icons/potion/cork.png",
      icon_size = 32,
    },
  })

  LSlib.recipe.removeIngredient(packName, "express-transport-belt")
  LSlib.recipe.removeIngredient(packName, "flying-robot-frame"    )
  LSlib.recipe.removeIngredient(packName, "filter-inserter"       )
  LSlib.recipe.removeIngredient(packName, "steel-chest"           )
  --LSlib.recipe.addIngredient(packName, "empty-bottle", 1     )
  --LSlib.recipe.addIngredient(packName, fluidName, 10, "fluid")
  LSlib.recipe.setCraftingCategory(packName, "ms-advanced-crafting")

  LSlib.technology.changeIcon(packName, scienceTech.icon .. "potion-pink.png", scienceTech.icon_size)

  LSlib.technology.removeIngredient(packName,    string.format(scienceNames.green , "pack"))
  LSlib.technology.addIngredient   (packName, 2, string.format(scienceNames.green , "pack"))
  LSlib.technology.addIngredient   (packName, 2, string.format(scienceNames.gray  , "pack"))
  LSlib.technology.addIngredient   (packName, 3, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient   (packName, 3, string.format(scienceNames.cyan  , "pack"))
  LSlib.technology.removeIngredient(packName,    string.format(scienceNames.blue  , "pack"))
  LSlib.technology.addIngredient   (packName, 4, string.format(scienceNames.blue  , "pack"))
  LSlib.technology.addIngredient   (packName, 5, string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient   (packName, 5, string.format(scienceNames.yellow, "pack"))

  LSlib.technology.addRecipeUnlock(packName, fluidName)
  LSlib.technology.moveRecipeUnlock(packName, packName, packName)

  LSlib.technology.removePrerequisite(packName, "logistics-3")
  LSlib.technology.removePrerequisite(packName, "robotics"   )
  LSlib.technology.addPrerequisite   (packName, "rocket-control-unit"       )
  LSlib.technology.addPrerequisite   (packName, "kovarex-enrichment-process")
  LSlib.technology.addPrerequisite   (packName, "effectivity-module"        )



  -- fix science pack colors ---------------------------------------------------
  if settings.startup["bobmods-tech-colorupdate"].value then
    -- science colors follow tier upgrades, so we should adapt to this too?
    -- OLD COLOR -> NEW COLOR
    -- red       -> yellow
    -- green     -> red
    -- blue      -> blue
    -- purple    -> purple
    -- yellow    -> green
    -- white     -> white
    local old = {}
    for newColor, oldColor in pairs{
      ["red"   ] = "yellow",
      ["green" ] = "red"   ,
      ["yellow"] = "green" ,
    } do
      local data = data.raw.fluid[string.format(scienceNames[oldColor], "fluid")]
      old[newColor] = {}

      for _,dataEntry in pairs{
        "base_color",
        "flow_color",
      } do
        old[newColor][dataEntry] = util.table.deepcopy(data[dataEntry])
      end
    end

    for color, scienceNumber in pairs{
      ["red"   ] = 02, -- yellow
      ["green" ] = 14, -- red
      ["yellow"] = 03, -- green
    } do
      LSlib.item.changeIcons("tool", string.format(scienceNames[color], "pack"), {
        {
          icon = string.format("__MoreScience__/graphics/icons/potion/set-01/potion-%02d.png", scienceNumber),
          icon_size = 32,
        },
        {
          icon = "__MoreScience__/graphics/icons/potion/cork.png",
          icon_size = 32,
        },
      })
      LSlib.item.changeIcons("tool", "infused-"..string.format(scienceNames[color], "pack"), {
        {
          icon = string.format("__MoreScience__/graphics/icons/potion/set-02/potion-%02d.png", scienceNumber),
          icon_size = 32,
        },
        {
          icon = "__MoreScience__/graphics/icons/potion/cork.png",
          icon_size = 32,
        },
      })

      LSlib.item.changeIcon("fluid", string.format(scienceNames[color], "fluid"),
        string.format("__MoreScience__/graphics/icons/fluid/fluid-%02d.png", scienceNumber), 32)

      for _,dataEntry in pairs{
        "base_color",
        "flow_color",
      } do
        data.raw.fluid[string.format(scienceNames[color], "fluid")][dataEntry] = old[color][dataEntry]
      end
    end

  end



  if settings.startup["bobmods-burnerphase"].value == true then

    LSlib.item.setSubgroup("tool", "steam-science-pack", LSlib.recipe.getSubgroup(string.format(scienceNames.red, "pack").."-basic"))
    LSlib.item.setOrderstring("tool", "steam-science-pack", "e[science-pack-0]-a[steam]")

    local bobRedTechName = "automation-science-pack"
    LSlib.technology.removeRecipeUnlock(bobRedTechName, string.format(scienceNames.red, "pack"))
    LSlib.technology.addRecipeUnlock(bobRedTechName, string.format(scienceNames.red, "pack").."-basic")

    if mods["angelsrefining"] then
      LSlib.technology.addPrerequisite("ore-crushing", bobRedTechName)
    end
    if mods["angelspetrochem"] then
      LSlib.technology.addPrerequisite("basic-chemistry", bobRedTechName)
    end
    if mods["angelssmelting"] then
      LSlib.technology.addPrerequisite("angels-metallurgy-1", bobRedTechName)
    end
    if mods["angelsbioprocessing"] then
      LSlib.technology.addPrerequisite("bio-wood-processing", bobRedTechName)
      LSlib.technology.addPrerequisite("gardens", bobRedTechName)
    end

  end


  --[[
  -- remove bobs logistics science pack since there is already a logistics science pack from moreScience that needs to be unlocked earlier then bobs.
  -- for that reason we remove bobs logistics science...
  if data.raw["tool"]["logistic-science-pack"] then
    -- disable the science pack
    MoreScience.lib.item.setHidden("tool", "logistic-science-pack")
    MoreScience.lib.recipe.disable("logistic-science-pack")
    MoreScience.lib.technology.removeRecipeUnlock("logistics-3", "logistic-science-pack")

    -- bobs lab-2 is obsolete now, so we just disable that too
    MoreScience.lib.item.setHidden("item", "lab-2")
    MoreScience.lib.recipe.disable("lab-2")
    MoreScience.lib.technology.removeRecipeUnlock("advanced-research", "lab-2")

    -- remove the science pack from the lab
    for inputIndex, inputName in pairs(data.raw["lab"]["lab"].inputs) do
      if inputName == "logistic-science-pack" then
        table.remove(data.raw["lab"]["lab"].inputs, inputIndex)
        break
      end
    end

  end

  -- let rocket depend on advanced research
  MoreScience.lib.technology.addPrerequisite("rocket", "advanced-research")

  if data.raw["tool"]["science-pack-gold"] then
    -- subgroup
    local alienScienceGroup = util.table.deepcopy(data.raw["item-subgroup"]["science-pack"])
    alienScienceGroup.name = "science-alien-packs"
    alienScienceGroup.order = MoreScience.lib.util.stringSplit(alienScienceGroup.order, "-c-a")[1] .. "-c-c"
    data:extend({alienScienceGroup})

    -- delete gold science pack, change it to an ingredient, required for alien sciences
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "science-pack-1")
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "science-pack-2")
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "military-science-pack")
    MoreScience.lib.recipe.addIngredient("science-pack-gold", "basic-military-science-fluid", 10, "fluid")
    MoreScience.lib.recipe.removeIngredient("science-pack-gold", "science-pack-3")
    MoreScience.lib.recipe.addIngredient("science-pack-gold", "basic-science-fluid-3", 10, "fluid")
    if mods["angelspetrochem"] then
      data.raw["recipe"]["science-pack-gold"].category = "basic-chemistry"
    else
      data.raw["recipe"]["science-pack-gold"].category = "chemistry"
    end
    data.raw["tool"]["science-pack-gold"].icon = "__bobtech__/graphics/icons/alien-technology.png"
    data.raw["tool"]["science-pack-gold"].icon_size = 128
    data.raw["tool"]["science-pack-gold"].localised_name = nil
    data.raw["tool"]["science-pack-gold"].subgroup = alienScienceGroup.name

    if data.raw["technology"]["advanced-research"] then
      MoreScience.lib.technology.removeRecipeUnlock("alien-research", "science-pack-gold")
      MoreScience.lib.technology.addRecipeUnlock("advanced-research", "science-pack-gold")
    end

    for _, packName in pairs({
      "alien-science-pack",
      "alien-science-pack-blue",
      "alien-science-pack-orange",
      "alien-science-pack-purple",
      "alien-science-pack-yellow",
      "alien-science-pack-green",
      "alien-science-pack-red",
    }) do
      MoreScience.lib.recipe.addIngredient(packName, "science-pack-gold", 1, "item")
      data.raw["tool"][packName].subgroup = alienScienceGroup.name
    end

    -- move the lab
    data.raw["item"]["lab-alien"].subgroup = data.raw["item"]["lab-burner"].subgroup
    data.raw["item"]["lab-alien"].order = data.raw["item"]["lab"].order .. "-a[alien]"

    -- remove science pack gold from the lab ingredients
    for inputIndex, input in pairs(data.raw["lab"]["lab-alien"].inputs) do
      if input == "science-pack-gold" then
        table.remove(data.raw["lab"]["lab-alien"].inputs, inputIndex)
        break
      end
    end

  end
  ]]
end
