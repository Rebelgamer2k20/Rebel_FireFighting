RegisterCommand("getoffset", function()
    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        local offset = GetOffsetFromEntityInWorldCoords(veh, 0.0, 0.0, 0.0)
        print(("[FIREPANEL] Offset: vector3(%s, %s, %s)"):format(offset.x, offset.y, offset.z))
    else
        print("[FIREPANEL] You're not in a vehicle.")
    end
end)
