--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
IsFollowing = false
IsHorseStaying = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Native keys for horse interactions
--------------------------------------------------------------------------------
CreateThread(function()
  local Mouse = false
  while true do Wait(1000)
    local C = CheckControls()
    if (C[1] == 1) then Mouse = true end
    while (Mouse) do Wait(1)
      local C = CheckControls()
      if (C[1] == false) then Mouse = false end
      if (C[2] == 1) then
        TriggerEvent('DokusCore:Stables:Horse:Flee')
        Wait(3000)
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
