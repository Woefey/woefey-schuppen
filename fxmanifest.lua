fx_version 'cerulean'
game 'gta5'

author 'woefey#6889'
version '1.0.0'

file 'gen_w_am_schup.ytyp'

client_scripts {
    'client/**.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua'
}

server_script 'server/sv_main.lua'
shared_script 'config.lua'
