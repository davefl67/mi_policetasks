RegisterNetEvent('mipl:idletask:wellness')
AddEventHandler('mipl:idletask:wellness', function(pedname, pedinfo, pedloc)

    SetAlertBlip(pedloc.blip, pedname)
    PDT.acceptedcall = true

    -- spawn ped
    local model = lib.requestModel(pedinfo.model)
    local ranloc = pedloc.spawn[math.random(1, #pedloc.spawn)]
    local ped = CreatePed(1, model, ranloc.x, ranloc.y, ranloc.z, ranloc.w, true, false)
    local chance = math.random(0,1)
    TaskWanderInArea(ped, ranloc.x, ranloc.y, ranloc.z, 15.0, 5.0, 8.0)
    Citizen.Wait(math.random(10000, 30000))
    if chance == 1 then
        SetEntityHealth(ped, 0)
    end

    local options = {
        {
            name = 'wellnesscheck1',
            label = 'Check on Citizen',
            icon = 'fa-solid fa-user-check',
            canInteract = function(_, distance)
                return distance < 2.5 and not IsEntityDead(ped)
            end,
            onSelect = function()
                local duration = 10000
                TaskPlayAnim(ped, 'misscarsteal4@actor', 'actor_berating_loop', 8.0, 8.0, duration, 1, 1, true, true, true )
                TaskLookAtEntity(ped, PlayerPedId(), duration, 2048, 3)
                if lib.progressBar({
                    duration = duration,
                    label = 'Performing Welness Check',
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                        combat = true
                    },
                    anim = {
                        dict = 'random@countrysiderobbery',
                        clip = 'idle_a'
                    },
                }) then
                    SetAlertPedBehavior(ped)
                    PDT.acceptedcall = false
                    RemoveBlip(pedloc.blip)
                    exports.ox_target:removeLocalEntity(ped, {'wellnesscheck1'})
                end
                
            end
        },
        {
            name = 'wellnesscheck2',
            label = 'Report Dead Body',
            icon = 'fa-solid fa-skull-crossbones',
            canInteract = function(_, distance)
                return distance < 2.5 and IsEntityDead(ped)
            end,
            onSelect = function()
                local duration = 10000
                if lib.progressBar({
                    duration = duration,
                    label = 'Performing Welness Check',
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                        combat = true
                    },
                    anim = {
                        dict = 'random@arrests',
                        clip = 'generic_radio_chatter'
                    },
                }) then
                    SetAlertPedBehavior(ped)
                    PDT.acceptedcall = false
                    RemoveBlip(pedloc.blip)
                    exports.ox_target:removeLocalEntity(ped, {'wellnesscheck2'})
                end
                
            end
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
end)

