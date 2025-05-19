vx.addCommand("carwipe", {
    restricted = SharedConfig.commandGroups,
    help = "Wipe all vehicles"
}, function()
    clientEventBridge.carwipe(-1)
end)
