
    RegisterNetEvent('scratch:kick')
    AddEventHandler('scratch:kick', function(select, reason)
        if IsPlayerAceAllowed(source, "RedTrainer.kick") then
        DropPlayer(select, reason)
        else 
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient permissions.")
        end
    end)
    

local bannedPlayers = {}
local function removeExpiredBans()
    local currentTime = os.time()
    for i, bannedInfo in ipairs(bannedPlayers) do
        if bannedInfo.expiry ~= "Never" and tonumber(bannedInfo.expiry) <= currentTime then
            table.remove(bannedPlayers, i)
            saveBannedPlayers()
        end
    end
end

local function loadBannedPlayers()
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./banned_players.json")
    if loadFile then
        bannedPlayers = json.decode(loadFile)
    end
end

local function saveBannedPlayers()
    SaveResourceFile(GetCurrentResourceName(), "banned_players.json", json.encode(bannedPlayers), -1)
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

RegisterNetEvent('scratch:ban')
AddEventHandler('scratch:ban', function(select, reason, expiry)
    if IsPlayerAceAllowed(source, "RedTrainer.ban") then
        local identifiers = ExtractIdentifiers(select)
        table.insert(bannedPlayers, {
            identifiers = identifiers,
            reason = reason,
            expiry = expiry
        })
        saveBannedPlayers()
        DropPlayer(select, reason)
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient permissions.")
    end
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local player = source
    local identifiers = ExtractIdentifiers(player)
    
    for _, bannedInfo in pairs(bannedPlayers) do
        for _, idType in pairs({"steam", "ip", "discord", "license", "xbl", "live"}) do
            if bannedInfo.identifiers[idType] == identifiers[idType] then
                setKickReason("You are banned for: " .. bannedInfo.reason)
                CancelEvent()
                return
            end
        end
    end
end)

loadBannedPlayers()

CreateThread(function()
    while true do
        Citizen.Wait(60000) 
        removeExpiredBans()
    end
end)
