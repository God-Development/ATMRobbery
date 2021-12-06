ESX 						   = nil
local connectedPolice       	   = 0
local playerConnected = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Count Police
function CountPolice()
	local xPlayers = ESX.GetPlayers()
	connectedPolice = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			connectedPolice = connectedPolice + 1
		end
	end
	
	SetTimeout(60000, CountPolice)
end

CountPolice()

ESX.RegisterUsableItem('usb', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if connectedPolice >= Config.RequiredCops then
        TriggerClientEvent('luci-atmrob:client:ATMCheck', source)
    else
        xPlayer.showNotification(_U('There are not enough cops in the city.', Config.RequiredCops))
    end
end)

RegisterServerEvent('luci-atmrob:server:getcash')
AddEventHandler('luci-atmrob:server:getcash', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = math.random(Config.Lowest,Config.MaxCash)
    if Config.MarkedBills == true then
        xPlayer.addInventoryItem(Config.MarkedBillsName, cash)
        xPlayer.removeInventoryItem("usb", 1)
    elseif Config.MarkedBills == false then
        xPlayer.addMoney(cash)
        xPlayer.removeInventoryItem("usb", 1)
    end
end)