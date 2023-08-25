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

