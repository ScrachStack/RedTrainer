Red = {}

function Red.GetPlayerIdentifier(type, player)
    local id = GetNumPlayerIdentifiers(player)
    for count = 0, id do
        local identifier = GetPlayerIdentifier(player, count)
        if identifier and string.find(identifier, type) then
            return identifier
        end
    end
    return nil
end

local nextRequestId = 0 
local serverCallbacks = {}
local clientCallbacks = {}

local function generateRequestId()
    nextRequestId = nextRequestId + 1
    return nextRequestId
end

---@param eventName string
---@param callback function
Red.RegisterServerCallback = function(eventName, callback)
    serverCallbacks[eventName] = callback
end

---@param eventName string
---@param callback function
---@param ... any
Red.TriggerServerCallback = function(eventName, callback, ...)
    local requestId = generateRequestId()
    serverCallbacks[requestId] = callback

    TriggerServerEvent('Red:triggerServerCallback', eventName, requestId, GetInvokingResource() or "unknown", ...)
end

RegisterNetEvent('Red:serverCallback')
AddEventHandler('Red:serverCallback', function(requestId, invoker, ...)
    local callback = serverCallbacks[requestId]
    
    if not callback then
        return print(string.format('[Red ERROR] Server Callback with requestId %s was called by %s but does not exist.', requestId, invoker))
    end
    
    callback(...)
    serverCallbacks[requestId] = nil -- Remove completed request
end)

---@param eventName string
---@param callback function
Red.RegisterClientCallback = function(eventName, callback)
    clientCallbacks[eventName] = callback
end

RegisterNetEvent('Red:triggerClientCallback')
AddEventHandler('Red:triggerClientCallback', function(eventName, requestId, invoker, ...)
    local callback = clientCallbacks[eventName]

    if not callback then
        return print(string.format('[Red ERROR] Client Callback not registered, name: %s, invoker resource: %s', eventName, invoker))
    end

    callback(function(...)
        TriggerServerEvent('Red:clientCallback', requestId, invoker, ...)
    end, ...)
end)


exports('Core', function()
	return Red
end)
