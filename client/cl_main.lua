local QBCore = exports['qb-core']:GetCoreObject()
local ent
local pos
local animdict
local anim
local breakchance
local overheated = false

local boneoffsets = {
    ["w_am_digiscanner"] = {
        bone = 18905,
        offset = vector3(0.30, 0.1, 0.0),
        rotation = vector3(200.0, 90.0, 100.0),
    },
}

local function AttachEntity(ped, model)
    if boneoffsets[model] then
        QBCore.Functions.LoadModel(model)
        pos = GetEntityCoords(PlayerPedId())
        ent = CreateObjectNoOffset(model, pos, 1, 1, 0)
        AttachEntityToEntity(ent, ped, GetPedBoneIndex(ped, boneoffsets[model].bone), boneoffsets[model].offset, boneoffsets[model].rotation, 1, 1, 0, 0, 2, 1)
    end
end

RegisterNetEvent('woefey-schuppen:startdetect', function(data)
    if inZone == 1 then 
        if not overheated then 
            QBCore.Functions.Progressbar('start_detect', 'Schuppen...', Config.DetectTime, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            }, {
            animDict = 'mini@golfai',
            anim = 'wood_idle_a',
            flags = 49,
            }, {}, {}, function()
                TriggerServerEvent('woefey-schuppen:DetectReward')
                breakchance = math.random(1,100)
                if breakchance <= Config.OverheatChance then
                    overheated = true
                    QBCore.Functions.Notify('Je moet even wachten voor je kan schuppen!', 'error', 4000)
                    Wait(Config.OverheatTime)
                    overheated = false
                    QBCore.Functions.Notify('Je moet even wachten voor je kan schuppen!', 'primary', 4000)
                end
            end, function() 
                Wait(0)
            end)
        else 
            QBCore.Functions.Notify('Je moet even wachten voor je kan schuppen!', 'error', 5000)
        end 
    else 
        QBCore.Functions.Notify('Je kan hier niets schuppen!', 'error', 5000)
    end
end)

CreateThread(function() 
    for k, v in pairs(Config.DetectZones) do
        local SchupZone = PolyZone:Create(v.zones, {
            name = v.label,
            debugPoly = Config.DebugPoly
        })
        
        SchupZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                inZone = 1
                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                    if HasItem then
                        AttachEntity(PlayerPedId(), "w_am_digiscanner")
                    end
                end, 'schup') 
            else
                inZone = 0
                DetachEntity(ent, 0, 0)
                DeleteEntity(ent)
            end
        end)
    end
end)
