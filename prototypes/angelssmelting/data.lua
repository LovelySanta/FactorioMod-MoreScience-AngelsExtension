local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Angels Smelting                                                      -----
--------------------------------------------------------------------------------

if mods["angelssmelting"] then
  -- move glass item over to angels glass
  data.raw["recipe"]["glass"].result = "angels-plate-glass"
  LSlib.recipe.removeIngredient("empty-bottle", "glass")
  LSlib.recipe.addIngredient("empty-bottle", "angels-plate-glass", 3)

  if data.raw["recipe"]["glass-mixture-1"] then
    data.raw["recipe"]["glass"].order = data.raw["recipe"]["glass-mixture-1"].order .. "1"
    data.raw["recipe"]["glass-mixture-1"].order = data.raw["recipe"]["glass-mixture-1"].order .. "2"
    data.raw["recipe"]["glass"].subgroup = data.raw["recipe"]["glass-mixture-1"].subgroup
  end

  -- add green science requirements to smelting
  LSlib.technology.addPrerequisite("water-washing-2", string.format(scienceNames.green, "pack"))
  LSlib.technology.addPrerequisite("angels-metallurgy-2", string.format(scienceNames.green, "pack"))
  LSlib.technology.movePrerequisite("powder-metallurgy-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- add orange science requirements to smelting
  LSlib.technology.movePrerequisite("ore-processing-1", "angels-metallurgy-1", "angels-metallurgy-2")
  LSlib.technology.addPrerequisite("ore-processing-1", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-processing-1", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-processing-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-processing-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-processing-4", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("ore-processing-5", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.movePrerequisite("strand-casting-1", "angels-metallurgy-1", "angels-metallurgy-2")
  LSlib.technology.addPrerequisite("strand-casting-1", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("strand-casting-1", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("strand-casting-2", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("strand-casting-3", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("strand-casting-4", 1, string.format(scienceNames.orange, "pack"))

  LSlib.technology.addIngredient("powder-metallurgy-2", 1,  string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("powder-metallurgy-3", 1,  string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("powder-metallurgy-4", 1,  string.format(scienceNames.orange, "pack"))

  -- add blue science requirements to smelting
  LSlib.technology.addPrerequisite("angels-metallurgy-3", string.format(scienceNames.blue, "pack"))
  LSlib.technology.addPrerequisite("ore-processing-2", "angels-metallurgy-3")
  LSlib.technology.addPrerequisite("strand-casting-2", "angels-metallurgy-3")
  LSlib.technology.addPrerequisite("powder-metallurgy-2", "angels-metallurgy-3")
  LSlib.technology.addPrerequisite("angels-coolant-2", "angels-metallurgy-3")

  -- add purple science requirements to smelting
  LSlib.technology.addPrerequisite("ore-processing-3", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addPrerequisite("strand-casting-3", string.format(scienceNames.purple, "pack"))
  LSlib.technology.addPrerequisite("powder-metallurgy-3", string.format(scienceNames.purple, "pack"))

  -- add yellow science requirements to smelting
  LSlib.technology.addPrerequisite("angels-metallurgy-4", string.format(scienceNames.yellow, "pack"))
  LSlib.technology.addPrerequisite("ore-processing-4", "angels-metallurgy-4")
  LSlib.technology.addPrerequisite("strand-casting-4", "angels-metallurgy-4")
  LSlib.technology.addPrerequisite("powder-metallurgy-4", "angels-metallurgy-4")



  -- smelting processing

  --ALUMINIUM
  -- smelting 1:

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-aluminium-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.movePrerequisite("angels-aluminium-smelting-2", "strand-casting-1", "strand-casting-2")
  LSlib.technology.addIngredient("angels-aluminium-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-aluminium-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-aluminium-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --CHROME
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-chrome-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-chrome-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.addIngredient("angels-chrome-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-chrome-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-chrome-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --COBALT
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-cobalt-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-cobalt-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.addIngredient("angels-cobalt-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-cobalt-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-cobalt-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --COPPER
  -- smelting 1:

  -- smelting 2:
  LSlib.technology.addIngredient("angels-copper-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.addIngredient("angels-copper-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --GLASS
  -- smelting 1:

  -- smelting 2:
  LSlib.technology.addPrerequisite("angels-glass-smelting-2", string.format(scienceNames.orange, "pack"))
  LSlib.technology.addIngredient("angels-glass-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-glass-smelting-3", "strand-casting-1", "strand-casting-2")
  LSlib.technology.addIngredient("angels-glass-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --GOLD
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-gold-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-gold-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.movePrerequisite("angels-gold-smelting-2", "strand-casting-1", "strand-casting-2")
  LSlib.technology.addIngredient("angels-gold-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-gold-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-gold-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --IRON
  -- smelting 1:

  -- smelting 2:
  LSlib.technology.addIngredient("angels-iron-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.addIngredient("angels-iron-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --LEAD
  -- smelting 1:

  -- smelting 2:
  LSlib.technology.addIngredient("angels-lead-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.addIngredient("angels-lead-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --MANGANESE
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-manganese-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-manganese-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.addIngredient("angels-manganese-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-manganese-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-manganese-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --NICKEL
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-nickel-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-nickel-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.addIngredient("angels-nickel-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-nickel-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-nickel-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --PLATINUM
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-platinum-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-platinum-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.movePrerequisite("angels-platinum-smelting-2", "strand-casting-1", "strand-casting-2")
  LSlib.technology.addIngredient("angels-platinum-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-platinum-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-platinum-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --SILICON
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-silicon-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-silicon-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.addIngredient("angels-silicon-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-silicon-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-silicon-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --SILVER
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-silver-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-silver-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.movePrerequisite("angels-silver-smelting-2", "strand-casting-1", "strand-casting-2")
  LSlib.technology.addIngredient("angels-silver-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-silver-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-silver-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --STONE
  -- smelting 1:
  LSlib.technology.removePrerequisite("angels-stone-smelting-1", "water-washing-1")
  LSlib.technology.addPrerequisite("angels-stone-smelting-1", "water-washing-2")

  -- smelting 2:
  LSlib.technology.addPrerequisite("angels-stone-smelting-2", "concrete")

  -- smelting 3:
  LSlib.technology.addPrerequisite("angels-stone-smelting-3", "powder-metallurgy-2")



  --TIN
  -- smelting 1:

  -- smelting 2:
  LSlib.technology.addIngredient("angels-tin-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.addIngredient("angels-tin-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --TITANIUM
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-titanium-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-titanium-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.movePrerequisite("angels-titanium-smelting-2", "strand-casting-1", "strand-casting-2")
  LSlib.technology.addIngredient("angels-titanium-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-titanium-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-titanium-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --TUNGSTEN
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-tungsten-smelting-1", "powder-metallurgy-1", "powder-metallurgy-2")
  LSlib.technology.addIngredient("angels-tungsten-smelting-1", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-tungsten-smelting-2", "ore-processing-1", "ore-processing-4")
  LSlib.technology.addIngredient("angels-tungsten-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-tungsten-smelting-3", "ore-processing-2", "ore-processing-5")
  LSlib.technology.addIngredient("angels-tungsten-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --ZINC
  -- smelting 1:
  LSlib.technology.movePrerequisite("angels-zinc-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.movePrerequisite("angels-zinc-smelting-2", "ore-processing-1", "ore-processing-2")
  LSlib.technology.addIngredient("angels-zinc-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.movePrerequisite("angels-zinc-smelting-3", "ore-processing-2", "ore-processing-4")
  LSlib.technology.addIngredient("angels-zinc-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --STEEL (alloy)
  -- smelting 1:
  LSlib.technology.addPrerequisite("angels-steel-smelting-1", "angels-metallurgy-2")

  -- smelting 2:
  LSlib.technology.addPrerequisite("angels-steel-smelting-2", "angels-metallurgy-3")
  LSlib.technology.addIngredient("angels-steel-smelting-2", 1, string.format(scienceNames.orange, "pack"))

  -- smelting 3:
  LSlib.technology.addPrerequisite("angels-steel-smelting-3", "angels-metallurgy-4")
  LSlib.technology.addIngredient("angels-steel-smelting-3", 1, string.format(scienceNames.orange, "pack"))



  --SOLDER (alloy)
  -- smelting 1:

  -- smelting 2:

  -- smelting 3:
  LSlib.technology.addPrerequisite("angels-solder-smelting-3", "angels-metallurgy-3")


--[[
  -- move glass item over to angels glass
  data.raw["recipe"]["glass"].result = "angels-plate-glass"
  MoreScience.lib.recipe.removeIngredient("empty-bottle", "glass")
  MoreScience.lib.recipe.addIngredient("empty-bottle", "angels-plate-glass", 3)

  if data.raw["recipe"]["glass-mixture-1"] then
    data.raw["recipe"]["glass"].order = data.raw["recipe"]["glass-mixture-1"].order .. "1"
    data.raw["recipe"]["glass-mixture-1"].order = data.raw["recipe"]["glass-mixture-1"].order .. "2"
    data.raw["recipe"]["glass"].subgroup = data.raw["recipe"]["glass-mixture-1"].subgroup
  end

  -- add green science requirements to smelting
  MoreScience.lib.technology.addPrerequisite("water-washing-2", "basic-science-research-1")
  MoreScience.lib.technology.addPrerequisite("angels-metallurgy-2", "basic-science-research-1")
  MoreScience.lib.technology.movePrerequisite("powder-metallurgy-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- add orange science requirements to smelting
  MoreScience.lib.technology.movePrerequisite("ore-processing-1", "angels-metallurgy-1", "angels-metallurgy-2")
  MoreScience.lib.technology.addPrerequisite("ore-processing-1", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("ore-processing-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("ore-processing-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("ore-processing-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("ore-processing-4", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("ore-processing-5", 1, "basic-automation-science-pack")

  MoreScience.lib.technology.movePrerequisite("strand-casting-1", "angels-metallurgy-1", "angels-metallurgy-2")
  MoreScience.lib.technology.addPrerequisite("strand-casting-1", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("strand-casting-1", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("strand-casting-2", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("strand-casting-3", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("strand-casting-4", 1, "basic-automation-science-pack")

  MoreScience.lib.technology.addIngredient("powder-metallurgy-2", 1,  "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("powder-metallurgy-3", 1,  "basic-automation-science-pack")
  MoreScience.lib.technology.addIngredient("powder-metallurgy-4", 1,  "basic-automation-science-pack")

  -- add blue science requirements to smelting
  MoreScience.lib.technology.addPrerequisite("angels-metallurgy-3", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("ore-processing-2", "angels-metallurgy-3")
  MoreScience.lib.technology.addPrerequisite("strand-casting-2", "angels-metallurgy-3")
  MoreScience.lib.technology.addPrerequisite("powder-metallurgy-2", "angels-metallurgy-3")
  MoreScience.lib.technology.addPrerequisite("angels-coolant-2", "angels-metallurgy-3")

  -- add purple science requirements to smelting
  MoreScience.lib.technology.addPrerequisite("ore-processing-3", "advanced-science-research-1")
  MoreScience.lib.technology.addPrerequisite("strand-casting-3", "advanced-science-research-1")
  MoreScience.lib.technology.addPrerequisite("powder-metallurgy-3", "advanced-science-research-1")

  -- add yellow science requirements to smelting
  MoreScience.lib.technology.addPrerequisite("angels-metallurgy-4", "advanced-science-research-2")
  MoreScience.lib.technology.addPrerequisite("ore-processing-4", "angels-metallurgy-4")
  MoreScience.lib.technology.addPrerequisite("strand-casting-4", "angels-metallurgy-4")
  MoreScience.lib.technology.addPrerequisite("powder-metallurgy-4", "angels-metallurgy-4")


  -- smelting processing

  --ALUMINIUM
  -- smelting 1:

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-aluminium-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.movePrerequisite("angels-aluminium-smelting-2", "strand-casting-1", "strand-casting-2")
  MoreScience.lib.technology.addIngredient("angels-aluminium-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-aluminium-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-aluminium-smelting-3", 1, "basic-automation-science-pack")



  --CHROME
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-chrome-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-chrome-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.addIngredient("angels-chrome-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-chrome-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-chrome-smelting-3", 1, "basic-automation-science-pack")



  --COBALT
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-cobalt-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-cobalt-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.addIngredient("angels-cobalt-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-cobalt-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-cobalt-smelting-3", 1, "basic-automation-science-pack")



  --COPPER
  -- smelting 1:

  -- smelting 2:
  MoreScience.lib.technology.addIngredient("angels-copper-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.addIngredient("angels-copper-smelting-3", 1, "basic-automation-science-pack")



  --GLASS
  -- smelting 1:

  -- smelting 2:
  MoreScience.lib.technology.addPrerequisite("angels-glass-smelting-2", "basic-automation-science-research")
  MoreScience.lib.technology.addIngredient("angels-glass-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-glass-smelting-3", "strand-casting-1", "strand-casting-2")
  MoreScience.lib.technology.addIngredient("angels-glass-smelting-3", 1, "basic-automation-science-pack")



  --GOLD
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-gold-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-gold-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.movePrerequisite("angels-gold-smelting-2", "strand-casting-1", "strand-casting-2")
  MoreScience.lib.technology.addIngredient("angels-gold-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-gold-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-gold-smelting-3", 1, "basic-automation-science-pack")



  --IRON
  -- smelting 1:

  -- smelting 2:
  MoreScience.lib.technology.addIngredient("angels-iron-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.addIngredient("angels-iron-smelting-3", 1, "basic-automation-science-pack")



  --LEAD
  -- smelting 1:

  -- smelting 2:
  MoreScience.lib.technology.addIngredient("angels-lead-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.addIngredient("angels-lead-smelting-3", 1, "basic-automation-science-pack")



  --MANGANESE
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-manganese-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-manganese-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.addIngredient("angels-manganese-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-manganese-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-manganese-smelting-3", 1, "basic-automation-science-pack")



  --NICKEL
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-nickel-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-nickel-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.addIngredient("angels-nickel-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-nickel-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-nickel-smelting-3", 1, "basic-automation-science-pack")



  --PLATINUM
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-platinum-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-platinum-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.movePrerequisite("angels-platinum-smelting-2", "strand-casting-1", "strand-casting-2")
  MoreScience.lib.technology.addIngredient("angels-platinum-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-platinum-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-platinum-smelting-3", 1, "basic-automation-science-pack")



  --SILICON
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-silicon-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-silicon-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.addIngredient("angels-silicon-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-silicon-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-silicon-smelting-3", 1, "basic-automation-science-pack")



  --SILVER
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-silver-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-silver-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.movePrerequisite("angels-silver-smelting-2", "strand-casting-1", "strand-casting-2")
  MoreScience.lib.technology.addIngredient("angels-silver-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-silver-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-silver-smelting-3", 1, "basic-automation-science-pack")



  --STONE
  -- smelting 1:
  MoreScience.lib.technology.removePrerequisite("angels-stone-smelting-1", "water-washing-1")
  MoreScience.lib.technology.addPrerequisite("angels-stone-smelting-1", "water-washing-2")

  -- smelting 2:
  MoreScience.lib.technology.addPrerequisite("angels-stone-smelting-2", "concrete")

  -- smelting 3:
  MoreScience.lib.technology.addPrerequisite("angels-stone-smelting-3", "powder-metallurgy-2")



  --TIN
  -- smelting 1:

  -- smelting 2:
  MoreScience.lib.technology.addIngredient("angels-tin-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.addIngredient("angels-tin-smelting-3", 1, "basic-automation-science-pack")



  --TITANIUM
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-titanium-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-titanium-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.movePrerequisite("angels-titanium-smelting-2", "strand-casting-1", "strand-casting-2")
  MoreScience.lib.technology.addIngredient("angels-titanium-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-titanium-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-titanium-smelting-3", 1, "basic-automation-science-pack")



  --TUNGSTEN
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-tungsten-smelting-1", "powder-metallurgy-1", "powder-metallurgy-2")
  MoreScience.lib.technology.addIngredient("angels-tungsten-smelting-1", 1, "basic-automation-science-pack")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-tungsten-smelting-2", "ore-processing-1", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-tungsten-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-tungsten-smelting-3", "ore-processing-2", "ore-processing-5")
  MoreScience.lib.technology.addIngredient("angels-tungsten-smelting-3", 1, "basic-automation-science-pack")



  --ZINC
  -- smelting 1:
  MoreScience.lib.technology.movePrerequisite("angels-zinc-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.movePrerequisite("angels-zinc-smelting-2", "ore-processing-1", "ore-processing-2")
  MoreScience.lib.technology.addIngredient("angels-zinc-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.movePrerequisite("angels-zinc-smelting-3", "ore-processing-2", "ore-processing-4")
  MoreScience.lib.technology.addIngredient("angels-zinc-smelting-3", 1, "basic-automation-science-pack")



  --STEEL (alloy)
  -- smelting 1:
  MoreScience.lib.technology.addPrerequisite("angels-steel-smelting-1", "angels-metallurgy-2")

  -- smelting 2:
  MoreScience.lib.technology.addPrerequisite("angels-steel-smelting-2", "angels-metallurgy-3")
  MoreScience.lib.technology.addIngredient("angels-steel-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  MoreScience.lib.technology.addPrerequisite("angels-steel-smelting-3", "angels-metallurgy-4")
  MoreScience.lib.technology.addIngredient("angels-steel-smelting-3", 1, "basic-automation-science-pack")



  --SOLDER (alloy)
  -- smelting 1:

  -- smelting 2:

  -- smelting 3:
  MoreScience.lib.technology.addPrerequisite("angels-solder-smelting-3", "angels-metallurgy-3")
]]


end
