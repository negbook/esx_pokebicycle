fx_version 'adamant'

game 'gta5'

description 'ESX Basic Needs'

version '1.0.1'

server_scripts {
    'config.lua',
    'server/main.lua'
}

files { 
    "esx_pokebicycle_sounds/musics.awc",
	"esx_pokebicycle_sounds/dat/sound.dat54.rel",
    "esx_pokebicycle_sounds/dat/game.dat151.rel"
}


data_file "AUDIO_WAVEPACK" "esx_pokebicycle_sounds"
data_file "AUDIO_SOUNDDATA" "esx_pokebicycle_sounds/dat/sound.dat"
data_file "AUDIO_GAMEDATA" "esx_pokebicycle_sounds/dat/game.dat"

client_scripts {
    'config.lua',
    'client/main.lua'
}

dependencies {
    'es_extended'
}
