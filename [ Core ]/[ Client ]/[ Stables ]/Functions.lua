--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function getShopData()
  local ret = _Stables.Horses
  return ret
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CreateCamera()
  for k,v in pairs(_Stables.NPCs) do
    if (Low(Area()) == (Low(v.ID))) then
      local x,y,z = v.CamPos.Coords[1], v.CamPos.Coords[2], v.CamPos.Coords[3]
      local pC = GetCoords(PedID())
      PlayerCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
      SetCamCoord(PlayerCam, (pC.x + v.OffSet[1]), (pC.y + v.OffSet[2]), (pC.z + v.OffSet[3]))
      SetCamActive(PlayerCam, true)
      RenderScriptCams(true, false, 1, true, true)
      StableCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
      SetCamCoord(StableCam, (x + 0.5), (y - 3.6), (z + 1.0))
      SetCamRot(StableCam, -20.0, 0, v.CamPos.Heading + 30.0)
      SetCamActive(StableCam, true)
      SetCamActiveWithInterp(StableCam, PlayerCam, 3900, true, true)
      Wait(4000)
      DestroyCam(PlayerCam)
      SetCamActive(PlayerCam, false)
      PlayerCam = nil
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CreateExitCam()
  local pC = GetCoords(PedID())
  PlayerCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
  SetCamCoord(PlayerCam, (pC.x + 0.5), (pC.y - 1.5), (pC.z + 0.5))
  SetCamActive(PlayerCam, true)
  SetCamActiveWithInterp(PlayerCam, StableCam, 3900, true, true)
  Wait(3900) SetCamActive(PlayerCam, false) SetCamActive(StableCam, false)
  DestroyCam(PlayerCam) DestroyCam(StableCam)
  PlayerCam, StableCam = nil, nil
  RenderScriptCams(false, false, 1, true, true)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  ShowPrompts    = false
  Stables_Menu   = nil
  Stables_Store  = nil
  pGroup_Stables = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ExitMenu()
  StoreInUse = false
  SendNUIMessage({ Action = "CloseMenu" })
  SetNuiFocus(false, false)
  Wait(3000)
  SendNUIMessage({ Action = "Hide" })
  CreateExitCam()
  ResetPrompts()
  if (IsHorseLoaded()) then DeleteEntity(HorseLoaded) end
  SetHorseDecoys()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IsHorseLoaded()
  if (not (HorseLoaded)) then return false end
  if (HorseLoaded ~= false) then return true end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WaitLoadModel(Model)
  local Hash = GetHashKey(Model)
  if IsModelValid(Hash) then
    if not HasModelLoaded(Hash) then
      RequestModel(Hash)
      while not HasModelLoaded(Hash) do Wait(10) end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetHorseDecoys()
  for k,v in pairs(HorseDecoys) do DeleteEntity(v) end
  for k,v in pairs(_Stables.HorseDecoys) do
    if (Low(Area()) == (Low(v.ID))) then
      local Dec = _Stables.RandomDecoys
      local Random = Dec[ math.random(#Dec) ]
      WaitLoadModel(Random.Model)
      local Decoy = SpawnHorse(Random.Model, v.Coords, v.Heading, false)
      Tabi(HorseDecoys, Decoy)
      if (v.Main) then HorseLoaded = Decoy end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DelHorseDecoys()
  for k,v in pairs(HorseDecoys) do DeleteEntity(v) end
  HorseDecoys = {}
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SpawnHorse(Model, Coords, Heading, Network)
  HorseLoaded = CreatePed(Model, Coords[1], Coords[2], (Coords[3] - 0.98), Heading, Network, 0)
  Citizen.InvokeNative(0x283978A15512B2FE, HorseLoaded, true)
  Citizen.InvokeNative(0x58A850EAEE20FAA3, HorseLoaded)
  Citizen.InvokeNative(0xB8B6430EAD2D2437, HorseLoaded, GetHashKey("PLAYER_HORSE"))
  Citizen.InvokeNative(0x4DB9D03AC4E1FA84, HorseLoaded, -1, -1, 0)
  SetVehicleHasBeenOwnedByPlayer(HorseLoaded, true)
  Citizen.InvokeNative(0xC80A74AC829DDD92, HorseLoaded, GetPedRelationshipGroupHash(HorseLoaded)) -- SetPedRelationshipGroupHash
  Citizen.InvokeNative(0xBF25EB89375A37AD, 1, GetPedRelationshipGroupHash(HorseLoaded), `PLAYER`) -- SetRelationshipBetweenGroups
  return HorseLoaded
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WaitToTakeTheHorse(Horse)
  while true do Wait(1)
    local NPC = GetCoords(UseThisNPC)
    local Dist = Vdist(Horse, NPC)
    if (Dist < 3.0) then return end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WaitToReturnToPlayer(NPC)
  while true do Wait(1)
    local NPCCoords = GetCoords(NPC)
    local User = GetCoords(PedID())
    local Dist = Vdist(NPCCoords, User)
    if (Dist <= 3.0) then return end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WaitForNPCToReturn(Coords)
  while true do Wait(1)
    local NPC = GetCoords(UseThisNPC)
    local Dist = Vdist(NPC, Coords)
    if (Dist < 3.0) then return end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WaitToStoreTheHorse(Coords)
  while true do Wait(1)
    local NPC = GetCoords(UseThisNPC)
    local Dist = Vdist(NPC, Coords)
    if (Dist < 3.0) then return end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNPCToUse()
  for k,v in pairs(NPCs) do
    if (Low(Area()) == Low(v.City)) then
      UseThisNPC = v.NPC
      Location = Low(Area())
    end
  end
end
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
