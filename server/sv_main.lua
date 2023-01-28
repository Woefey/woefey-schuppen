local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("schup", function(src, item)
    TriggerClientEvent('woefey-schuppen:startdetect', src)
end)

RegisterNetEvent('woefey-schuppen:DetectReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)

    if chance <= Config.CommonChance then 
        local item = Config.CommonItems[math.random(1, #Config.CommonItems)]
        local amount = Config.CommonAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'Je hebt '.. item ..' gevonden!', 'success')
    elseif chance >= Config.RareChance then 
        local item = Config.RareItems[math.random(1, #Config.RareItems)]
        local amount = Config.RareAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'Je hebt '.. item ..' gevonden!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Je hebt niets gevonden!..', 'error')
    end 
end)