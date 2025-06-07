RegisterCommand("toggleautofires", function()
    for aop, locations in pairs(Config.AOPFireLocations) do
        for _, pos in ipairs(locations) do
            StartScriptFire(pos.x, pos.y, pos.z, 25, true)
            TriggerServerEvent("rebel_firepanel:notify_fire_services", pos)
        end
    end
end)
