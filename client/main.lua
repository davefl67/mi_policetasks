-- wellness check
RegisterCommand('poltask', function()
    TriggerEvent('mipl:idletask:inform')
end, false)