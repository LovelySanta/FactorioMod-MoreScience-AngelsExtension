require "util"


--------------------------------------------------------------------------------
----- Angels bio processing                                                -----
--------------------------------------------------------------------------------

if mods["angelsbioprocessing"] then

  -- disable wood production as this is part of angel now
  MoreScience.lib.item.setHidden("item", "organic-tree")
  MoreScience.lib.technology.disable("wood-plantation")

  -- fuel category for the organic trees
  local fuelCategory =
  {
    type = "fuel-category",
    name = "organic",
  }

  -- use the handsaw to cut trees to raw wood, different trees give different amount of wood
  for _,recipeName in pairs({
    "tree-arboretum-1",
    "tree-arboretum-2",
    "tree-arboretum-3",
  }) do
    if data.raw["recipe"][recipeName] then
      local recipeIndex = MoreScience.lib.util.stringSplit(recipeName, "-")[3]

      -- create the tree
      local treeItem =
      {
        type = "item",
        name = "organic-tree-" .. recipeIndex,
        localised_name = {"", {"item-name.organic-tree"}, " MK", recipeIndex},
        flags = data.raw["item"]["raw-wood"].flags,
        icons =
        {
          {
            icon = data.raw["tree"]["tree-09"].icon,
            icon_size = data.raw["tree"]["tree-09"].icon_size,
          },
          {
            icon = "__angelspetrochem__/graphics/icons/num_" .. recipeIndex .. ".png",
            icon_size = 32,
            tint = {r = 0.2, g = 1, b = 0.2, a = 0.5},
            scale = 0.32,
            shift = {-12, -12},
          },
        },
        place_result = nil,
        stack_size = 1,
        fuel_value = (1 + recipeIndex * 3) * 10 .. "MJ",
        fuel_category = fuelCategory.name,
        order = "d" .. recipeIndex,
        subgroup = data.raw["recipe"][recipeName].subgroup,
      }

      -- create recipe to convert tree into wood
      local treeRecipe =
      {
        type = "recipe",
        name = "organic-wood" .. recipeIndex,
        localised_name = {"item-name.raw-wood"},
        icons =
        {
          {
            icon = data.raw["item"]["raw-wood"].icon,
            icon_size = data.raw["item"]["raw-wood"].icon_size,
          },
          {
            icon = "__angelspetrochem__/graphics/icons/num_" .. recipeIndex .. ".png",
            icon_size = 32,
            tint = {r = 0.2, g = 1, b = 0.2, a = 0.5},
            scale = 0.32,
            shift = {-12, -12},
          },
        },
        energy_required = data.raw["recipe"][recipeName].energy_required * 2,
        enabled = false,
        category = "advanced-crafting",
        ingredients = {
          {treeItem.name, 1},
          {"hand-saw", 1},
        },
        results = util.table.deepcopy(data.raw["recipe"][recipeName].results),
        subgroup = treeItem.subgroup,
      }

      -- unlock recipe at the tech
      MoreScience.lib.technology.addRecipeUnlock("bio-aboretum-" .. recipeIndex, treeRecipe.name)

      -- now adapt angels recipe
      data.raw["recipe"][recipeName].icon = treeItem.icon
      data.raw["recipe"][recipeName].icon_size = treeItem.icon_size
      data.raw["recipe"][recipeName].icons = util.table.deepcopy(treeItem.icons)
      data.raw["recipe"][recipeName].results = {{type = "item", name = treeItem.name, amount = 1,}}
      data.raw["recipe"][recipeName].order = "e" .. recipeIndex

      -- and finaly add the new recipes
      data:extend({
        treeItem,
        treeRecipe,
        fuelCategory,
      })
    end
  end

  -- add the handsaw recipe
  MoreScience.lib.technology.addRecipeUnlock("bio-aboretum-1", "hand-saw")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-1", "steel-processing")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-1", "bio-farm")

  if data.raw["tool"]["token-bio"] then
    -- create the lab for the bio token
    local bioLabItem = util.table.deepcopy(data.raw["item"]["lab-burner"])
    local bioLabRecipe = util.table.deepcopy(data.raw["recipe"]["lab-burner"])
    local bioLabEntity = util.table.deepcopy(data.raw["lab"]["lab-burner"])

    if mods["bobtech"] then
      bioLabItem = util.table.deepcopy(data.raw["item"]["lab-2"])
      bioLabEntity = util.table.deepcopy(data.raw["lab"]["lab-2"])

      bioLabItem.subgroup = data.raw["item"]["lab-burner"].subgroup
      bioLabItem.order = data.raw["item"]["lab-burner"].order .. "-b[bio]"
      bioLabEntity.energy_source = util.table.deepcopy(data.raw["lab"]["lab-burner"].energy_source)
      bioLabEntity.energy_usage = data.raw["lab"]["lab-burner"].energy_usage
    end

    bioLabItem.name = "lab-bio"
    bioLabEntity.name = bioLabItem.name
    bioLabRecipe.name = bioLabItem.name

    bioLabItem.localised_name = {"item-name.lab-bio", {[1] = "item-name.lab"}}
    bioLabEntity.localised_name = util.table.deepcopy(bioLabItem.localised_name)

    bioLabEntity.minable.result = bioLabItem.name
    bioLabItem.place_result = bioLabEntity.name
    bioLabRecipe.result = bioLabItem.name

    bioLabRecipe.enabled = false
    bioLabRecipe.energy_required = bioLabRecipe.energy_required * 10
    bioLabEntity.energy_source.fuel_category = fuelCategory.name

    bioLabRecipe.ingredients =
    {
      {"lab-burner", 1},
      {"token-bio", 5},
      {"organic-tree-1", 1},
    }
    bioLabEntity.inputs =
    {
      "token-bio",
      "science-pack-1",
      "science-pack-2",
    }

    data:extend({
      bioLabItem,
      bioLabRecipe,
      bioLabEntity,
    })

    -- add researches requiring the bio token
    MoreScience.lib.technology.addRecipeUnlock("bio-aboretum-1", bioLabRecipe.name)
    MoreScience.lib.technology.addPrerequisite("bio-desert-farming", "bio-aboretum-1")
    MoreScience.lib.technology.addPrerequisite("bio-temperate-farming", "bio-aboretum-1")
    MoreScience.lib.technology.addPrerequisite("bio-swamp-farming", "bio-aboretum-1")


  end

  -- bottling requires wood production now
  MoreScience.lib.technology.addPrerequisite("bottling-research", "bio-aboretum-1")

  -- add green science requirements
  MoreScience.lib.technology.addPrerequisite("bio-desert-farm", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-temperate-farm", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-swamp-farm", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-fermentation", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-nutrient-paste", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-pressing", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-2", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-processing-blue", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-paper-2", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("bio-wood-processing-3", "basic-science-research-1")

  -- add orange science requirements
  MoreScience.lib.technology.addIngredient("bio-aboretum-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-temperate-1", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("bio-aboretum-temperate-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bio-aboretum-temperate-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bio-aboretum-temperate-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-swamp-1", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("bio-aboretum-swamp-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bio-aboretum-swamp-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bio-aboretum-swamp-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-desert-1", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("bio-aboretum-desert-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bio-aboretum-desert-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("bio-aboretum-desert-3", 1, "basic-automation-science-pack")

  -- add blue science requirements
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-3", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("bio-processing-red", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("bio-plastic-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("bio-paper-3", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-temperate-2", "bio-aboretum-3")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-swamp-2", "bio-aboretum-3")
  MoreScience.lib.technology.addPrerequisite("bio-aboretum-desert-2", "bio-aboretum-3")



end
