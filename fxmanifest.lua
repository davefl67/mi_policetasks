-- FX Information
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

-- Resource Information
name 'policetasks'
author 'MI_Agimir'
description 'demo for police tasks'

-- Manifest
shared_scripts {
	'@ox_lib/init.lua',
	'shared/config.lua'
}

client_scripts {
    'client/aspects/*.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/events.lua',
    'server/main.lua'
}

files {
    'web/peds/*.png'
}

dependencies {
    'ox_lib',
    'ox_target'
}