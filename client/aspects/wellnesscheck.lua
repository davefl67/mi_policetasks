PDT = {}
PDT.acceptedcall = false

ShowCallMenu = function()
    lib.showContext('inform_menu')
end

-- event to find ped & info
RegisterNetEvent('mipl:idletask:inform')
AddEventHandler('mipl:idletask:inform', function()
    -- random choice of ped details
    local pedname, pedinfo, pedloc, pedevent = nil, nil, nil, nil
    local chance = math.random(0,1)
    pedname = SetPedName(chance)
    pedinfo = SetPedDetails(chance)
    pedloc = SetPedlocation()
    pedevent = SetActivalIdleCall()

    -- menu for event & ped details
    lib.registerContext({
        id = 'inform_menu',
        title = 'Avaliable Call Information',
        options = {
            {
                icon = 'circle-info',
                title = 'Call Type:',
                description = pedevent
            },
            {
                icon = 'circle-user',
                title = 'Name:',
                description = pedname
            },
            {
                icon = 'list-ul',
                title = 'Description',
                description = pedinfo.dscpt
            },
            {
                icon = 'image',
                title = 'image of individual:',
                description = 'hover mouse over button to see image',
                image = pedinfo.img
            },
            {
                icon = 'map-location-dot',
                title = 'Last Seen at:',
                description = pedloc.place
            },
            {
                icon = 'check-to-slot',
                title = 'Accept Call?',
                description = 'Accepting will bind you to the call',
                onSelect = function()
                    TriggerEvent('mipl:idletask:wellness', pedname, pedinfo, pedloc)
                end
            },
        }
    })
    ShowCallMenu()
end)

RegisterNetEvent('mipl:idletask:wellness')
AddEventHandler('mipl:idletask:wellness', function(pedname, pedinfo, pedloc)
    
    SetAlertBlip(pedloc.blip, pedname)
    PDT.acceptedcall = true

    -- spawn ped
    local model = lib.requestModel(pedinfo.model)
    local ranloc = pedloc.spawn[math.random(1, #pedloc.spawn)]
    local ped = CreatePed(1, model, ranloc.x, ranloc.y, ranloc.z, ranloc.w, true, false)
    TaskWanderInArea(ped, ranloc.x, ranloc.y, ranloc.z, 15.0, 5.0, 8.0)
    

    local options = {
        {
            name = 'wellnesscheck',
            label = 'Check on Citizen',
            icon = 'fa-solid fa-user-clip',
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
                end
                
            end
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
end)

