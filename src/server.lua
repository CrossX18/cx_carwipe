vx.addCommand("carwipe", {
    restricted = SharedConfig.restrictedGroups,
    help = "Wipe all vehicles"
}, function()
    vx.triggerClientEvent("cx_carwipe", -1)
end)
