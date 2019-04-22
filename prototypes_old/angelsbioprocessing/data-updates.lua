require 'util'

--------------------------------------------------------------------------------
----- Angels bio processing                                                -----
--------------------------------------------------------------------------------

if mods["angelsbioprocessing"] then

  -- remove bio token from the lab
  if data.raw["tool"]["token-bio"] and data.raw["lab"]["lab"] and data.raw["lab"]["lab"].inputs then
    for inputIndex, inputName in pairs(data.raw["lab"]["lab"].inputs) do
      if inputName == "token-bio" then
        table.remove(data.raw["lab"]["lab"].inputs, inputIndex)
        break
      end
    end
  end

end
