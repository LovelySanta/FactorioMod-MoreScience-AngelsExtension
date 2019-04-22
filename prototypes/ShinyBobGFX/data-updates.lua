
--------------------------------------------------------------------------------
----- ShinyBobGFX                                                          -----
--------------------------------------------------------------------------------

if mods["ShinyBobGFX"] then
  require "__ShinyBobGFX__/prototypes/labs"

  -- LABS ----------------------------------------------------------------------
  if mods["bobtech"] then
    -- lab mk2
    for _,property in pairs{"on_animation", "off_animation"} do
      data.raw["lab"]["lab-mk2"][property] = util.table.deepcopy(data.raw["lab"]["lab-2"][property])
    end

    LSlib.item.changeIcons("item", "lab-mk2", LSlib.item.getIcons("item", "lab-2"))
    LSlib.entity.changeIcons("lab", "lab-mk2", LSlib.item.getIcons("item", "lab-mk2"))

    -- lab mk1
    LSlib.item.setOrderstring("item", "lab", "g[lab]".."-mk1")
    LSlib.item.setSubgroup("item", "lab", "ms-science-bottling")
  end

  if mods["bobmodules"] then
    LSlib.item.setOrderstring("item", "lab-module", LSlib.item.getOrderstring("item", "lab")  .. "-m[module]")
    LSlib.item.setSubgroup("item", "lab-module", "ms-science-bottling")
  end

  if mods["bobtech"] and data.raw["item"]["lab-alien"] then
    LSlib.item.setOrderstring("item", "lab-alien", LSlib.item.getOrderstring("item", "lab")  .. "-m[module]")
    LSlib.item.setSubgroup("item", "lab-alien", "ms-science-bottling")
  end

end
