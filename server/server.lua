local sharedItems = exports['qbr-core']:GetItems()

-- blood money washing
RegisterServerEvent('rsg_outlaws:server:washmoney')
AddEventHandler('rsg_outlaws:server:washmoney', function(amount)
	local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
	local amount = tonumber(amount)
	local checkbills = Player.Functions.GetItemByName("bloodmoney")
	if checkbills ~= nil then
		local amountbills = Player.Functions.GetItemByName('bloodmoney').amount
		if amountbills >= amount then
			Player.Functions.RemoveItem('bloodmoney', amount)
			TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['bloodmoney'], "remove")
			Player.Functions.AddMoney('cash', amount)
			TriggerClientEvent('QBCore:Notify', src, 9, 'You washed ' ..amount.. ' blood money!', 5000, 0, 'hud_textures', 'check', 'COLOR_WHITE')
		else
			TriggerClientEvent('QBCore:Notify', src, 9, 'You do not have enough blood money to do that!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	else
		TriggerClientEvent('QBCore:Notify', src, 9, 'You do not have any blood money!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
	end
end)