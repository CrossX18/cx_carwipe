local clientCallbacks = vx.createCallbackProxy()

vx.addCommand("carwipe", {
    restricted = SharedConfig.restrictedGroups,
    help = "Wipe all vehicles"
}, function()
    clientCallbacks.carwipe(-1)
end)