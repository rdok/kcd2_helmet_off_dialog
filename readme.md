[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
# Helmet-Off Dialog (Beta)  


[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
[![Nexus Mods KCD1](https://img.shields.io/badge/Nexus%20Mods-KCD1-bf4848?style=flat-square&logo=nexusmods)](https://www.nexusmods.com/kingdomcomedeliverance/mods/1909) [![Nexus Mods KCD2](https://img.shields.io/badge/Nexus%20Mods-KCD2-bf4848?style=flat-square&logo=nexusmods)](https://www.nexusmods.com/kingdomcomedeliverance2/mods/1023) [![Steam Workshop](https://img.shields.io/badge/Steam%20Workshop-1b2838?style=flat-square&logo=steam)](https://steamcommunity.com/sharedfiles/filedetails/?id=3443915670) [![GitHub](https://img.shields.io/badge/GitHub-Open%20Source-2ea44f?style=flat-square&logo=github)](https://github.com/rdok/kcd2_helmet_off_dialog) [![Test Coverage](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/rdok/c8127f736b3cb0097c7094efe1882299/raw/kcd2_helmet_off_dialog_badges.json?label=Coverage&logo=codecov)](https://github.com/rdok/kcd2_helmet_off_dialog/actions/runs/14145054417)

[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
This mod automatically takes off your helmet, head chainmail (KCD 1) and coif when starting a conversation with an NPC, then puts them back on when the dialog ends.  


[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
## KCD 2 Showcase

[![Showcase](https://github.com/rdok/kcd2_helmet_off_dialog/blob/main/documentation/kcd2_showcase.gif?raw=true)](https://www.nexusmods.com/kingdomcomedeliverance2/mods/831)

## KCD 1 Showcase

[![Showcase](https://github.com/rdok/kcd2_helmet_off_dialog/blob/main/documentation/kcd1_showcase.gif?raw=true)](https://www.nexusmods.com/kingdomcomedeliverance2/mods/831)

[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
## Mod Overview
- **Main Version (Required):** Takes off the helmet, head chainmail (KCD 1), and coif at the start of every dialogue and puts them back on when the conversation ends.
  - Install this base mod to enable the core takeoff functionality.
- **Optional Mods:** Enhance the main version with additional takeoff features, which can be loaded on demand. Install any combination of the following optional mods *after* the main version to ensure proper loading (otherwise, you’ll need to manually adjust your `mod_order.txt`):
  - **Helmet-Only:** Takes off only the helmet at the start of every dialogue and puts it back on when the conversation ends, leaving head chainmail (KCD 1) and coif unchanged.
  - **Random:** Takes off the helmet, head chainmail (KCD 1), and coif in random dialogues (e.g., gear might come off in one conversation but stay on in the next).
    - *Player Note:* This reflects my reason for creating this mod—half because I expect I’ll tire of seeing Henry’s face, and half because the helmets are cool to look at, especially when switching between them.
  - **Ranged:** Takes off ranged weapons at the start of dialogues and puts them back on when the conversation ends (requires the main version for gear context).

***

## Coverage

> If you identify any head armour not listed below, please provide their full names as they appear in-game.

- Helmets: `kettle`, `bascinet`, `helmet`, `skullcap`
- Head Chainmail (for KCD 1): `coifmail`, `nm_ca_collar`, `nm_ca_hood`
- Coifs: coif, `coif`, `g_hood_`
- Ranged weapons: `bow_`, `crossbow`


## Caveats

- **Charisma Impact**: Taking off the helmet or coif during dialogue will probably lower charisma, as these items contribute to that stat. I don’t plan to address this, as high charisma is achievable without them, and it’s an acceptable trade-off for the mod’s functionality.
- **Not All Helmets**: I play slowly (still on the first KCD 2 map after a restart), so I haven’t tested every helmet yet. That said, this mod should work with at least 90% of helmets—like kettles and bascinets. If you find one that doesn’t work, please let me know, so I can address it.
- **Non-Helmet Items**: Head armour like hats remains unaffected by this mod.
- **Hack: IsEquipped**: Neither KCD 2 nor KCD 1 provides a Lua API function to retrieve equipped slot items. To address this, the mod uses a hack. It iterates through all helmets and coifs in the player's inventory, taking them off. If the player's equipped weight changes, the mod identifies that item as the one equipped.


[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
