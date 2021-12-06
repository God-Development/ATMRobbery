ESX = nil
PlayerData = {}
local atm = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

exports[Config.TargetName]:AddTargetModel(Config.Models, {
    options = {
        {
            event = "luci-atmrob:client:getatm",
            icon = "fas fa-credit-card",
            label = "Hack the ATM",
            job = {"all"},
        },
    },
    distance = 1.0
})

RegisterNetEvent('luci-atmrob:client:getatm')
AddEventHandler('luci-atmrob:client:getatm', function(atm)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    if atm then 
        atm = true
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
        if Config.UseProgressBar then 
            TriggerEvent("mythic_progbar:client:progress", {
                name = "atmRobberyShitFuck",
                duration = 10000,
                label = "Breaching",
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
            },
        function(status)
        if not status then
            Citizen.Wait(100)
            ClearPedTasks(playerPed)
            startmihra(atm)
            if Config.CallPDonStart then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                exports['core_dispach']:addCall("10-68", "An ATM Is Being Robbed", {
                    {icon="", info="A Few Miles Away"},
                    {icon="", info="ATM Robbery"}
                    }, {playerCoords.x, playerCoords.y, playerCoords.z}, "police", 3000, 11, 5 ) 
                end
            end
        end)
    end
end
end)

RegisterNetEvent('luci-atmrob:client:ATMCheck')
AddEventHandler('luci-atmrob:client:ATMCheck', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for k, v in pairs(Config.Models) do
        local model = GetHashKey(v)
        entity = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 1.5, model, false, false, false)

        if entity ~= 0 then
            atmFound = true
            break
        else
            atmFound = false
        end
    end
    TriggerEvent('luci-atmrob:client:getatm', atmFound)
end)
