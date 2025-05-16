vx.registerNetEvent("cx_carwipe", function()
    vx.notify({
        title = "Info!",
        message = "Er is een carwipe gestart! Stap binnen 60 seconden in je voertuig!",
        type = "info"
    })
    local count = 0
    Citizen.SetTimeout(SharedConfig.carwipeDelay, function()
        for vehicle in EnumerateVehicles() do
            if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                DeleteEntity(vehicle)
                count = count + 1
            end
        end
        vx.notify({
            title = "Succes!",
            message = string.format("Er zijn %s voertuigen verwijderd!", count),
            type = "success"
        })
    end)
end)

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end

        local enum = { handle = iter, destructor = disposeFunc }
        setmetatable(enum, entityEnumerator)

        repeat
            coroutine.yield(id)
            local next, newId = moveFunc(iter)
            id = newId
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
