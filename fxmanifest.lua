fx_version 'bodacious'
game 'gta5'

author "Lucifer#3333"
description "grab it at my github! https://github.com/5mLucifer"
warning "Veny Development is just way too Overpowered"

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'client/*.lua',
}

shared_scripts {
    "configs/config.lua"
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'server/*.lua',
}

dependencies {
    'memorygame',
    "es_extended"
}

