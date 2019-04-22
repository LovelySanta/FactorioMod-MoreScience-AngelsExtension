
--------------------------------------------------------------------------------
----- Bob modules                                                          -----
--------------------------------------------------------------------------------

if mods["bobmodules"] then

  -- move the lab
  LSlib.item.setSubgroup("item", "lab-module", "ms-science-bottling")
  LSlib.item.setOrderstring("item", "lab-module", LSlib.item.getOrderstring("item", "lab")  .. "-m[module]")

  if mods["bobtech"] then -- modules lab get graphics from the lab-2
    LSlib.item.changeIcons("item", "lab-module", LSlib.item.getIcons("item", "lab-2"))
    LSlib.item.changeIcons("lab" , "lab-module", LSlib.item.getIcons("item", "lab-2"))
    for _,property in pairs{"on_animation", "off_animation"} do
      data.raw["lab"]["lab-module"][property] = util.table.deepcopy(data.raw["lab"]["lab-2"][property])
    end
    LSlib.recipe.setCraftingCategory("lab-module", "ms-advanced-crafting")
  end

  LSlib.technology.removePrerequisite("combat-robotics-3", "speed-module")

  --[[
  if mods["angelssmelting"] then
    -- modules require some types of plates
    MoreScience.lib.technology.addPrerequisite("modules", "angels-aluminium-smelting-1")
    MoreScience.lib.technology.addPrerequisite("modules", "angels-copper-smelting-1")
    MoreScience.lib.technology.addPrerequisite("modules", "angels-tin-smelting-1")
    MoreScience.lib.technology.addPrerequisite("modules", "angels-gold-smelting-1")
    MoreScience.lib.technology.addPrerequisite("modules", "angels-solder-smelting-1")
  end

  -- pollution modules require regular module research
  MoreScience.lib.technology.addPrerequisite("pollution-clean-module-2", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("pollution-create-module-2", "basic-science-research-2")

  MoreScience.lib.technology.addPrerequisite("pollution-clean-module-3", "advanced-science-research-2")
  MoreScience.lib.technology.addPrerequisite("pollution-create-module-3", "advanced-science-research-2")

  MoreScience.lib.technology.addPrerequisite("pollution-clean-module-7", "infinite-science-research")
  MoreScience.lib.technology.addPrerequisite("pollution-create-module-7", "infinite-science-research")
  MoreScience.lib.technology.addPrerequisite("speed-module-7", "infinite-science-research")
  MoreScience.lib.technology.addPrerequisite("effectivity-module-7", "infinite-science-research")
  MoreScience.lib.technology.addPrerequisite("productivity-module-7", "infinite-science-research")

  -- move the lab
  data.raw["item"]["lab-module"].subgroup = data.raw["item"]["lab-burner"].subgroup
  data.raw["item"]["lab-module"].order = data.raw["item"]["lab"].order .. "-m[module]"
  ]]
end
