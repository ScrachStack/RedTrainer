Config = {}

Config.Ace = 'redm'
Config.MenuCommand = 'menu'
Config.EnablePermissions = false
Config.UseCommand = false -- [true/false] 
Config.KeyBinding = 0xE31C6A41  -- [if UseCommand true then this wont work. Refer to the github controls.md https://github.com/Zaps6000/RedTrainer/blob/main/controls.md]

Config.ModularSetup = {
    {
            MaxHealthCore = true, -- Enable/Disable Max Health Core
            MaxStaminaCore = true, -- Enable/Disable Max Stamina Core
            GodMode = true, -- Enable/Disable God Mode
            ClearPedTasks = true, -- Enable/Disable Clear Ped Tasks
            Noclip = true, -- Enable/Disable Noclip
        ["giveweapon"] = { 
            enabled = true, -- Set to true to enable, false to disable
            WeaponsMenu = {
                {
                    label = "Revolver",
                    model = "weapon_revolver", -- Replace with the actual model name
                },
                {
                    label = "Bow",
                    model = "weapon_bow", -- Replace with the actual model name
                },
                {
                    label = "Lasso",
                    model = "weapon_lasso", -- Replace with the actual model name
                },
                {
                    label = "Molotov",
                    model = "WEAPON_THROWN_MOLOTOV", -- Replace with the actual model name
                },
                {
                    label = "Navy Revolver",
                    model = "WEAPON_REVOLVER_NAVY", -- Replace with the actual model name
                },
                {
                    label = "Improved",
                    model = "WEAPON_BOW_IMPROVED", -- Replace with the actual model name
                },
                {
                    label = "Bolas",
                    model = "WEAPON_THROWN_BOLAS", -- Replace with the actual model name
                },
        },
    },
    },
}

