fx_version 'cerulean'
game 'gta5'

author 'Rebel Modifications'
description 'Realistic Fire Fighting Script'
version '1.0.0'

shared_script 'shared/config.lua'
client_scripts {
    'client/main.lua',
    'client/hose.lua',
    'client/pump_panel.lua',
    'client/offset_helper.lua',
    'client/blips.lua'
}
server_script 'server/main.lua'

ui_page 'html/panel.html'
files {
    'html/panel.html',
    'html/panel.css',
    'html/panel.js'
}

data_file 'VEHICLE_LAYOUTS_FILE' 'vehicle_configs/vehiclelayouts.meta'

lua54 'yes'

dependency 'ox_lib'
