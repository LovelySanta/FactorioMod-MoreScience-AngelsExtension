
if mods["angelsaddons-shred"] then

  if settings.startup["deco-shred-create-shrine-offer"].value then
    -- move shrine offers to satellite subgroup
    for _,decoName in pairs({
      "shred",
      "santa",
      "inter",
      "voske",
      "east",
    }) do
      local itemName = "offering-"..decoName.."-1"

      if data.raw["item"][itemName] then
        data.raw["item"][itemName].subgroup = data.raw["item"]["satellite"].subgroup
      end

    end
  end

end
