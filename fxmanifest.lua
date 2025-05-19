fx_version "cerulean"
game "gta5"
lua54 "yes"

author "CrossX"

shared_scripts {
    "config.shared.lua",
    "@vx_lib/init.lua",
    'src/shared.lua'
}

server_scripts {
    "src/server.lua"
}

client_scripts {
    "src/client.lua"
}
