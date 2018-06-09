require "lib/prototyping"



--------------------------------------------------------------------------------
----- Angels Smelting                                                      -----
--------------------------------------------------------------------------------

if mods["angelssmelting"] then

  -- move glass item over to angels glass
  data.raw["recipe"]["glass"].result = "angels-plate-glass"
  removeRecipeIngredient("empty-bottle", "glass")
  addRecipeIngredient("empty-bottle", "angels-plate-glass", 3)

  if data.raw["recipe"]["glass-mixture-1"] then
    data.raw["recipe"]["glass"].order = data.raw["recipe"]["glass-mixture-1"].order .. "1"
    data.raw["recipe"]["glass-mixture-1"].order = data.raw["recipe"]["glass-mixture-1"].order .. "2"
    data.raw["recipe"]["glass"].subgroup = data.raw["recipe"]["glass-mixture-1"].subgroup
  end

  -- add green science requirements to smelting
  addPrerequisiteTechnology("water-washing-2", "basic-science-research-1")
  addPrerequisiteTechnology("angels-metallurgy-2", "basic-science-research-1")
  movePrerequisiteTechnology("powder-metallurgy-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- add orange science requirements to smelting
  movePrerequisiteTechnology("ore-processing-1", "angels-metallurgy-1", "angels-metallurgy-2")
  addPrerequisiteTechnology("ore-processing-1", "basic-automation-science-research")
  addScienceIngredient("ore-processing-1", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-2", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-3", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-4", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-5", 1, "basic-automation-science-pack")

  removePrerequisiteTechnology("strand-casting-1", "angels-metallurgy-1", "angels-metallurgy-2")
  addPrerequisiteTechnology("strand-casting-1", "basic-automation-science-research")
  addScienceIngredient("strand-casting-1", 1, "basic-automation-science-pack")
  addScienceIngredient("strand-casting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("strand-casting-3", 1, "basic-automation-science-pack")
  addScienceIngredient("strand-casting-4", 1, "basic-automation-science-pack")

  addScienceIngredient("powder-metallurgy-2", 1,  "basic-automation-science-pack")
  addScienceIngredient("powder-metallurgy-3", 1,  "basic-automation-science-pack")
  addScienceIngredient("powder-metallurgy-4", 1,  "basic-automation-science-pack")

  -- add blue science requirements to smelting
  addPrerequisiteTechnology("angels-metallurgy-3", "basic-science-research-2")
  addPrerequisiteTechnology("ore-processing-2", "angels-metallurgy-3")
  addPrerequisiteTechnology("strand-casting-2", "angels-metallurgy-3")
  addPrerequisiteTechnology("powder-metallurgy-2", "angels-metallurgy-3")
  addPrerequisiteTechnology("angels-coolant-2", "angels-metallurgy-3")

  -- add purple science requirements to smelting
  addPrerequisiteTechnology("ore-processing-3", "advanced-science-research-1")
  addPrerequisiteTechnology("strand-casting-3", "advanced-science-research-1")
  addPrerequisiteTechnology("powder-metallurgy-3", "advanced-science-research-1")

  -- add yellow science requirements to smelting
  addPrerequisiteTechnology("angels-metallurgy-4", "advanced-science-research-2")
  addPrerequisiteTechnology("ore-processing-4", "angels-metallurgy-4")
  addPrerequisiteTechnology("strand-casting-4", "angels-metallurgy-4")
  addPrerequisiteTechnology("powder-metallurgy-4", "angels-metallurgy-4")


  -- smelting processing

  --ALUMINIUM
  -- smelting 1:

  -- smelting 2:
  movePrerequisiteTechnology("angels-aluminium-smelting-2", "ore-processing-1", "ore-processing-2")
  movePrerequisiteTechnology("angels-aluminium-smelting-2", "strand-casting-1", "strand-casting-2")
  addScienceIngredient("angels-aluminium-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-aluminium-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-aluminium-smelting-3", 1, "basic-automation-science-pack")



  --CHROME
  -- smelting 1:
  movePrerequisiteTechnology("angels-chrome-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-chrome-smelting-2", "ore-processing-1", "ore-processing-2")
  addScienceIngredient("angels-chrome-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-chrome-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-chrome-smelting-3", 1, "basic-automation-science-pack")



  --COBALT
  -- smelting 1:
  movePrerequisiteTechnology("angels-cobalt-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-cobalt-smelting-2", "ore-processing-1", "ore-processing-2")
  addScienceIngredient("angels-cobalt-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-cobalt-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-cobalt-smelting-3", 1, "basic-automation-science-pack")



  --COPPER
  -- smelting 1:

  -- smelting 2:
  addScienceIngredient("angels-copper-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  addScienceIngredient("angels-copper-smelting-3", 1, "basic-automation-science-pack")



  --GLASS
  -- smelting 1:

  -- smelting 2:
  addPrerequisiteTechnology("angels-glass-smelting-2", "basic-automation-science-research")
  addScienceIngredient("angels-glass-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-glass-smelting-3", "strand-casting-1", "strand-casting-2")
  addScienceIngredient("angels-glass-smelting-3", 1, "basic-automation-science-pack")



  --GOLD
  -- smelting 1:
  movePrerequisiteTechnology("angels-gold-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-gold-smelting-2", "ore-processing-1", "ore-processing-2")
  movePrerequisiteTechnology("angels-gold-smelting-2", "strand-casting-1", "strand-casting-2")
  addScienceIngredient("angels-gold-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-gold-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-gold-smelting-3", 1, "basic-automation-science-pack")



  --IRON
  -- smelting 1:

  -- smelting 2:
  addScienceIngredient("angels-iron-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  addScienceIngredient("angels-iron-smelting-3", 1, "basic-automation-science-pack")



  --LEAD
  -- smelting 1:

  -- smelting 2:
  addScienceIngredient("angels-lead-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  addScienceIngredient("angels-lead-smelting-3", 1, "basic-automation-science-pack")



  --MANGANESE
  -- smelting 1:
  movePrerequisiteTechnology("angels-manganese-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-manganese-smelting-2", "ore-processing-1", "ore-processing-2")
  addScienceIngredient("angels-manganese-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-manganese-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-manganese-smelting-3", 1, "basic-automation-science-pack")



  --NICKEL
  -- smelting 1:
  movePrerequisiteTechnology("angels-nickel-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-nickel-smelting-2", "ore-processing-1", "ore-processing-2")
  addScienceIngredient("angels-nickel-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-nickel-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-nickel-smelting-3", 1, "basic-automation-science-pack")



  --PLATINUM
  -- smelting 1:
  movePrerequisiteTechnology("angels-platinum-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-platinum-smelting-2", "ore-processing-1", "ore-processing-2")
  movePrerequisiteTechnology("angels-platinum-smelting-2", "strand-casting-1", "strand-casting-2")
  addScienceIngredient("angels-platinum-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-platinum-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-platinum-smelting-3", 1, "basic-automation-science-pack")



  --SILICON
  -- smelting 1:
  movePrerequisiteTechnology("angels-silicon-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-silicon-smelting-2", "ore-processing-1", "ore-processing-2")
  addScienceIngredient("angels-silicon-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-silicon-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-silicon-smelting-3", 1, "basic-automation-science-pack")



  --SILVER
  -- smelting 1:
  movePrerequisiteTechnology("angels-silver-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-silver-smelting-2", "ore-processing-1", "ore-processing-2")
  movePrerequisiteTechnology("angels-silver-smelting-2", "strand-casting-1", "strand-casting-2")
  addScienceIngredient("angels-silver-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-silver-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-silver-smelting-2", 1, "basic-automation-science-pack")



  --STONE
  -- smelting 1:

  -- smelting 2:
  addPrerequisiteTechnology("angels-stone-smelting-2", "concrete")

  -- smelting 3:
  addPrerequisiteTechnology("angels-stone-smelting-3", "powder-metallurgy-2")



  --TIN
  -- smelting 1:

  -- smelting 2:
  addScienceIngredient("angels-tin-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  addScienceIngredient("angels-tin-smelting-3", 1, "basic-automation-science-pack")



  --TITANIUM
  -- smelting 1:
  movePrerequisiteTechnology("angels-titanium-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-titanium-smelting-2", "ore-processing-1", "ore-processing-2")
  movePrerequisiteTechnology("angels-titanium-smelting-2", "strand-casting-1", "strand-casting-2")
  addScienceIngredient("angels-titanium-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-titanium-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-titanium-smelting-3", 1, "basic-automation-science-pack")



  --TUNGSTEN
  -- smelting 1:
  movePrerequisiteTechnology("angels-tungsten-smelting-1", "powder-metallurgy-1", "powder-metallurgy-2")
  addScienceIngredient("angels-tungsten-smelting-1", 1, "basic-automation-science-pack")

  -- smelting 2:
  movePrerequisiteTechnology("angels-tungsten-smelting-2", "ore-processing-1", "ore-processing-4")
  addScienceIngredient("angels-tungsten-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-tungsten-smelting-3", "ore-processing-2", "ore-processing-5")
  addScienceIngredient("angels-tungsten-smelting-3", 1, "basic-automation-science-pack")



  --ZINC
  -- smelting 1:
  movePrerequisiteTechnology("angels-zinc-smelting-1", "angels-metallurgy-1", "angels-metallurgy-2")

  -- smelting 2:
  movePrerequisiteTechnology("angels-zinc-smelting-2", "ore-processing-1", "ore-processing-2")
  addScienceIngredient("angels-zinc-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  movePrerequisiteTechnology("angels-zinc-smelting-3", "ore-processing-2", "ore-processing-4")
  addScienceIngredient("angels-zinc-smelting-3", 1, "basic-automation-science-pack")



  --STEEL (alloy)
  -- smelting 1:
  addPrerequisiteTechnology("angels-steel-smelting-1", "angels-metallurgy-2")

  -- smelting 2:
  addPrerequisiteTechnology("angels-steel-smelting-2", "angels-metallurgy-3")
  addScienceIngredient("angels-steel-smelting-2", 1, "basic-automation-science-pack")

  -- smelting 3:
  addPrerequisiteTechnology("angels-steel-smelting-3", "angels-metallurgy-4")
  addScienceIngredient("angels-steel-smelting-3", 1, "basic-automation-science-pack")



  --SOLDER (ally)
  -- smelting 1:

  -- smelting 2:

  -- smelting 3:
  addPrerequisiteTechnology("angels-solder-smelting-3", "angels-metallurgy-3")



end
