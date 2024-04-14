# CheckPetWQs
World of Warcraft add-on for helping with Family Familiar achievement and related tracking.
https://www.curseforge.com/wow/addons/checkpetwqs

As of 2024-04, I am not planning to re-sub for a while and therefore can no longer maintain this add-on.

## CurseForge description
Mainly designed to help with Family Familiar, but also has a few other helpful features. Intended to provide motivation to do pet battle world quests by displaying chat messages and a progress window when necessary. Only supports English game clients.

Use /ff to force the progress window to appear and reshow the tracked rewards in the chat box.

* 10.1: 'Battle in Zaralek Cavern' and 'Family Battler of Zaralek Cavern' achievement checks, can now show less checks in the /ff popup (configure in options).
* 10.0: 'Battle on the Dragon Isles' and 'Family Battler on the Dragon Isles' achievement checks.
* 9.0: 'Battle in the Shadowlands' and 'Family Exorcist' achievements and Shadowlands zones quest reward checking, changed the character level check to be 45.
* 8.2: World quest reward checks include zones Mechagon Island and Nazjatar.
* 8.1: Family Battler achievement tracking. Since Family Battler tamers are always available there is only a chat box notification if the achievement is not yet completed. Your team is also checked for all pets being level 25.
* 8.0: 'Battle on Zandalar and Kul Tiras' achievement and new zone quest reward checking.
* 7.3: Family Fighter achievement tracking. Since Family Fighter battles are always available there are no automatic notifications.

Options panel in Interface/AddOns to tweak some of the notification behaviour if you want it more quiet, such as ignoring Legion zones if you just want to check Battle for Azeroth zones.

Notifies you about pet battle world quests when:
* One required for 'Battle on the Broken Isles', 'Battle on Zandalar and Kul Tiras, 'Battle in the Shadowlands' or 'Battle on the Dragon Isles' is up that you haven't done yet.
* A Family Familiar tamer is up that you need.
* No Family Familiar tamers are up.
* Your current team type has already been done for the targeted tamer for Family Familiar/Fighter/Battler/Exorcist/Battler (again) tamers.
* Your current team isn't a single type for a targeted tamer.
* Quest rewards that are interesting (i.e. not order resources, bandages, or Azerite) are up.

The addon will trigger checks:
* Automatically the first time there's a map update (either by opening your map or moving your character to another subzone) and the character is at least 45.
* Manually with either: /ff or /checkpetwqs

If there are Family Familiar tamers up and available a window will appear that describes their location, all the battle pet types (greying out the ones you've done or no longer need to do) for the achievement, and current totals of your progress.
