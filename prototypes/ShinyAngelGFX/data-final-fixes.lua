
--------------------------------------------------------------------------------
----- ShinyAngelGFX                                                        -----
--------------------------------------------------------------------------------

if mods["ShinyAngelGFX"] then

  if mods["boblogistics"] and
     data.raw["assembling-machine"]["steam-cracker"] and
     data.raw["storage-tank"]["storage-tank-2"] then
    LSlib.item.setSubgroup("item", "storage-tank", "angels-fluid-control")
    LSlib.item.setOrderstring("item", "storage-tank", "a")
  end

end
