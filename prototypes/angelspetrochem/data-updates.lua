
--------------------------------------------------------------------------------
----- Angels PetroChem                                                     -----
--------------------------------------------------------------------------------
if mods["angelspetrochem"] then
--[[
  if mods["bobplates"] then
    -- check if we can disable gas-canisters
    if data.raw["technology"]["gas-canisters"] then
      local hasPrerequisites = false
      for _,technology in pairs(data.raw["technology"]) do
        if technology.prerequisites then
          for _,prerequisite in pairs(technology.prerequisites) do
            if prerequisite == "gas-canisters" then
              hasPrerequisites = true
              break
            end
          end
        end
      end

      if not hasPrerequisites then
        data.raw["technology"]["gas-canisters"].enabled = false
      end
    end
  end
]]
end
