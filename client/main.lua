ESX          = nil
local lastVehicle = 0 
local musicStart = false 
local lastTime = 0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx_pokebicycle:onUse')
AddEventHandler('esx_pokebicycle:onUse', function()
	
end)



RegisterNetEvent('esx_pokebicycle:spawnVehicleInto')
AddEventHandler('esx_pokebicycle:spawnVehicleInto', function(vehicle)
    DeleteLastBicycle()
	local model = (type(vehicle) == 'number' and vehicle or GetHashKey(vehicle))

	if IsModelInCdimage(model) then
		local playerCoords, playerHeading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())

		ESX.Game.SpawnVehicle(model, playerCoords, playerHeading, function(vehicle)
            SetVehicleColours(vehicle,0,0)
			TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            lastVehicle = vehicle
            musicStart = true 
		end)
	else
		TriggerEvent('chat:addMessage', { args = { '^1SYSTEM', 'Invalid vehicle model.' } })
	end
end)

RegisterNetEvent('esx_pokebicycle:spawnedVehicleDelete')
AddEventHandler('esx_pokebicycle:spawnedVehicleDelete', function()
    
	 DeleteLastBicycle()
end)

CreateThread(function()
    
    while true do Wait(500)
          
        if not IsPedInVehicle(PlayerPedId(),lastVehicle) then 
            DeleteLastBicycle()
        end 
        if musicStart then 
            ResetPlayerStamina(PlayerId())
            if Config.Music then 
                if GetGameTimer() > lastTime + 31625 then 
                    TriggerMusicEvent("pokebicycle_music_kill_stop")
                    TriggerMusicEvent("pokebicycle_music")
                    lastTime = GetGameTimer()
                end 
            end 
        end 
    end 
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() == resourceName) then
        DeleteLastBicycle()
  end
end)

function DeleteLastBicycle()
    if lastVehicle ~=0 and DoesEntityExist(lastVehicle) then 
        DeleteVehicle(lastVehicle)
        lastVehicle = 0
        if Config.Music then 
        TriggerMusicEvent("pokebicycle_music_kill_stop")
        end 
        musicStart = false 
    end 
end 

