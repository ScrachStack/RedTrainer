games { 'rdr3' }
lua54 'yes'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
version '2.0'
client_scripts {
'client/*'
}

server_scripts {
'server/*'
}

shared_scripts {
      '@ox_lib/init.lua',
  'config.lua'
}
