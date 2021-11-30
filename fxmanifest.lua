fx_version 'bodacious'
game 'gta5'

author "Lucifer#3333"
description "grab it at my github! https://github.com/5mLucifer"

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'client/*.lua',
    'configs/*.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'server/*.lua',
    'configs/*.lua'
}

dependencies {
    'memorygame',
    "es_extended"
}

