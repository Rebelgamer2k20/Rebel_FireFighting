RegisterCommand("toggleautofires", function()
    for aop, locations in pairs(Config.AOPFireLocations) do
        for _, pos in ipairs(locations) do
            StartScriptFire(pos.x, pos.y, pos.z, 25, true)
            TriggerServerEvent("rebel_firepanel:notify_fire_services", pos)
        end
    end
end)
RegisterNetEvent("rebel_firepanel:notify_fire_services", function(coords)
    -- Send to fire blip
    TriggerClientEvent('rebel_firepanel:create_fire_blip', -1, coords)

    -- CodeM MDT integration (example)
    exports['codem-mdt']:CreateCall({
        call_type = "Fire",
        description = "Structure fire reported",
        location = coords,
    })

    -- Inferno pager + station alert
    TriggerEvent("FirePager:Page", {
        type = "FIRE",
        coords = coords,
        title = "🔥 Structure Fire",
        message = "Active fire call reported. Respond immediately!"
    })

    TriggerEvent("StationAlerts:TriggerAlert", {
        station = "fire",
        coords = coords,
        title = "Structure Fire",
    })
end)
