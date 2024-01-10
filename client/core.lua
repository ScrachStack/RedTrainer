Red = {}

Red.P = cache.ped
Red.ServerIP = GetCurrentServerEndpoint()
Red.Server = TriggerServerEvent
Red.Even = TriggerEvent 
Red.id = PlayerId()
Red.C = RegisterCommand

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


if Config.ModularSetup.EnableMiniMapRevealed then
for i = 0, 25 do
    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, i)  -- REVEAL_MINIMAP_SEGMENT
end
end
if Config.ModularSetup.EnablePVP then
    NetworkSetFriendlyFireOption(true)
end

-- @param title (string) - The title of the notification. Defaults to 'RedTrainer' if not provided.
-- @param desc (string) - The description of the notification. Defaults to 'Notification' if not provided.
-- @param type (string) - The type of the notification. Defaults to 'info' if not provided or if it's not a valid type.
Red.Notify = function(title, desc, type)
    title = title or 'RedTrainer'
    desc = desc or 'Default Notification'
    
    local validTypes = { 'success', 'info','error' }
    type = (type and validTypes[type]) and type or 'info'

    lib.notify({
        title = title,
        description = desc,
        type = type
    })
end
-- EXAMPLE!! Red.Notify("RedTrainer | I CHEAT", "TEST", 'info')

exports('Core', function()
	return Red
end)
