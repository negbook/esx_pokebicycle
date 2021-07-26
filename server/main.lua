ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local using = false 
ESX.RegisterUsableItem('pokebicycle', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.removeInventoryItem('pokebicycle', 1)
    using = not using
    if using then 
        xPlayer.triggerEvent('esx_pokebicycle:spawnVehicleInto', Config.bicycle)
        TriggerClientEvent('esx_pokebicycle:onUse', source)
    else 
        xPlayer.triggerEvent('esx_pokebicycle:spawnedVehicleDelete')
    end 
end)

