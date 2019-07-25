
--------------------------------------------------------------------------------
----- Angels Refining                                                      -----
--------------------------------------------------------------------------------

if mods["angelsrefining"] then

  -- barreling subgroups -------------------------------------------------------
  local barrelGroup = "angels-fluid-control"
  local barrelSubgroup = "angels-fluid-barrels"
  data:extend{{
    type = "item-subgroup",
    name = barrelSubgroup,
    group = barrelGroup,
    order = data.raw["item-subgroup"]["angels-fluid-tanks"].order.."storage-a[barrels]",
  }}
  data.raw["item-subgroup"]["angels-fluid-tanks"].order = data.raw["item-subgroup"]["angels-fluid-tanks"].order.."storage-b[tanks]"

  local fluidBarrelSubgroup = "angels-fluid-barreling"
  local fuelBarrelSubgroup  = "angels-fuel-barreling"
  local gasBarrelSubgroup   = "angels-gas-barreling"
  data:extend{{
    type = "item-subgroup",
    name = fluidBarrelSubgroup,
    group = barrelGroup,
    order = "l-a[fluid]-a[barrel]",
  },{
    type = "item-subgroup",
    name = fluidBarrelSubgroup.."-fill",
    group = barrelGroup,
    order = "l-a[fluid]-b[fill-barrel]",
  },{
    type = "item-subgroup",
    name = fluidBarrelSubgroup.."-empty",
    group = barrelGroup,
    order = "l-a[fluid]-c[empty-barrel]",
  },{
    type = "item-subgroup",
    name = fuelBarrelSubgroup,
    group = barrelGroup,
    order = "l-b[fuel]-a[barrel]",
  },{
    type = "item-subgroup",
    name = fuelBarrelSubgroup.."-fill",
    group = barrelGroup,
    order = "l-b[fuel]-b[fill-barrel]",
  },{
    type = "item-subgroup",
    name = fuelBarrelSubgroup.."-empty",
    group = barrelGroup,
    order = "l-b[fuel]-c[empty-barrel]",
  },{
    type = "item-subgroup",
    name = gasBarrelSubgroup,
    group = barrelGroup,
    order = "l-c[gas]-a[barrel]",
  },{
    type = "item-subgroup",
    name = gasBarrelSubgroup.."-fill",
    group = barrelGroup,
    order = "l-c[gas]-b[fill-barrel]",
  },{
    type = "item-subgroup",
    name = gasBarrelSubgroup.."-empty",
    group = barrelGroup,
    order = "l-c[gas]-c[empty-barrel]",
  }}

  -- barrel recipes ------------------------------------------------------------

  local emptyBarrelName = "empty-barrel"
  LSlib.item.setSubgroup("item", emptyBarrelName, barrelSubgroup)
  LSlib.item.setOrderstring("item", emptyBarrelName, "a[barrel]-a")
  LSlib.recipe.setSubgroup(emptyBarrelName, nil)
  LSlib.recipe.setOrderstring(emptyBarrelName, nil)
  if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
    LSlib.recipe.setSubgroup(emptyBarrelName.."-recycling", barrelSubgroup)
    LSlib.recipe.setOrderstring(emptyBarrelName.."-recycling", "a[barrel]-b")
  end

  local emptyBottleName = "gas-canister"
  if data.raw.item[emptyBottleName] then
    LSlib.item.setSubgroup("item", emptyBottleName, barrelSubgroup)
    LSlib.item.setOrderstring("item", emptyBottleName, "b[bottle]-a")
    LSlib.recipe.setSubgroup(emptyBottleName, nil)
    LSlib.recipe.setOrderstring(emptyBarrelName, nil)
    if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
      LSlib.recipe.setSubgroup(emptyBottleName.."-recycling", barrelSubgroup)
      LSlib.recipe.setOrderstring(emptyBottleName.."-recycling", "b[bottle]-b")
    end
  end

  local emptyCanisterName = "empty-canister"
  if data.raw.item[emptyCanisterName] then
    LSlib.item.setSubgroup("item", emptyCanisterName, barrelSubgroup)
    LSlib.item.setOrderstring("item", emptyCanisterName, "c[canister]-a")
    LSlib.recipe.setSubgroup(emptyCanisterName, nil)
    LSlib.recipe.setOrderstring(emptyCanisterName, nil)
    if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
      LSlib.recipe.setSubgroup(emptyCanisterName.."-recycling", barrelSubgroup)
      LSlib.recipe.setOrderstring(emptyCanisterName.."-recycling", "c[canister]-b")
    end
  end
  
  ------------------------------------------------------------------------------

  local barrelItem = "%s-barrel"
  local fillBarrelRecipe  = string.format("fill-%s", barrelItem)
  local emptyBarrelRecipe = string.format("empty-%s", barrelItem)
  local orderStringLength = #string.format("%i", LSlib.utils.table.size(data.raw.fluid))



  local createBarrelingRecipe = function(fluidName, fluidOrder)
    if not data.raw.fluid[fluidName] then return end

    local iconSize = 32
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName)) do
      local layerSize = fluidIconLayer.icon_size * (fluidIconLayer.scale or 1)
      iconSize = layerSize > iconSize and layerSize or iconSize
    end
    local iconScale = 32 / iconSize

    local fluidBaseColor = data.raw.fluid[fluidName].base_color
    local fluidFlowColor = data.raw.fluid[fluidName].flow_color
    fluidOrder = string.format("%0"..orderStringLength.."d", fluidOrder)
    local fluidLocalisedName = LSlib.item.getLocalisedName("fluid", fluidName) or {string.format("fluid-name.%s", fluidName)}

    local barrelIcons = 
    {
      {
        icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
        icon_size = 32
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-side-mask.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 0.75}
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-hoop-top-mask.png",
        icon_size = 32,
        tint = {r = fluidFlowColor.r, g = fluidFlowColor.g, b = fluidFlowColor.b, a = 0.75}
      },
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {0, 5})) do
      table.insert(barrelIcons, fluidIconLayer)
    end
    LSlib.item.changeIcons("item", string.format(barrelItem, fluidName), barrelIcons)
    LSlib.item.setSubgroup("item", string.format(barrelItem, fluidName), fluidBarrelSubgroup)
    LSlib.item.setOrderstring("item", string.format(barrelItem, fluidName), fluidOrder)
    LSlib.item.setLocalisedName("item", string.format(barrelItem, fluidName), {"item-name.filled-barrel", fluidLocalisedName})

    local emptyBarrelIcons =
    {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
        icon_size = 32
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 0.75}
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        icon_size = 32,
        tint = {r = fluidFlowColor.r, g = fluidFlowColor.g, b = fluidFlowColor.b, a = 0.75}
      },
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {7, 8})) do
      table.insert(emptyBarrelIcons, fluidIconLayer)
    end
    LSlib.recipe.changeIcons(string.format(emptyBarrelRecipe, fluidName), emptyBarrelIcons)
    LSlib.recipe.setSubgroup(string.format(emptyBarrelRecipe , fluidName), fluidBarrelSubgroup.."-empty")
    LSlib.recipe.setOrderstring(string.format(emptyBarrelRecipe , fluidName), fluidOrder)
    LSlib.recipe.setLocalisedName(string.format(emptyBarrelRecipe, fluidName), {"recipe-name.empty-filled-barrel", fluidLocalisedName})

    local fillBarrelIcons =
    {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
        icon_size = 32
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 0.75}
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        icon_size = 32,
        tint = {r = fluidFlowColor.r, g = fluidFlowColor.g, b = fluidFlowColor.b, a = 0.75}
      },
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {4, -8})) do
      table.insert(fillBarrelIcons, fluidIconLayer)
    end
    LSlib.recipe.changeIcons(string.format(fillBarrelRecipe , fluidName), fillBarrelIcons)
    LSlib.recipe.setSubgroup(string.format(fillBarrelRecipe , fluidName), fluidBarrelSubgroup.."-fill")
    LSlib.recipe.setOrderstring(string.format(fillBarrelRecipe , fluidName), fluidOrder)
    LSlib.recipe.setLocalisedName(string.format(fillBarrelRecipe, fluidName), {"recipe-name.fill-barrel", fluidLocalisedName})
  end



  local createBottlingRecipe = function(fluidName, fluidOrder)
    if not data.raw.fluid[fluidName] then return end
    if not data.raw.item[emptyBottleName] then
      return createBarrelingRecipe(fluidName)
    end

    local iconSize = 32
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName)) do
      local layerSize = fluidIconLayer.icon_size * (fluidIconLayer.scale or 1)
      iconSize = layerSize > iconSize and layerSize or iconSize
    end
    local iconScale = 32 / iconSize

    local fluidBaseColor = data.raw.fluid[fluidName].base_color
    local fluidFlowColor = data.raw.fluid[fluidName].flow_color
    fluidOrder = string.format("%0"..orderStringLength.."d", fluidOrder)
    local fluidLocalisedName = LSlib.item.getLocalisedName("fluid", fluidName) or {string.format("fluid-name.%s", fluidName)}

    local barrelIcons = 
    {
      {
        icon = "__boblibrary__/graphics/icons/cylinder/gas-canister.png",
        icon_size = 32
      },
      {
        icon = "__boblibrary__/graphics/icons/cylinder/cylinder-top.png",
        icon_size = 32,
        tint = {r = fluidFlowColor.r, g = fluidFlowColor.g, b = fluidFlowColor.b, a = 0.5}
      },
      {
        icon = "__boblibrary__/graphics/icons/cylinder/cylinder-mid.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 0.5}
      }
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {0, 5})) do
      table.insert(barrelIcons, fluidIconLayer)
    end
    LSlib.item.changeIcons("item", string.format(barrelItem, fluidName), barrelIcons)
    LSlib.item.setSubgroup("item", string.format(barrelItem, fluidName), gasBarrelSubgroup)
    LSlib.item.setOrderstring("item", string.format(barrelItem, fluidName), fluidOrder)
    LSlib.item.setLocalisedName("item", string.format(barrelItem, fluidName), {"item-name.filled-gas-canister", fluidLocalisedName})

    local emptyBarrelIcons =
    {
      {
        icon = "__boblibrary__/graphics/icons/cylinder/gas-canister.png",
        icon_size = 32
      },
      {
        icon = "__boblibrary__/graphics/icons/cylinder/cylinder-top.png",
        icon_size = 32,
        tint = {r = fluidFlowColor.r, g = fluidFlowColor.g, b = fluidFlowColor.b, a = 0.5}
      },
      {
        icon = "__boblibrary__/graphics/icons/cylinder/cylinder-mid.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 0.5}
      }
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {7, 8})) do
      table.insert(emptyBarrelIcons, fluidIconLayer)
    end
    LSlib.recipe.changeIcons(string.format(emptyBarrelRecipe, fluidName), emptyBarrelIcons)
    LSlib.recipe.setSubgroup(string.format(emptyBarrelRecipe , fluidName), gasBarrelSubgroup.."-empty")
    LSlib.recipe.setOrderstring(string.format(emptyBarrelRecipe , fluidName), fluidOrder)
    LSlib.recipe.setLocalisedName(string.format(emptyBarrelRecipe, fluidName), {"recipe-name.empty-filled-gas-canister", fluidLocalisedName})
    LSlib.recipe.editResult(string.format(emptyBarrelRecipe, fluidName), emptyBarrelName, emptyBottleName)

    local fillBarrelIcons =
    {
      {
        icon = "__boblibrary__/graphics/icons/cylinder/gas-canister.png",
        icon_size = 32
      },
      {
        icon = "__boblibrary__/graphics/icons/cylinder/cylinder-top.png",
        icon_size = 32,
        tint = {r = fluidFlowColor.r, g = fluidFlowColor.g, b = fluidFlowColor.b, a = 0.5}
      },
      {
        icon = "__boblibrary__/graphics/icons/cylinder/cylinder-mid.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 0.5}
      }
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {4, -8})) do
      table.insert(fillBarrelIcons, fluidIconLayer)
    end
    LSlib.recipe.changeIcons(string.format(fillBarrelRecipe , fluidName), fillBarrelIcons)
    LSlib.recipe.setSubgroup(string.format(fillBarrelRecipe , fluidName), gasBarrelSubgroup.."-fill")
    LSlib.recipe.setOrderstring(string.format(fillBarrelRecipe , fluidName), fluidOrder)
    LSlib.recipe.setLocalisedName(string.format(fillBarrelRecipe, fluidName), {"recipe-name.fill-gas-canister", fluidLocalisedName})
    LSlib.recipe.editIngredient(string.format(fillBarrelRecipe, fluidName), emptyBarrelName, emptyBottleName)
  end


  
  local createCanisterRecipe = function(fluidName, fluidOrder)
    if not data.raw.fluid[fluidName] then return end
    if not data.raw.item[emptyCanisterName] then
      return createBarrelingRecipe(fluidName)
    end

    local iconSize = 32
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName)) do
      local layerSize = fluidIconLayer.icon_size * (fluidIconLayer.scale or 1)
      iconSize = layerSize > iconSize and layerSize or iconSize
    end
    local iconScale = 32 / iconSize
    
    local fluidBaseColor = data.raw.fluid[fluidName].base_color
    local fluidFlowColor = data.raw.fluid[fluidName].flow_color
    fluidOrder = string.format("%0"..orderStringLength.."d", fluidOrder)
    local fluidLocalisedName = LSlib.item.getLocalisedName("fluid", fluidName) or {string.format("fluid-name.%s", fluidName)}

    local barrelIcons = 
    {
      {
        icon = "__bobplates__/graphics/icons/empty-canister.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 1}
      }
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {0, 5})) do
      table.insert(barrelIcons, fluidIconLayer)
    end
    LSlib.item.changeIcons("item", string.format(barrelItem, fluidName), barrelIcons)
    LSlib.item.setSubgroup("item", string.format(barrelItem, fluidName), fuelBarrelSubgroup)
    LSlib.item.setOrderstring("item", string.format(barrelItem, fluidName), fluidOrder)
    LSlib.item.setLocalisedName("item", string.format(barrelItem, fluidName), {"item-name.filled-canister", fluidLocalisedName})

    local emptyBarrelIcons =
    {
      {
        icon = "__bobplates__/graphics/icons/empty-canister.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 1}
      }
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {8, 8})) do
      table.insert(emptyBarrelIcons, fluidIconLayer)
    end
    LSlib.recipe.changeIcons(string.format(emptyBarrelRecipe, fluidName), emptyBarrelIcons)
    LSlib.recipe.setSubgroup(string.format(emptyBarrelRecipe , fluidName), fuelBarrelSubgroup.."-empty")
    LSlib.recipe.setOrderstring(string.format(emptyBarrelRecipe , fluidName), fluidOrder)
    LSlib.recipe.setLocalisedName(string.format(emptyBarrelRecipe, fluidName), {"recipe-name.empty-filled-canister", fluidLocalisedName})
    LSlib.recipe.editResult(string.format(emptyBarrelRecipe, fluidName), emptyBarrelName, emptyCanisterName)

    local fillBarrelIcons =
    {
      {
        icon = "__bobplates__/graphics/icons/empty-canister.png",
        icon_size = 32,
        tint = {r = fluidBaseColor.r, g = fluidBaseColor.g, b = fluidBaseColor.b, a = 1}
      }
    }
    for _,fluidIconLayer in pairs(LSlib.item.getIcons("fluid", fluidName, 0.5 * iconScale, {-4, -8})) do
      table.insert(fillBarrelIcons, fluidIconLayer)
    end
    LSlib.recipe.changeIcons(string.format(fillBarrelRecipe , fluidName), fillBarrelIcons)
    LSlib.recipe.setSubgroup(string.format(fillBarrelRecipe , fluidName), fuelBarrelSubgroup.."-fill")
    LSlib.recipe.setOrderstring(string.format(fillBarrelRecipe , fluidName), fluidOrder)
    LSlib.recipe.setLocalisedName(string.format(fillBarrelRecipe, fluidName), {"recipe-name.fill-canister", fluidLocalisedName})
    LSlib.recipe.editIngredient(string.format(fillBarrelRecipe, fluidName), emptyBarrelName, emptyCanisterName)
  end
  
  ------------------------------------------------------------------------------

  for fluidOrder, fluidName in pairs{
    "water-viscous-mud",
    "water-heavy-mud",
    "water-concentrated-mud",
    "water-light-mud",
    "water-thin-mud",
    "water",
    "pure-water", "water-purified",
    "heavy-water",
    "water-mineralized",
    "water-saline",
    "lithia-water",

    "thermal-water",
    "slag-slurry",
    "mineral-sludge",
    "crystal-slurry",
    "crystal-seedling",
    "crystal-matrix",

    "angels-ore8-sludge",
    "angels-ore8-solution",
    "angels-ore8-anode-sludge",
    "angels-ore8-slime",
    "angels-ore9-sludge",
    "angels-ore9-solution",
    "angels-ore9-anode-sludge",
    "angels-ore9-slime",

    "liquid-chlorauric-acid",
    "liquid-hexachloroplatinic-acid",
    "liquid-trichlorosilane",
    "liquid-titanium-tetrachloride",
    "tungstic-acid", "liquid-tungstic-acid",
    "liquid-hydrofluoric-acid",
    "liquid-hexafluorosilicic-acid",

    "water-red-waste",
    "water-yellow-waste",
    "water-greenyellow-waste",
    "water-green-waste",

    "liquid-hydrochloric-acid",
    "liquid-perchloric-acid",

    "crude-oil",
    "liquid-naphtha",
    "liquid-mineral-oil",
    "liquid-toluene",

    "nitric-acid", "liquid-nitric-acid",
    "liquid-multi-phase-oil",
    "liquid-ngl",
    "liquid-condensates",

    "sulfuric-acid", "liquid-sulfuric-acid",

    "liquid-plastic",
    "liquid-resin",
    "liquid-rubber",

    "liquid-fermentation-raw",
    "liquid-acetic-acid",
    "liquid-acetic-anhydride",
    "liquid-cellulose-acetate-mixture",
    "liquid-cellulose-acetate",
    "liquid-propionic-acid",

    "liquid-white-liquor",
    "liquid-black-liquor",
    "liquid-green-liquor",
    "liquid-pulping-liquor",
    "liquid-brown-liquor",

    "liquid-nutrient-pulp",
    "liquid-raw-vegetable-oil",
    "liquid-vegetable-oil",
    "liquid-plant-milk",
  } do
    createBarrelingRecipe(fluidName, fluidOrder)
  end

  for fluidOrder, fluidName in pairs{
    "liquid-air", "gas-compressed-air",
    "hydrogen", "gas-hydrogen",
    "deuterium",
    "oxygen", "gas-oxygen",
    "hydrogen-peroxide", "gas-hydrogen-peroxide",

    "gas-carbon-monoxide",
    "gas-carbon-dioxide",
    "glycerol", "gas-glycerol",
    "gas-acetone",

    "gas-methane",
    "gas-ethane",
    "gas-butane",
    "gas-propene",
    "gas-methanol",
    "gas-ethanol",
    "gas-ethylene",
    "gas-polyethylene",
    "gas-benzene",
    "gas-ethylbenzene",
    "gas-butadiene",
    "gas-styrene",

    "gas-phenol",
    "gas-bisphenol",
    "gas-bisphenol-a",
    "gas-formaldehyde",
    "gas-phosgene",
    "gas-allylchlorid",
    "gas-epichlorhydrin",

    "gas-chlor-methane",
    "chlorine", "gas-chlorine",
    "hydrogen-chloride", "gas-hydrogen-chloride",

    "nitrogen", "gas-nitrogen",
    "ammonia", "gas-ammonia",
    "gas-nitrogen-monoxide",
    "nitrogen-dioxide", "gas-nitrogen-dioxide",
    "dinitrogen-tetroxide", "gas-dinitrogen-tetroxide",
    "gas-ammonium-chloride",

    "gas-urea",
    "gas-melamine",
    "gas-monochloramine",
    "hydrazine", "gas-hydrazine",

    "gas-methylamine",
    "gas-dimethylamine",
    "gas-dimethylhydrazine",

    "gas-natural-1",
    "gas-raw-1",
    "gas-acid",
    "gas-residual",
    "gas-synthesis",

    "hydrogen-sulfide", "gas-hydrogen-sulfide",
    "sulfur-dioxide", "gas-sulfur-dioxide",

    "gas-silane",
    "gas-tungsten-hexafluoride",

    "gas-puffer-atmosphere",
  } do
    createBottlingRecipe(fluidName, fluidOrder)
  end

  for fluidOrder, fluidName in pairs{
    "alien-acid",
    "alien-poison",
    "alien-explosive",
    "alien-fire",

    "liquid-fuel", "liquid-fuel-oil",
    "nitroglycerin",
    "sulfuric-nitric-acid",

    "ferric-chloride-solution", "liquid-ferric-chloride-solution",
    "liquid-cupric-chloride-solution",
    "liquid-aqueous-sodium-hydroxide",

    "liquid-coolant",
    "lubricant",

    "alien-spores",
    "alien-goo",
  } do
    createCanisterRecipe(fluidName, fluidOrder)
  end

end
