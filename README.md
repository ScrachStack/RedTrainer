![image](https://github.com/Zaps6000/RedTrainer/assets/122732007/fea83d82-5059-4dd1-8ef1-c00069e950dd)
https://streamable.com/xos73m
# RedTrainer

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T01APGOO)


[![Discord](https://img.shields.io/badge/Discord-Support-5865F2?style=flat&logo=discord&logoColor=white)](https://discord.gg/Uwg95JfwYT) 

RedTrainer is a powerful Lua-based menu for RedM, designed to provide a feature-rich experience akin to vMenu in FiveM. With RedTrainer, you can enhance your gameplay, customize your RedM experience, and enjoy a wide range of in-game options and features. Whether you're a player looking to explore new possibilities or a developer seeking to expand its functionality, RedTrainer has you covered.

## Features

- **Player Options:** Access various player-related functions such as God Mode, Noclip, Super Jump, and more to enhance your character's abilities.

- **Vehicle Options:** Take control of vehicles with options like spawning vehicles, enabling vehicle god mode, and even repairing your trusty horse.

- **User-Friendly Menu:** RedTrainer offers an intuitive and user-friendly menu system that makes navigating and customizing your RedM experience a breeze.

## Contributing

RedTrainer is an open-source project and welcomes contributions from the community. If you have ideas for new features, bug fixes, or improvements, Fork than feel free to submit a pull request. Together, we can make RedTrainer even better.

## Support

For discussions, bug reports, or questions, join our community on [Discord](https://discord.gg/Uwg95JfwYT). We're here to assist you and provide the best RedM modding experience.

## Getting Started

To get started with RedTrainer, follow the installation instructions in the [Wiki](https://github.com/Zaps6000/RedTrainer/wiki). Once installed, you can access the menu in-game by using the provided command.

## License

RedTrainer is released under the terms of the [GNU General Public License](LICENSE.md). This open-source license grants you the freedom to use, modify, and distribute the software in accordance with the principles of free software. Please review the full text of the [GPL](LICENSE.md) for detailed information on your rights and responsibilities when using RedTrainer.

---

## Example for the Aces
```cfg
add_principal identifier.steam:YOURACE group.admin
add_ace group.admin RedTrainer.kick allow
add_ace group.admin RedTrainer.ban allow
```
### Developer Shit
```lua
local RedTrainer = exports["RedTrainer"]:Core() -- fetch the object 
```
using this you can use callbacks get player identifiers from the server side etc more feature soon
