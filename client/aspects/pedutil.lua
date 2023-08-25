-- function to set call
SetActivalIdleCall = function()
    local event, chance = nil, nil
    event = 0 -- math.random(0,3)
    if event == 0 then -- if event == 0 then
        event = 'Wellness Check'
        return event
    end
end

-- function to set behavior of ped
SetAlertPedBehavior = function(ped)
    local chance = math.random(0,100)
    if chance >= 0 and chance <= 40 then
        SetPedRelationshipGroupHash(ped, 'NO_RELATIONSHIP')
        SetRelationshipBetweenGroups(3, 'NO_RELATIONSHIP', 'PLAYER')
        print(chance)
        TaskWanderStandard(ped, 10.0, 10.0)
        Citizen.Wait(30000)
        DeleteEntity(ped)
        -- docile / leaves
    elseif chance >= 41 and chance <= 70 then
        SetPedRelationshipGroupHash(ped, 'NO_RELATIONSHIP')
        SetRelationshipBetweenGroups(4, 'NO_RELATIONSHIP', 'PLAYER')
        print(chance)
        TaskWanderStandard(ped, 10.0, 10.0)
        Citizen.Wait(30000)
        DeleteEntity(ped)
        -- annoyed and leaves
    elseif chance >= 71 and chance <= 85 and IP.wellness.aggression.aftertalk then
        SetPedRelationshipGroupHash(ped, 'PRIVATE_SECURITY')
        SetRelationshipBetweenGroups(5, 'PRIVATE_SECURITY', 'PLAYER')
        print(chance)
        -- becomes aggressive
        TaskGoToEntity(ped, PlayerPedId(), -1, 1.0, 10.0, 1073741824.0, 0)
        SetPedKeepTask(ped, true)
        Citizen.Wait(math.random(8000, 16000))
        local aggressive = math.random(0,1)
        if aggressive == 1 then
            SetAlertPedWeapon(ped)
            SetPedCombatRange(ped, 1)
            SetPedAsEnemy(ped, true)
        else
            TaskWanderStandard(ped, 10.0, 10.0)
            Citizen.Wait(30000)
            DeleteEntity(ped)
        end
    elseif IP.wellness.aggression.onsight then
        Citizen.Wait(math.random(3, 10))
        SetPedRelationshipGroupHash(ped, 'HATES_PLAYER')
        SetRelationshipBetweenGroups(5, 'HATES_PLAYER', 'PLAYER')
        print(chance)
        --attacks on sight
        SetAlertPedWeapon(ped)
        SetPedCombatRange(ped, 2)
        SetPedAsEnemy(ped, true)
    end

end

-- function to pick random class / weapon to give
SetAlertPedWeapon = function(ped)
    local choice = nil
    local melee = {
        'WEAPON_BAT','WEAPON_HATCHET','WEAPON_KNIFE','WEAPON_BATTLEAXE','WEAPON_WRENCH'}

    local smallarm = {
        'WEAPON_PISTOL','WEAPON_PISTOLXM3','WEAPON_CERAMICPISTOL','WEAPON_COMBATPISTOL'}

    local longarm = {
        'WEAPON_ASSAULTRIFLE','WEAPON_PUMPSHOTGUN','WEAPON_CARBINERIFLE','WEAPON_COMPACTRIFLE','WEAPON_MUSKET'}
    
        local chance = math.random(0,100)
    if chance >= 0 and chance <= 50 then
        choice = melee[math.random(1, #melee)]
        GiveWeaponToPed(ped, GetHashKey(choice), 60, false, true)
        SetCurrentPedWeapon(ped, GetHashKey(choice), true)
        SetPedAccuracy(ped, math.random(20, 50))
    elseif chance >= 51 and chance <= 85 then
        choice = smallarm[math.random(1, #smallarm)]
        GiveWeaponToPed(ped, GetHashKey(choice), 60, false, true)
        SetCurrentPedWeapon(ped, GetHashKey(choice), true)
        SetPedAccuracy(ped, math.random(30, 60))
    else
        choice = longarm[math.random(1, #longarm)]
        GiveWeaponToPed(ped, GetHashKey(choice), 60, false, true)
        SetCurrentPedWeapon(ped, GetHashKey(choice), true)
        SetPedAccuracy(ped, math.random(40, 70))
    end
end

-- function to set blip for location
SetAlertBlip = function(loc, name)
    -- local variables
    local blip = nil
    -- set blip location
    blip = AddBlipForCoord(loc.x, loc.y, loc.z)
    SetBlipSprite(blip, 636 )
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 3)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Call: Wellness Check on ' ..name)
    EndTextCommandSetBlipName(blip)
end
