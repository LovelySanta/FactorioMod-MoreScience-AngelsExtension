
--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then

  if mods["angelspetrochem"] then
    -- change the order (again) of the storage tank
    data.raw["item"]["storage-tank"].order = string.format("b1-a[%s]", data.raw["item"]["storage-tank"].name)
  end

end
