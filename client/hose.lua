RegisterNetEvent("rebel_firepanel:connect_hose", function()
    local player = PlayerPedId()

    local hose = CreateObject(`prop_fire_hose`, GetEntityCoords(player), true, false, false)
    AttachEntityToEntity(hose, player, GetPedBoneIndex(player, 57005), 0.25, 0.0, -0.05, 0.0, 0.0, 90.0, true, true, false, true, 1, true)

    local nozzle = CreateObject(`prop_fire_exting_1a`, GetEntityCoords(player), true, false, false)
    AttachEntityToEntity(nozzle, hose, 0, 0.0, 1.2, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

    -- Save entity references as needed
end)
