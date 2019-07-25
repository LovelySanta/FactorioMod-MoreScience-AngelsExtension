
--------------------------------------------------------------------------------
----- Bob logistics                                                        -----
--------------------------------------------------------------------------------

if mods["boblogistics"] then
  if mods["angelsrefining"] then
    log("putting it back!")
    -- put the storage tank where it belongs
    LSlib.item.setSubgroup("item", "storage-tank", "bob-storage-tank")
    LSlib.item.setOrderstring("item", "storage-tank", "b[fluid]-a[storage-tank-1]")
  end

--[[
  if mods["angelspetrochem"] then
    -- change the order (again) of the storage tank
    data.raw["item"]["storage-tank"].order = string.format("b1-a[%s]", data.raw["item"]["storage-tank"].name)
  end
]]
end
