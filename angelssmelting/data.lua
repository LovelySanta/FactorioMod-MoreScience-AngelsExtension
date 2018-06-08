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

  -- add green science requirements
  addPrerequisiteTechnology("water-washing-2", "basic-science-research-1")
  addPrerequisiteTechnology("angels-metallurgy-2", "basic-science-research-1")
  removePrerequisiteTechnology("powder-metallurgy-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("powder-metallurgy-1", "angels-metallurgy-2")

  removePrerequisiteTechnology("angels-chrome-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-chrome-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-cobalt-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-cobalt-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-gold-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-gold-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-manganese-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-manganese-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-nickel-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-nickel-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-platinum-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-platinum-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-silicon-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-silicon-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-silver-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-silver-smelting-1", "angels-metallurgy-2")
  addPrerequisiteTechnology("angels-steel-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-titanium-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-titanium-smelting-1", "angels-metallurgy-2")
  removePrerequisiteTechnology("angels-zinc-smelting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("angels-zinc-smelting-1", "angels-metallurgy-2")
  addPrerequisiteTechnology("angels-stone-smelting-2", "concrete")

  -- add orange science requirements
  removePrerequisiteTechnology("ore-processing-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("ore-processing-1", "angels-metallurgy-2")
  addPrerequisiteTechnology("ore-processing-1", "basic-automation-science-research")
  addScienceIngredient("ore-processing-1", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-2", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-3", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-4", 1, "basic-automation-science-pack")
  addScienceIngredient("ore-processing-5", 1, "basic-automation-science-pack")
  removePrerequisiteTechnology("strand-casting-1", "angels-metallurgy-1")
  addPrerequisiteTechnology("strand-casting-1", "angels-metallurgy-2")
  addPrerequisiteTechnology("strand-casting-1", "basic-automation-science-research")
  addScienceIngredient("strand-casting-1", 1, "basic-automation-science-pack")
  addScienceIngredient("strand-casting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("strand-casting-3", 1, "basic-automation-science-pack")
  addScienceIngredient("strand-casting-4", 1, "basic-automation-science-pack")

  addScienceIngredient("angels-iron-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-copper-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-lead-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-aluminium-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-chrome-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-cobalt-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-gold-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-manganese-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-nickel-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-platinum-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-silicon-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-silver-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-steel-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-titanium-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-zinc-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-tin-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-stone-smelting-2", 1, "basic-automation-science-pack")
  addScienceIngredient("angels-stone-smelting-3", 1, "basic-automation-science-pack")
  addPrerequisiteTechnology("angels-glass-smelting-2", "basic-automation-science-research")
  addScienceIngredient("angels-glass-smelting-2", 1, "basic-automation-science-pack")

  -- add blue science requirements
  addPrerequisiteTechnology("angels-metallurgy-3", "basic-science-research-2")
  addPrerequisiteTechnology("ore-processing-2", "angels-metallurgy-3")
  addPrerequisiteTechnology("strand-casting-2", "angels-metallurgy-3")
  addPrerequisiteTechnology("powder-metallurgy-2", "angels-metallurgy-3")

  addPrerequisiteTechnology("angels-coolant-2", "angels-metallurgy-3")

  addPrerequisiteTechnology("angles-solder-smelting-3", "angels-metallurgy-3")
  addPrerequisiteTechnology("angles-stone-smelting-3", "powder-metallurgy-2")
  removePrerequisiteTechnology("angels-tungsten-smelting-1", "powder-metallurgy-1")
  addPrerequisiteTechnology("angels-tungsten-smelting-1", "powder-metallurgy-2")
  removePrerequisiteTechnology("angels-aluminium-smelting-2", "ore-processing-1")
  removePrerequisiteTechnology("angels-aluminium-smelting-2", "strand-casting-1")
  addPrerequisiteTechnology("angels-aluminium-smelting-2", "ore-processing-2")
  addPrerequisiteTechnology("angels-aluminium-smelting-2", "strand-casting-2")
  removePrerequisiteTechnology("angels-chrome-smelting-2", "ore-processing-1")
  addPrerequisiteTechnology("angels-chrome-smelting-2", "ore-processing-2")
  removePrerequisiteTechnology("angels-cobalt-smelting-2", "ore-processing-1")
  addPrerequisiteTechnology("angels-cobalt-smelting-2", "ore-processing-2")
  removePrerequisiteTechnology("angels-gold-smelting-2", "ore-processing-1")
  removePrerequisiteTechnology("angels-gold-smelting-2", "strand-casting-1")
  addPrerequisiteTechnology("angels-gold-smelting-2", "ore-processing-2")
  addPrerequisiteTechnology("angels-gold-smelting-2", "strand-casting-2")
  removePrerequisiteTechnology("angels-manganese-smelting-2", "ore-processing-1")
  addPrerequisiteTechnology("angels-manganese-smelting-2", "ore-processing-2")
  removePrerequisiteTechnology("angels-nickel-smelting-2", "ore-processing-1")
  addPrerequisiteTechnology("angels-nickel-smelting-2", "ore-processing-2")
  removePrerequisiteTechnology("angels-platinum-smelting-2", "ore-processing-1")
  removePrerequisiteTechnology("angels-platinum-smelting-2", "strand-casting-1")
  addPrerequisiteTechnology("angels-platinum-smelting-2", "ore-processing-2")
  addPrerequisiteTechnology("angels-platinum-smelting-2", "strand-casting-2")
  removePrerequisiteTechnology("angels-silicon-smelting-2", "ore-processing-1")
  addPrerequisiteTechnology("angels-silicon-smelting-2", "ore-processing-2")
  removePrerequisiteTechnology("angels-silver-smelting-2", "ore-processing-1")
  removePrerequisiteTechnology("angels-silver-smelting-2", "strand-casting-1")
  addPrerequisiteTechnology("angels-silver-smelting-2", "ore-processing-2")
  addPrerequisiteTechnology("angels-silver-smelting-2", "strand-casting-2")
  addPrerequisiteTechnology("angels-steel-smelting-2", "angels-metallurgy-3")
  removePrerequisiteTechnology("angels-titanium-smelting-2", "ore-processing-1")
  removePrerequisiteTechnology("angels-titanium-smelting-2", "strand-casting-1")
  addPrerequisiteTechnology("angels-titanium-smelting-2", "ore-processing-2")
  addPrerequisiteTechnology("angels-titanium-smelting-2", "strand-casting-2")
  removePrerequisiteTechnology("angels-zinc-smelting-2", "ore-processing-1")
  addPrerequisiteTechnology("angels-zinc-smelting-2", "ore-processing-2")
  addPrerequisiteTechnology("angels-glass-smelting-3", "powder-metallurgy-2")
  addPrerequisiteTechnology("angels-zinc-smelting-2", "strand-casting-2")
  addPrerequisiteTechnology("angels-stone-smelting-3", "powder-metallurgy-2")
  addPrerequisiteTechnology("angels-solder-smelting-3", "angels-metallurgy-3")
end
