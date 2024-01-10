--[=====[ 
CREATED BY ZAPS6000 | https://discord.gg/cfxdev ANYONE ELSE SELLING A MODIFIED OR 'UPDATED' script IS BREAKING https://github.com/Zaps6000/RedTrainer/blob/main/LICENSE this project is free and will always be.  
NEED SUPPORT! 
JOIN https://discord.gg/cfxdev 

config.lua to edit
config.lua to edit
config.lua to edit



DONT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOUR DOING
DONT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOUR DOING
DONT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOUR DOING
DONT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOUR DOING
--]=====]

LocalPlayer.state.godmode =

lib.registerMenu({
    id = 'zaps-rd-player',
    title = 'Player Options',
    position = 'top-right',
    onCheck = function(selected, checked, args)
        if args.id == 'god' then
          godemode()
        elseif args.id == 'noclip' then 
            
        end
      end,
    options = {
       
        {label = 'Max Health Core', args = {id = 'max-health'}},
        {label = 'Max Stamina Core', args = {id = 'max-satmina'}},
        {label = 'God Mode', checked = false, args = {id = 'god'}},
        {label = 'Clear Ped Tasks', args = {id = 'clear-ped-task'}},
        {label = 'Hogtie Yourself',  args = {id = 'hog-tie'}},
        {label = 'Clean Ped', args = {id = 'clean-ped'}},
        {label = 'Noclip', checked = false,  args = {id = 'noclip'}},

    }

        
}, function(selected, scrollIndex, args)
   
    if args.id == 'max-health' then 
        maxhealthcore()
    elseif args.id == 'clear-ped-task' then 
        clearpedtask()
    elseif args.id == 'hog-tie' then 
hottieyourself()
elseif args.id == 'clean-ped' then 
    cleanped()
elseif args.id == 'max-satmina' then 
    maxhealthcore()

--
    end
end)




local weaponOptions = Config.ModularSetup[1]["giveweapon"].WeaponsMenu

local menuOptions = {
    {label = 'Spawn Weapon By Model', icon = 'gun', args = {id = 'spawn_model'}},
    {label = 'Remove All Weapons', icon = 'gun', args = {id = 'remove_all'}},
}

for _, weaponInfo in ipairs(weaponOptions) do
    table.insert(menuOptions, {label = weaponInfo.label, icon = 'gun', args = {id = weaponInfo.label, model = weaponInfo.model}})
end


lib.registerMenu({
    id = 'zaps-rd-weapon',
    title = 'Weapon Options',
    position = 'top-right',
    options = menuOptions
}, function(selected, scrollIndex, args)
    if args.id == 'spawn_model' then
        local input = lib.inputDialog('Weapon Module', {'Weapon Name', 'Ammo'})

        if not input then return end

        local weaponModel = input[1]
        giveWeapon(weaponModel)
    elseif args.id == 'remove_all' then
        RemoveAllPedWeapons(cache.ped, true, true)
    else
        giveWeapon(args.model)
    end
end)

lib.registerMenu({
    id = 'zaps-rd-server',
    title = 'Server Options',
    position = 'top-right',
    options = {
        {label = 'Copy Coords', icon = 'clipboard', args = {id = 'copy-coords'}},
        {label = 'ShowEntityModels', checked = false, icon = 'network-wired',  args = {id = 'ShowEntityModels'}},
        {label = 'Teleport To Waypoint',  icon = 'hat-wizard',  args = {id = 'teleportToWaypoint'}},
    }

        
}, function(selected, scrollIndex, args)
    if args.id == 'disconnect' then 
        Disconnect()
    elseif args.id == 'copy-coords' then 
        clipboard()
    elseif args.id == 'teleportToWaypoint' then 
        if  IsWaypointActive() then
        waypoint = GetWaypointCoords()
        tpcoords(vec3(waypoint.x, waypoint.y, 0))
        lib.notify({
            title = 'RedM Trainer',
            description = 'Going Across the oregon trail ...',
            type = 'success'
        })
    else 
        lib.notify({
            title = 'RedM Trainer',
            description = 'No Waypoint Set.',
            type = 'error'
        })
    end
    end
end)



lib.registerMenu({
    id = 'zaps-rd-vehicle',
    title = 'Vehicle Options',
    position = 'top-right',
    options = {
        {label = 'Spawn Vehicle', icon = 'ship', args = {id = 'spawn-veh'}},
        {label = 'Repair Vehicle', icon = 'hammer', args = {id = 'repair-veh'}},
        {label = 'Boost Vehicle', icon = 'jet-fighter', args = {id = 'boost-veh'}},
        {label = 'Vehicle Spawner', icon = 'horse-head', args = {id = 'car-veh'}},


    }

        
}, function(selected, scrollIndex, args)
    if args.id == 'repair-veh' then 
        repair()
    elseif args.id == 'spawn-veh' then
        local fucku = lib.inputDialog('Vehicle Module', {'Any Vehicle horse or coach etc'})
 
        if not fucku then return end
        HORSEORFANCYCOACHORNICEBOAT(fucku[1])
    elseif args.id == 'boost-veh' then 
        boostlittlehorsee()
    end
end)





lib.registerMenu({
    id = 'zaps-rd-main',
    title = 'Main Menu',
    position = 'top-right',
    options = {
        {label = 'Player List', icon = 'globe', args = {id = 'zaps-rd-onlineplayers'}},

        {label = 'Player Options', icon = 'hat-cowboy', args = {id = 'openselfoptions'}},
        {label = 'Vehicle Options', icon = 'horse', args = {id = 'zaps-rd-vehicle'}},
        {label = 'Weapon Options', icon = 'gun', args = {id = 'zaps-rd-weapon'}},
        {label = 'Server Options', icon = 'server', args = {id = 'zaps-rd-server'}},
        {label = 'Oufit Customization', icon = 'shirt', args = {id = 'zaps-rd-customization'}},

    }
}, function(selected, scrollIndex, args)
      if args.id == 'd' then
        godemode()
        elseif args.id == 'openselfoptions' then
            lib.showMenu('zaps-rd-player')
        elseif args.id == 'zaps-rd-server' then
            lib.showMenu('zaps-rd-server')
        elseif args.id == 'zaps-rd-vehicle' then
            lib.showMenu('zaps-rd-vehicle')
        elseif args.id == 'zaps-rd-weapon' then
            lib.showMenu('zaps-rd-weapon')
        elseif args.id == 'zaps-rd-customization' then
            lib.showMenu('zaps-rd-customization')
        elseif args.id == 'zaps-rd-onlineplayers' then
            lib.showMenu('zaps-rd-onlineplayers')

        end
end)

if Config.UseCommand then 
RegisterCommand(Config.MenuCommand, function() -- Main Menu
    lib.showMenu('zaps-rd-main')
end)
else 
 CreateThread(function()
    while true do
        Citizen.Wait(10)

    if IsKeyBeingPressed(Config.KeyBinding) then
    lib.showMenu('zaps-rd-main')
    end
end
 end)
end

function IsKeyBeingPressed(key)
    return IsControlJustPressed(0, key)
end



function godemode()
    LocalPlayer.state.godmode = not LocalPlayer.state.godmode
    if LocalPlayer.state.godmode then
        lib.notify({
            title = 'RedM | Trainer',
            description = 'God Mode enabled',
            type = 'success'
        })
        SetEntityInvincible(cache.ped, true)
    else
        lib.notify({
            title = 'RedM | Trainer',
            description = 'God Mode disabled',
            type = 'error'
        })
        SetEntityInvincible(cache.ped, false)
    end
end



function maxhealthcore()
    SetEntityHealth(cache.ped or PlayerPedId(), GetEntityMaxHealth(cache.ped or PlayerPedId()))
    ClearPedBloodDamage(cache.ped or PlayerPedId())
    RestorePlayerStamina(PlayerId(), 100.0)
    Citizen.InvokeNative(0xC6258F41D86676E0, cache.ped or PlayerPedId(), 0, 100) -- SetAttributeCoreValue
    Citizen.InvokeNative(0xC6258F41D86676E0, cache.ped or PlayerPedId(), 1, 100) 
    Citizen.InvokeNative(0xC6258F41D86676E0, cache.ped or PlayerPedId(), 2, 100) 

  end



local isSuperJumping = false 

function superjump()
    isSuperJumping = not isSuperJumping

    CreateThread(function()
        while isSuperJumping do
            SetPedMoveRateOverride( cache.ped or PlayerPedId(), 1.15)
            SetSuperJumpThisFrame(PlayerId())
            Wait(0)
        end
        ResetPedMoveRateOverride(cache.ped or PlayerPedId())
    end)
end 



function tpcoords(coords)
    if type(coords) ~= 'vector3' then
        return print("^1Invalid coords")
    end
    local x = coords[1]
    local y = coords[2]
    local z = coords[3]
    local ped = cache.ped or PlayerPedId()

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(0) end

  
        lastTpCoords = GetEntityCoords(ped)
        handleTpNormally(x, y, z)
   

    DoScreenFadeIn(500)
end


function repair()
    local ped = cache.ped or PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh and veh > 0 then
        SetVehicleUndriveable(veh, false)
        SetVehicleFixed(veh)
        SetVehicleEngineOn(veh, true, false)
        SetVehicleDirtLevel(veh, 0.0)
        SetVehicleOnGroundProperly(veh)
    end
    if (veh == 0) and not IsPedOnMount(ped) then
      

    local horse = GetMount(ped)
        ResurrectPed(horse)
        SetEntityHealth(horse, GetEntityMaxHealth(horse))
        print()
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 0, 100) -- SetAttributeCoreValue
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 1, 100) -- SetAttributeCoreValue
        Citizen.InvokeNative(0xC6258F41D86676E0, horse, 2, 100) -- SetAttributeCoreValue
    end
    end

function clearpedtask()
    ClearPedTasksImmediately(cache.ped or PlayerPedId())
end 

function giveWeapon(weaponModel)
    local playerPed = cache.ped or PlayerPedId() 
    
    if playerPed ~= -1 then
        local weaponHash = joaat(weaponModel) 

        if weaponHash == 0 then 
            lib.notify({
                title = 'RedM | Trainer',
                description = 'Invalid Weapon',
                type = 'error'
            })
        else
            Citizen.InvokeNative(0x5E3BDDBCB83F3D84,  playerPed,  weaponHash,  999, true,  false, 0,  false,  0,  0, 0, false, 0.0, false) -- GiveWeaponToPed
            
            lib.notify({
                title = 'RedM | Trainer',
                description = "You received a " .. weaponModel,
                type = 'info'
            })
        end
    end
end


function clipboard()
    local ped = cache.ped or PlayerPedId()
    local curCoords = GetEntityCoords(ped)
    local currHeading = GetEntityHeading(ped)
    local stringCoords = ('%.4f, %.4f, %.4f, %.4f'):format(curCoords.x, curCoords.y, curCoords.z, currHeading)
    lib.setClipboard(stringCoords)
    lib.notify({
        title = 'RedM | Trainer',
        description = 'Coords have been copy.',
        type = 'success'
    })
    
end


function hottieyourself()
    Citizen.InvokeNative(0x42AC6401ABB8C7E5, cache.ped or PlayerPedId(), false, false)
end


function cleanped()
    ClearPedEnvDirt(PlayerPedId());
end

function HORSEORFANCYCOACHORNICEBOAT(model)
    if type(model) ~= 'string' then return end

    local modelHash = GetHashKey(model)
    local isVehicle = IsModelAVehicle(model)
    local isHorse = Citizen.InvokeNative(0x772A1969F649E902, modelHash) --IsThisModelAHorse
    if not isVehicle and not isHorse then
         
        lib.notify({
            title = 'RedM Trainer',
            description = 'not vehicle or horse or cannoe: Attempted to spawn: ' .. model,
            type = 'error'
        })
        return
    end

    local playerPed = cache.ped or PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local currentVeh = GetVehiclePedIsIn(playerPed, false)
    if IsPedOnMount(playerPed) then
        currentVeh = GetMount(playerPed)
    end
    local currentVehVelocity
    if currentVeh then
        currentVehVelocity = GetEntityVelocity(currentVeh)
        DeleteEntity(currentVeh)
    end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(15)
    end

    local newVeh
    if isVehicle then
        newVeh = CreateVehicle(modelHash, playerCoords, playerHeading, true, false, false)
        SetPedIntoVehicle(playerPed, newVeh, -1)
        SetVehicleOnGroundProperly(newVeh)
    else
        newVeh = CreatePed(modelHash, playerCoords, playerHeading, true, false)
        Citizen.InvokeNative(0x283978A15512B2FE, newVeh, true) --SetRandomOutfitVariation
        Citizen.InvokeNative(0x028F76B6E78246EB, playerPed, newVeh, -1) --SetPedOntoMount
    end

    if currentVehVelocity then
        SetEntityVelocity(newVeh, currentVehVelocity)
    end
    SetModelAsNoLongerNeeded(modelHash)
end

 function boostlittlehorsee()
    local ped = cache.ped or PlayerPedId()
    local horse = IsPedOnMount(ped) and GetMount(ped) or false
    if not horse then
        return 
    end

    local CoreOverpowered = Citizen.InvokeNative(0x200373A8DF081F22, horse, 0) -- IsAttributeCoreOverpowered
    if CoreOverpowered then
        return 
    end

    local duration = 4000.0
    -- Inner/Outter Health
    Citizen.InvokeNative(0x4AF5A4C7B9157D14, horse, 0, duration, true) --EnableAttributeCoreOverpower
    Citizen.InvokeNative(0xF6A7C08DF2E28B28, horse, 0, duration, true) --EnableAttributeOverpower
    -- Inner/Outter Stamina
    Citizen.InvokeNative(0x4AF5A4C7B9157D14, horse, 1, duration, true) --EnableAttributeCoreOverpower
    Citizen.InvokeNative(0xF6A7C08DF2E28B28, horse, 1, duration, true) --EnableAttributeOverpower
end



 function handleTpNormally(x, y, z)
    local ped = cache.ped or PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local horse
        if IsPedOnMount(ped) then
            horse = GetMount(ped)
            SetEntityCoords(horse, x, y, 100.0, false, false, false, false)
            FreezeEntityPosition(horse, true)
        end
        SetEntityCoords(ped, x, y, 100.0, false, false, false, false)
    end


