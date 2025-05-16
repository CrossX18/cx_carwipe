local clientCallbacks = vx.createCallbackProxy()

vx.addCommand('carwipe', {
    restricted = SharedConfig.restrictedGroups
}, function()
    clientCallbacks.carwipe(-1)
end)