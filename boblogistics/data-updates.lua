
--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then

  if mods["angelspetrochem"] then
    if data.raw["item"]["angels-storage-tank-3"] then
      data.raw["item"]["storage-tank"].subgroup = data.raw["item"]["angels-storage-tank-3"].subgroup
    end
  end

end
