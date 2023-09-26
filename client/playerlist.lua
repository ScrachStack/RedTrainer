local players = {}
local playerList = GetActivePlayers()

for _, playerId in ipairs(playerList) do
    local playerName = GetPlayerName(playerId)
    table.insert(players, {
        label = playerName,
        value = playerId,
        icon = 'person',
        args = {id = GetPlayerServerId(playerId)}
    })
    
end
lib.registerMenu({
    id = 'zaps-rd-onlineplayers',
    title = 'Online Players',
    position = 'top-right',
    options = players
}, function(selected, scrollIndex, args)

 lib.showMenu('zaps-rd-onlineplayers-options')     
end)
    lib.registerMenu({
      id = 'zaps-rd-onlineplayers-options',
      title = 'Online Player Options',
      position = 'top-right',
      options = {
          {label = 'Kick Player', icon = 'k', args = {id = 'kick'}},
          {label = 'Ban Player', icon = 'ban', args = {id = 'openselfoptions'}},
          {label = 'Send Private Message', icon = 'message', args = {id = 'dm'}},
          {label = 'Teleport To Player', icon = 'wand-magic', args = {id = 'tp'}},

      }
    }, function(selected, scrollIndex, args)
      if args.id == 'dm' then
          privatemessage()
      elseif args.id == 'kick' then 
-- Might add ban also ???

    end
    end)
  

function  privatemessage(messagecontents)
    local input = lib.inputDialog('Private Message', {'Message'})

    if not input then return end
    input[1]   = messagecontents
-- Needs Finished

end

