
--------------------------------------------------------------------------------
----- Bobs electronics                                                     -----
--------------------------------------------------------------------------------

if mods["bobelectronics"] then

  if data.raw.technology["chemical-processing-1"] and data.raw.technology["alloy-processing-1"] then
    -- change the icon for metal mixing furnace technology
    local steelMetalMixingTechName = "mixing-steel-furnace"
    for _,iconProperty in pairs{"icon", "icon_size", "icons"} do
      data.raw["technology"][steelMetalMixingTechName][iconProperty] = util.table.deepcopy(data.raw["technology"]["advanced-material-processing"][iconProperty])
    end

    -- create stone metal mixing furnace tech instead of requiring alloy processing 1 to obtain solder for green science
    LSlib.technology.removePrerequisite("electronics", "alloy-processing-1")
    data:extend{{
      type = "technology",
      name = "mixing-stone-furnace",
      localised_description = {"technology-description.alloy-processing"},
      icon = data.raw["technology"][steelMetalMixingTechName].icon,
      icon_size = data.raw["technology"][steelMetalMixingTechName].icon_size,
      icons = util.table.deepcopy(data.raw["technology"][steelMetalMixingTechName].icons),
      prerequisites = {
        "brick-processing"
      },
      effects = {},
      unit = util.table.deepcopy(data.raw["technology"]["chemical-processing-1"].unit),
      order = data.raw["technology"]["chemical-processing-1"].order,
    }}
    LSlib.technology.moveRecipeUnlock("alloy-processing-1", "mixing-stone-furnace", "mixing-furnace")
    LSlib.technology.addPrerequisite("alloy-processing-1", "mixing-stone-furnace")
    LSlib.technology.addPrerequisite("electronics", "mixing-stone-furnace")
  end


end
