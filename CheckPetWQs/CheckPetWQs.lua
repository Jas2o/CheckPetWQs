local addon_name, addon = ...

LibStub("AceAddon-3.0"):NewAddon(addon, addon_name)

local colReset = "|r"
local colGrey = "|cff999999"
local colWhite = "|cffffffff"
local colPink = "|cffFF69B4" --General
local colGreen = "|cff1eff00" --Legion: Broken Isles
local colPurple = "|cffb048f8" --Legion: Argus
local colRed = "|cffC41E3A" --BfA: Zandalar (Horde/DK)
local colBlue = "|cff0080ff" --BfA: Kul Tiras (Alliance)
local colYellow = "|cfffac808" --BfA: Nazjatar and Mechagon (Azerite)
--local colRed = "|cffff0000" Full red
local colOrange = "|cffff7c0a" --Shadowlands (Druid)
local colDragonflight1 = "|cff33937F" --Evoker
local colDragonflight2 = "|cffe3ca84" --Artifact

local typeID = {
	[1] = "Humanoid",
	[2] = "Dragonkin",
	[3] = "Flying",
	[4] = "Undead",
	[5] = "Critter",
	[6] = "Magic",
	[7] = "Elemental",
	[8] = "Beast",
	[9] = "Aquatic",
	[10] = "Mechanical"
}

-- Battle on the Broken Isles
local ach70LegionWQs = 10876
local ach70LegionWQsCriteria = {
	[1] = 42063, -- Size Doesn't Matter
	[2] = 42165, -- Azsuna Specimens
	[3] = 42146, -- Dazed and Confused and Adorable
	[4] = 42159, -- Training with the Nightwatchers
	[5] = 42148, -- The Wine's Gone Bad
	[6] = 42154, -- Help a Whelp
	[7] = 42442, -- Fight Night: Amalia
	[8] = 40299, -- Fight Night: Bodhi Sunwayver
	[9] = 41881, -- Fight Night: Heliosus
	[10] = 40298, -- Fight Night: Sir Galveston
	[11] = 41886, -- Fight Night: Rats!
	[12] = 42062, -- Fight Night: Stitches Jr. Jr.
	[13] = 40277, -- Fight Night: Tiffany Nelson
	[14] = 40280, -- Training with Bredda
	[15] = 40282, -- Tiny Poacher, Tiny Animals
	[16] = 41766, -- Wildlife Protection Force
	[17] = 42064, -- It's Illid... Wait.
	[18] = 41687, -- Snail Fight!
	[19] = 41624, -- Rocko Needs a Shave
	[20] = 42067, -- All Howl, No Bite
	[21] = 41944, -- Jarrun's Ladder
	[22] = 41958, -- Oh, Ominitron
	[23] = 40278, -- My Beast's Bidding
	[24] = 41948, -- All Pets Go to Heaven
	[25] = 41935, -- Beasts of Burden
	[26] = 41895, -- The Master of Pets
	[27] = 41914, -- Clear the Catacombs
	[28] = 41990, -- Chopped
	[29] = 40337, -- Flummoxed
	[30] = 42015, -- Threads of Fate
	[31] = 41931, -- Mana Tap
	[32] = 40279, -- Training with Durian
	[33] = 41862, -- Only Pets Can Prevent Forest Fires
	[34] = 41861, -- Meet The Maw
	[35] = 41855, -- Stand Up to Bullies
	[36] = 42190, -- Wildlife Conservationist
	[37] = 41860 -- Dealing with Satyrs
}

-- Family Familiar
local ach70FamilyMetaID = 9696
local ach70FamilyIDtoName = {
	[9686] = {"Aquatic Acquiescence", "Aquatic"},
	[9687] = {"Best of the Beasts", "Beast"},
	[9688] = {"Mousing Around", "Critter"},
	[9689] = {"Dragons!", "Dragonkin"},
	[9690] = {"Ragnaros, Watch and Learn", "Elemental"},
	[9691] = {"Flock Together", "Flying"},
	[9692] = {"Murlocs, Harpies, and Wolvar, Oh My!", "Humanoid"},
	[9693] = {"Master of Magic", "Magic"},
	[9694] = {"Roboteer", "Mechanical"},
	[9695] = {"The Lil' Necromancer", "Undead"}
}
local ach70FamilyIDorder = {
	[1] = { --Pet Journal
		[1] = 9692, [2] = 9689, [3] = 9691, [4] = 9695, [5] = 9688, [6] = 9693, [7] = 9690, [8] = 9687, [9] = 9686, [10] = 9694
	},
	[2] = { --Alphabetical
		[1] = 9686, [2] = 9687, [3] = 9688, [4] = 9689, [5] = 9690, [6] = 9691, [7] = 9692, [8] = 9693, [9] = 9694, [10] = 9695
	}
}

local quest70Family = {
	[42159] = "Nightwatcher Merayl",
	[42442] = "Amalia",
	[40299] = "Bodhi Sunwayver",
	[40298] = "Sir Galveston",
	[40277] = "Tiffany Nelson",
	[40280] = "Bredda Tenderhide",
	[40282] = "Grixis Tinypop",
	[41687] = "Odrogg",
	[41944] = "Trapper Jarrun",
	[40278] = "Robert Craig",
	[41895] = "Aulier",
	[41990] = "Varenne",
	[40337] = "Master Tamer Flummox",
	[40279] = "Durian Strongfruit",
	[41860] = "Xorvasc"
}

local quest72Extra = {
	[46111] = "Sissix",
	[46112] = "Madam Viciosa",
	[46113] = "Nameless Mystic"
}

-- https://wow.gamepedia.com/UiMapID
local zones70Legion = { -- 7.0 Legion
	[625] = "Dalaran",
	[627] = "Dalaran",
	[630] = "Azsuna",
	[641] = "Val'sharah",
	[650] = "Highmountain",
	[634] = "Stormheim",
	[680] = "Suramar",
	--[1187] = "Azsuna", --Not sure why there's double
	--[1188] = "Val'sharah",
	--[1189] = "Highmountain",
	--[1190] = "Stormheim",
	--[1191] = "Suramar"
}
local zones72Legion = {
	[646] = "Broken Shore",
	[1192] = "Broken Shore"
}
local zones73Legion = { -- 7.3 Argus
	[830] = "Krokuun",
	[882] = "Eredath", --Previously called Mac'Aree
	[885] = "Antoran Wastes"
}
local zones80BattleZan = { -- 8.0 Battle for Azeroth
	[862] = "Zuldazar",
	[863] = "Nazmir",
	[864] = "Vol'dun",
	--[1193] = "Zuldazar", --Not sure why there's double
	--[1194] = "Nazmir",
	--[1195] = "Vol'dun",
}
local zones80BattleKul = { -- 8.0 Battle for Azeroth
	[895] = "Tiragarde Sound",
	[896] = "Drustvar",
	[942] = "Stormsong Valley",
	--[1196] = "Tiragarde Sound", --Not sure why there's double
	--[1197] = "Drustvar",
	--[1198] = "Stormsong Valley"
}
local zones82Battle = { -- 8.2 Rise of Azshara 
	[1462] = "Mechagon Island",
	[1355] = "Nazjatar"
	--[1504] = "Nazjatar" --Continent
}
local zones90Shadow = { -- 9.0 Shadowlands
	[1533] = "Bastion",
	[1536] = "Maldraxxus",
	[1565] = "Ardenweald",
	[1525] = "Revendreth",
	--[1543] = "The Maw",
	--[1961] = "Korthia",
	--[1570] = "Oribos",
	--[1970] = "Zereth Mortis"
}

local zones100Dragon = { -- 10.0 Dragonflight
	[2024] = "The Azure Span",
	[2025] = "Thaldraszus",
	[2023] = "Ohn'ahran Plains",
	[2022] = "The Waking Shores",
	--[2026] = "The Forbidden Reach",
	--[2107] = "The Forbidden Reach",
	--[2118] = "The Forbidden Reach",
	--[2131] = "The Forbidden Reach",
	[2151] = "The Forbidden Reach",
	[2133] = "Zaralek Cavern", --10.1
	[2200] = "Emerald Dream", --10.2
}

-- 7.3 Family Fighter
local ach73FamilyMetaID = 12100
local ach73FamilyIDtoName = {
	[12089] = {"Aquatic Assault", "Aquatic"},
	[12091] = {"Beast Blitz", "Beast"},
	[12092] = {"Critical Critters", "Critter"},
	[12093] = {"Draconic Destruction", "Dragonkin"},
	[12094] = {"Elemental Escalation", "Elemental"},
	[12095] = {"Fierce Fliers", "Flying"},
	[12096] = {"Humanoid Havoc", "Humanoid"},
	[12097] = {"Magical Mayhem", "Magic"},
	[12098] = {"Mechanical Melee", "Mechanical"},
	[12099] = {"Unstoppable Undead", "Undead"}
}
local ach73FamilyIDorder = {
	[1] = { --Pet Journal
		[1] = 12096, [2] = 12093, [3] = 12095, [4] = 12099, [5] = 12092, [6] = 12097, [7] = 12094, [8] = 12091, [9] = 12089, [10] = 12098
	},
	[2] = { --Alphabetical
		[1] = 12089, [2] = 12091, [3] = 12092, [4] = 12093, [5] = 12094, [6] = 12095, [7] = 12096, [8] = 12097, [9] = 12098, [10] = 12099
	}
}

--http://www.wowhead.com/legion-quests/type:115?filter=8;3;70300
local npc73 = {
	[49041] = {"Ruinhoof", 830},
	[49042] = {"Foulclaw", 830},
	[49043] = {"Baneglow", 830},
	[49044] = {"Retch", 830},
	[49045] = {"Deathscreech", 830},
	[49046] = {"Gnasher", 830},
	[49047] = {"Bucky", 882},
	[49048] = {"Snozz", 882},
	[49049] = {"Gloamwing", 882},
	[49050] = {"Shadeflicker", 882},
	[49051] = {"Corrupted Blood of Argus", 882},
	[49052] = {"Mar'cuus", 882},
	[49053] = {"Watcher", 885},
	[49054] = {"Bloat", 885},
	[49055] = {"Earseeker", 885},
	[49056] = {"Pilfer", 885},
	[49057] = {"Minixis", 885},
	[49058] = {"One-of-Many", 885}
}

-- 8.0 Battle on Zandalar and Kul Tiras
local ach80BattleWQs = 12936
local ach80BattleWQsCriteria = {
	[1] = 52009, -- Crab People
	[2] = 52126, -- This Little Piggy Has Sharp Tusks
	[3] = 52165, -- Automated Chaos
	[4] = 52218, -- Night Horrors
	[5] = 52278, -- Rogue Azerite
	[6] = 52297, -- What's the Buzz?
	[7] = 52316, -- Sea Creatures Are Weird
	[8] = 52325, -- Captured Evil
	[9] = 52430, -- Not So Bad Down Here
	[10] = 52455, -- Unbreakable
	[11] = 52471, -- That's a Big Carcass
	[12] = 52751, -- Strange Looking Dogs
	[13] = 52754, -- Marshdwellers
	[14] = 52779, -- Crawg in the Bog
	[15] = 52799, -- Pack Leader
	[16] = 52803, -- Accidental Dread
	[17] = 52850, -- Keeyo's Champions of Vol'dun
	[18] = 52856, -- Snakes on a Terrace
	[19] = 52864, -- What Do You Mean, Mind Controlling Plants?
	[20] = 52878, -- Desert Survivors
	[21] = 52892, -- Critters are Friends, Not Food
	[22] = 52923, -- Add More to the Collection
	[23] = 52937, -- You've Never Seen Jammer Upset
	[24] = 52938  -- Small Beginnings
}

-- 8.1 Family Battler
local ach81FamilyMetaID = 13279
local ach81FamilyIDtoName = {
	[13280] = {"Hobbyist Aquarist", "Aquatic"},
	[13270] = {"Beast Mode", "Beast"},
	[13271] = {"Critters With Huge Teeth", "Critter"},
	[13272] = {"Dragons Make Everything Better", "Dragonkin"},
	[13273] = {"Element of Success", "Elemental"},
	[13274] = {"Fun With Flying", "Flying"},
	[13281] = {"Human Resources", "Humanoid"},
	[13275] = {"Magician's Secrets", "Magic"},
	[13277] = {"Machine Learning", "Mechanical"},
	[13278] = {"Not Quite Dead Yet", "Undead"}
}
local ach81FamilyIDorder = {
	[1] = { --Pet Journal
		[1] = 13281, [2] = 13272, [3] = 13274, [4] = 13278, [5] = 13271, [6] = 13275, [7] = 13273, [8] = 13270, [9] = 13280, [10] = 13277
	},
	[2] = { --Alphabetical
		[1] = 13280, [2] = 13270, [3] = 13271, [4] = 13272, [5] = 13273, [6] = 13274, [7] = 13281, [8] = 13275, [9] = 13277, [10] = 13278
	}
}

local quest81Family = {
	[1] = { --Tiragarde Sound
		[52471] = {"Delia Hanako", 895, 1196}, --That's a Big Carcass
		[52751] = {"Burly", 895, 1196}, --Strange Looking Dogs
		[52430] = {"Kwint", 895, 1196} --Not So Bad Down Here
		-- [not included] Unbreakable
	},
	[2] = { --Stormsong Valley
		[52325] = {"Leana Darkwind", 942, 1198}, --Captured Evil
		[52316] = {"Ellie Vern", 942, 1198}, --Sea Creatures Are Weird
		[52165] = {"Eddie Fixit", 942, 1198} --Automated Chaos
		-- [not included] This Little Piggy Has Sharp Tusks
	},
	[3] = { --Drustvar
		[52297] = {"Michael Skarn", 896, 1197}, --What's the Buzz?
		[52278] = {"Fizzie Sparkwhistle", 896, 1197}, --Rogue Azerite
		[52218] = {"Dilbert McClint", 896, 1197}, --Night Horrors
		[52009] = {"Captain Hermes", 896, 1197} --Crab People
	},
	[4] = { --Zuldazar
		[52923] = {"Talia Sparkbrow", 862, 1193}, --Add More to the Collection
		[52938] = {"Zujai", 862, 1193}, --Small Beginnings
		[52892] = {"Karaga", 862, 1193} --Critters are Friends, Not Food
		-- [not included] You've Never Seen Jammer Upset
	},
	[5] = { --Nazmir
		[52754] = {"Lozu", 863, 1194}, --Marshdwellers
		[52803] = {"Korval Darkbeard", 863, 1194}, --Accidental Dread
		[52799] = {"Grady Prett", 863, 1194} --Pack Leader
		-- [not included] Crawg in the Bog
	},
	[6] = { --Vol'dun
		[52850] = {"Keeyo", 864, 1195}, --Keeyo's Champions of Vol'dun
		[52878] = {"Kusa", 864, 1195}, --Desert Survivors
		[52856] = {"Sizzik", 864, 1195} --Snakes on a Terrace
		-- [not included] What Do You Mean, Mind Controlling Plants?
	}
}

local quest82Extra = {
	--[1] = {
		[56393] = {"Gnomefeaster", 1462},
		[56395] = {"Goldenbot XD", 1462},
		[56397] = {"CK-9 Micro-Oppression Unit", 1462},
		[56399] = {"Unit 6", 1462},
		[56394] = {"Sputtertube", 1462},
		[56396] = {"Creakclank", 1462},
		[56398] = {"Unit 35", 1462},
		[56400] = {"Unit 17", 1462},
	--},
	--[2] = {
		[56381] = {"Prince Wiggletail", 1355},
		[56383] = {"Silence", 1355},
		[56385] = {"Pearlhusk Crawler", 1355},
		[56387] = {"Ravenous Scalespawn", 1355},
		[56389] = {"Kelpstone", 1355},
		[56391] = {"Frenzied Knifefang", 1355},
		[56382] = {"Chomp", 1355},
		[56384] = {"Shadowspike Lurker", 1355},
		[56386] = {"Elderspawn of Nalaada", 1355},
		[56388] = {"Mindshackle", 1355},
		[56390] = {"Voltgorger", 1355},
		[56392] = {"Giant Opaline Conch", 1355},
	--}
}

-- 9.0 Battle in the Shadowlands
local ach90ShadowWQs = 14625
local ach90ShadowWQsCriteria = {
	[1] = 61949, -- Ardenweald's Tricksters
	[2] = 61948, -- Airborne Defense Force
	[3] = 61947, -- Lurking In The Shadows
	[4] = 61946, -- Natural Defenders
	[5] = 61886, -- The Mind Games of Addius
	[6] = 61885, -- Eyegor's Special Friends
	[7] = 61883, -- Resilient Survivors
	[8] = 61879, -- Ashes Will Fall
	[9] = 61870, -- Failed Experiment
	[10] = 61868, -- Uncomfortably Undercover
	[11] = 61867, -- Extra Pieces
	[12] = 61866, -- Mighty Minions of Maldraxxus
	[13] = 61791, -- Thenia's Loyal Companions
	[14] = 61787, -- Micro Defense Force
	[15] = 61784, -- Cliffs of Bastion
	[16] = 61783  -- Mega Bite
}

-- 9.0 Family Exorcist
local ach90FamilyMetaID = 14879
local ach90FamilyIDtoName = {
	[14868] = {"Aquatic Apparitions", "Aquatic"},
	[14869] = {"Beast Busters", "Beast"},
	[14870] = {"Creepy Critters", "Critter"},
	[14871] = {"Deathly Dragonkin", "Dragonkin"},
	[14872] = {"Eerie Elementals", "Elemental"},
	[14873] = {"Flickering Fliers", "Flying"},
	[14874] = {"Haunted Humanoids", "Humanoid"},
	[14875] = {"Mummified Magics", "Magic"},
	[14876] = {"Macabre Mechanicals", "Mechanical"},
	[14877] = {"Unholy Undead", "Undead"}
}

local ach90FamilyIDorder = {
	[1] = { --Pet Journal
		[1] = 14874, [2] = 14871, [3] = 14873, [4] = 14877, [5] = 14870, [6] = 14875, [7] = 14872, [8] = 14869, [9] = 14868, [10] = 14876
	},
	[2] = { --Alphabetical
		[1] = 14868, [2] = 14869, [3] = 14870, [4] = 14871, [5] = 14872, [6] = 14873, [7] = 14874, [8] = 14875, [9] = 14876, [10] = 14877
	}
}

local quest90Family = {
	[1] = { --Bastion
		[61791] = {"Thenia", 1533, ""},
		[61784] = {"Stratios", 1533, ""},
		[61787] = {"Zolla", 1533, ""}
		-- [not included] [61783] = {"Jawbone", 1533, ""}
	},
	[2] = { --Maldraxxus
		-- [not included] [61870] = {"Gorgemouth", 1536, ""},
		[61867] = {"Rotgut", 1536, ""},
		[61868] = {"Dundley Stickyfingers", 1536, ""},
		[61866] = {"Caregiver Maximillian", 1536, ""}
	},
	[3] = { --Ardenweald
		-- [not included] [61949] = {"Rascal", 1565, ""},
		-- [not included] [61947] = {"Nightfang", 1565, ""},
		[61948] = {"Faryl", 1565, ""},
		[61946] = {"Glitterdust", 1565, ""}
	},
	[4] = { --Revendreth
		[61886] = {"Addius the Tormentor", 1525, "Addius the Tormenter"}, -- Achievement has spelling error
		[61883] = {"Sylla", 1525, ""},
		[61885] = {"Eyegor", 1525, ""}
		-- [not included] [61879] = {"Scorch", 1525, ""}
	}
}

-- 10.0 Battle on the Dragon Isles
local ach100DragonWQs = 16464
local ach100DragonWQsCriteria = {
	[1] = 71206, -- Eye of the Stormling
	[2] = 71202, -- Mini Manafiend Melee
	[3] = 66588, -- Swog the Elder
	[4] = 71145, -- The Grand Master
	[5] = 71166, -- The Oldest Dragonfly
	[6] = 66551, -- The Terrible Three
	[7] = 71140, -- Two and Two Together
	[8] = 71180  -- You Have to Start Somewhere
}

-- 10.0.7 Battle on the Dragon Isles II
local ach1007DragonWQs = 17406
local ach1007DragonWQsCriteria = {
	[1] = 74841, -- Adinakon
	[2] = 74838, -- Lyver
	[3] = 74835, -- Enok the Stinky
	[4] = 74794, -- Right Twice a Day	
	[5] = 74840, -- Sharp as Flint
	[6] = 74837, -- Paws of Thunder
	[7] = 74836, -- A New Vocation
	[8] = 74792  -- They're Full of Stars!
}

-- 10.0 Family Battler of the Dragon Isles
local ach100FamilyMetaID = 16512
local ach100FamilyIDtoName = {
	[16501] = {"Aquatic Battler of the Dragon Isles", "Aquatic"},
	[16503] = {"Beast Battler of the Dragon Isles", "Beast"},
	[16504] = {"Critter Battler of the Dragon Isles", "Critter"},
	[16505] = {"Dragonkin Battler of the Dragon Isles", "Dragonkin"},
	[16506] = {"Elemental Battler of the Dragon Isles", "Elemental"},
	[16507] = {"Flying Battler of the Dragon Isles", "Flying"},
	[16508] = {"Humanoid Battler of the Dragon Isles", "Humanoid"},
	[16509] = {"Magic Battler of the Dragon Isles", "Magic"},
	[16510] = {"Mechanical Battler of the Dragon Isles", "Mechanical"},
	[16511] = {"Undead Battler of the Dragon Isles", "Undead"}
}

local ach100FamilyIDorder = {
	[1] = { --Pet Journal
		[1] = 16508, [2] = 16505, [3] = 16507, [4] = 16511, [5] = 16504, [6] = 16509, [7] = 16506, [8] = 16503, [9] = 16501, [10] = 16510
	},
	[2] = { --Alphabetical
		[1] = 16501, [2] = 16503, [3] = 16504, [4] = 16505, [5] = 16506, [6] = 16507, [7] = 16508, [8] = 16509, [9] = 16510, [10] = 16511
	}
}

local quest100Family = {
	[1] = { --The Azure Span
		[71202] = {"Arcantus", 2024, ""},
		[71145] = {"Patchu", 2024, ""}
	},
	[2] = { --Thaldraszus
		[71166] = {"Enyobon", 2025, ""},
		[71180] = {"Setimothes", 2025, ""}
	},
	[3] = { --Ohn'ahran Plains
		[71206] = {"Stormamu", 2023, ""},
		[71140] = {"Bakhushek", 2023, ""}
	},
	[4] = { --The Waking Shores
		[66588] = {"Swog", 2022, ""},
		[66551] = {"Haniko", 2022, ""}
	}
}

--
-- 10.1 Family Battler of Zaralek Cavern
local ach101FamilyMetaID = 17934
local ach101FamilyIDtoName = {
	[17881] = {"Aquatic Battler of Zaralek Cavern", "Aquatic"},
	[17882] = {"Beast Battler of Zaralek Cavern", "Beast"},
	[17883] = {"Critter Battler of Zaralek Cavern", "Critter"},
	[17890] = {"Dragonkin Battler of Zaralek Cavern", "Dragonkin"},
	[17904] = {"Elemental Battler of Zaralek Cavern", "Elemental"},
	[17905] = {"Flying Battler of Zaralek Cavern", "Flying"},
	[17915] = {"Humanoid Battler of Zaralek Cavern", "Humanoid"},
	[17916] = {"Magic Battler of Zaralek Cavern", "Magic"},
	[17917] = {"Mechanical Battler of Zaralek Cavern", "Mechanical"},
	[17918] = {"Undead Battler of Zaralek Cavern", "Undead"}
}

local ach101FamilyIDorder = {
	[1] = { --Pet Journal
		[1] = 17915, [2] = 17890, [3] = 17905, [4] = 17918, [5] = 17883, [6] = 17916, [7] = 17904, [8] = 17882, [9] = 17881, [10] = 17917
	},
	[2] = { --Alphabetical
		[1] = 17881, [2] = 17882, [3] = 17883, [4] = 17890, [5] = 17904, [6] = 17905, [7] = 17915, [8] = 17916, [9] = 17917, [10] = 17918
	}
}

local quest101Family = {
	[1] = { --Zaralek Cavern
		[75680] = {"Explorer Bezzert", 2133, ""},
		[75834] = {"Delver Mardei", 2133, ""},
		[75750] = {"Shinmura", 2133, ""},
		[75835] = {"Trainer Orlogg", 2133, ""}
	}
}

--local achZZZFamilyIDorder = {
	--[1] = { --Pet Journal
		--[1] = human, [2] = dragon, [3] = flying, [4] = undead, [5] = critter, [6] = magic, [7] = elemental, [8] = beast, [9] = aqua, [10] = mech
	--},
	--[2] = { --Alphabetical
		--[1] = aqua, [2] = beast, [3] = critter, [4] = dragon, [5] = elemental, [6] = flying, [7] = human, [8] = magic, [9] = mech, [10] = undead
	--}
--}

local rewardList = {
	[86143] = "|T133675:0|tBattle Pet Bandage",
	[163036] = "|T2004597:0|tPolished Pet Charm",
	--[116415] = "|T413584:0|tShiny Pet Charm", -- Removed in 10.2.5
	
	[98715] = "|T667492:0|tMarked Flawless Battle-Stone",
	[92741] = "|T667492:0|tFlawless Battle-Stone",
	[92679] = "|T666978:0|tFlawless Aquatic Battle-Stone",
	[92675] = "|T666951:0|tFlawless Beast Battle-Stone",
	[92676] = "|T666954:0|tFlawless Critter Battle-Stone",
	[92683] = "|T666957:0|tFlawless Dragonkin Battle-Stone",
	[92665] = "|T666960:0|tFlawless Elemental Battle-Stone",
	[92677] = "|T666963:0|tFlawless Flying Battle-Stone",
	[92682] = "|T666966:0|tFlawless Humanoid Battle-Stone",
	[92678] = "|T666969:0|tFlawless Magic Battle-Stone",
	[92680] = "|T666972:0|tFlawless Mechanical Battle-Stone",
	[92681] = "|T666975:0|tFlawless Undead Battle-Stone",

	[122457] = "|T667491:0|tUltimate Battle-Training Stone",
	[127755] = "|T667493:0|tFel-Touched Battle-Training Stone",
	
	[116429] = "|T1045111:0|tFlawless Battle-Training Stone",
	[116424] = "|T1045115:0|tAquatic Battle-Training Stone",
	[116374] = "|T1045105:0|tBeast Battle-Training Stone",
	[116418] = "|T1045106:0|tCritter Battle-Training Stone",
	[116419] = "|T1045107:0|tDragonkin Battle-Training Stone",
	[116420] = "|T1045108:0|tElemental Battle-Training Stone",
	[116421] = "|T1045109:0|tFlying Battle-Training Stone",
	[116416] = "|T1045110:0|tHumanoid Battle-Training Stone",
	[116422] = "|T1045112:0|tMagic Battle-Training Stone",
	[116417] = "|T1045113:0|tMechanical Battle-Training Stone",
	[116423] = "|T1045114:0|tUndead Battle-Training Stone"
}

--

local useOrder = 1
local runonce = true
local f = nil
local fA = nil --Fighter/Argus
--local fRewards = nil --Rewards
local currentWQ = {} -- All WQs
local missing70WQs = {} -- Only Battle on the Broken Isles
local missing80WQs = {} -- Only Battle on Zandalar and Kul Tiras
local missing90WQs = {} -- Only Battle in the Shadowlands
local missing100WQs = {} -- Only Battle on the Dragon Isles and II
local levelCap = 45

--
local function SkinFrame(frame,name)
	if IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui") then
		if frame.StripTextures then frame:StripTextures() end
		if frame.CreateBackdrop then frame:CreateBackdrop("Transparent") end
	end
end

local function has_value (tab, val)
    for index, value in ipairs (tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function has_valueAlt (tab, val)
    for index, value in pairs (tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function table_count(tab)
	local count = 0
	if(tab ~= nil) then
		for _ in pairs(tab) do
			count = count + 1
		end
	end
	return count
end

local function DoChecksRewards()
	if(currentWQ ~= nil and UnitLevel("player") >= levelCap) then
		-- local txtTamerInfo = ""
		-- local txtTamerInfoZone = ""
		-- local txtTypeInfo = ""
		
		for order,zQuest in ipairs(currentWQ) do
			for questID,mapname in pairs(zQuest) do
				if(C_QuestLog.IsQuestFlaggedCompleted(questID) == false) then
					local numQuestRewards = GetNumQuestLogRewards(questID)
					if (numQuestRewards > 0) then
						local itemName, itemTexture, quantity, quality, isUsable, itemID = GetQuestLogRewardInfo (1, questID)

						local textColZone = nil
						if((has_valueAlt(zones70Legion, mapname) or has_valueAlt(zones72Legion, mapname)) and addon.config.profile.notifyRewardItemsLegion) then
							textColZone = colGreen
						elseif(has_valueAlt(zones73Legion, mapname) and addon.config.profile.notifyRewardItemsLegion) then
							textColZone = colPurple
						elseif(has_valueAlt(zones80BattleZan, mapname) and addon.config.profile.notifyRewardItemsBattle) then
							textColZone = colRed
						elseif(has_valueAlt(zones80BattleKul, mapname) and addon.config.profile.notifyRewardItemsBattle) then
							textColZone = colBlue
						elseif(has_valueAlt(zones82Battle, mapname) and addon.config.profile.notifyRewardItemsBattle) then
							textColZone = colYellow
						elseif(has_valueAlt(zones90Shadow, mapname) and addon.config.profile.notifyRewardItemsShadow) then
							textColZone = colOrange
						elseif(has_valueAlt(zones100Dragon, mapname) and addon.config.profile.notifyRewardItemsDragon) then
							textColZone = colDragonflight1
						end

						if(textColZone ~= nil and addon.config.profile.rewardVisible[itemID]) then
							local _, itemLink = GetItemInfo(itemID)
							if(itemLink == nil) then
								if(rewardList[itemID] ~= nil) then
									itemLink = rewardList[itemID]
								else
									itemLink = "ItemID:" .. tostring(itemID)
								end
							end
							
							local addQN = ""
							if(addon.config.profile.notifyShowQuestName) then
								addQN = " from " .. GetQuestLink(questID)
							end
							
							-- local availabilty = textColZone .. mapname .. colReset
							-- local rInfo = itemLink .. " x" .. tostring(quantity);
							-- if(txtTamerInfo == "") then
								-- txtTamerInfo = rInfo
								-- txtTamerInfoZone = availabilty
								-- txtTypeInfo = GetQuestLink(questID)
							-- else
								-- txtTamerInfo = txtTamerInfo .. "|n" .. rInfo
								-- txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
								-- txtTypeInfo = txtTypeInfo .. "|n" .. GetQuestLink(questID)
							-- end

							if(quantity > 1) then
								print(colPink .. "CheckPetWQs" .. colReset .. ": " .. itemLink .. " x" .. tostring(quantity) .. " in " .. textColZone .. mapname .. colReset .. addQN .. ".")
							else
								print(colPink .. "CheckPetWQs" .. colReset .. ": " .. itemLink .. " in " .. textColZone .. mapname .. colReset .. addQN .. ".")
							end
						end
					end
				end
			end
		end
		
		--txtTamerInfo = txtTamerInfo .. colReset
		--fRewards.Content.TamerInfo:SetText(txtTamerInfo)
		--fRewards.Content.TamerInfoZone:SetText(txtTamerInfoZone)
		--fRewards.Content.TypeInfo:SetText(txtTypeInfo)
	end
end

local function DoChecks(force)
	currentWQ = {}
	missing70WQs = {}
	missing80WQs = {}
	missing90WQs = {}
	missing100WQs = {}
	
	local found70fam = 0 --Familiar
	--local found73fam = 0 --Fighter
	--local found81fam = 0 --Brawler
	--local found90fam = 0 --Exorcist
	local something70Available = 0 -- Familiar
	--local currentAreaID = C_Map.GetBestMapForUnit("player")

	-- Mostly made for Battle on the Broken Isles
	local _,_,_, completed70Legion = GetAchievementInfo(ach70LegionWQs)
	local _,_,_, completed80Battle = GetAchievementInfo(ach80BattleWQs)
	local _,_,_, completed90Shadow = GetAchievementInfo(ach90ShadowWQs)
	local _,_,_, completed100Dragon = GetAchievementInfo(ach100DragonWQs)
	local _,_,_, completed1007Dragon = GetAchievementInfo(ach1007DragonWQs)
	
	local num70Criteria = GetAchievementNumCriteria(ach70LegionWQs)
	for k=1,num70Criteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(ach70LegionWQs, k)
		if (cComp == false) then
			missing70WQs[ach70LegionWQsCriteria[k]] = true
		end
	end
	
	local num80Criteria = GetAchievementNumCriteria(ach80BattleWQs)
	for k=1,num80Criteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(ach80BattleWQs, k)
		if (cComp == false) then
			missing80WQs[ach80BattleWQsCriteria[k]] = true
		end
	end

	local num90Criteria = GetAchievementNumCriteria(ach90ShadowWQs)
	for k=1,num90Criteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(ach90ShadowWQs, k)
		if (cComp == false) then
			missing90WQs[ach90ShadowWQsCriteria[k]] = true
		end
	end
	
	local num100Criteria = GetAchievementNumCriteria(ach100DragonWQs)
	for k=1,num100Criteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(ach100DragonWQs, k)
		if (cComp == false) then
			missing100WQs[ach100DragonWQsCriteria[k]] = true
		end
	end
	
	local num1007Criteria = GetAchievementNumCriteria(ach1007DragonWQs)
	for k=1,num1007Criteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(ach1007DragonWQs, k)
		if (cComp == false) then
			missing100WQs[ach1007DragonWQsCriteria[k]] = true
		end
	end
	
	--
	
	local zoneOrder = 1;
	currentWQ[zoneOrder] = {};

	for uiMapID,mapname in pairs(zones70Legion) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
						
					if(has_value(ach70LegionWQsCriteria, questID)) then
						found70fam = found70fam + 1
						--print("Legion Exists: " .. tostring(questID));
						if (completed70Legion == false and addon.config.profile.autoIslesAch and missing70WQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colGreen .. mapname .. colReset .. " pet battle you need to do.")
						end
					end
				end
			end
		end
	end

	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end
	
	for uiMapID,mapname in pairs(zones72Legion) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					
					--if(quest72Extra[questID] ~= nil) then
						--found72 = found72 + 1
						--print("Broken Shore Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end
	
	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end
	
	for uiMapID,mapname in pairs(zones73Legion) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					
					--if(npc73[questID] ~= nil) then
						--found73fam = found73fam + 1
						--print("Argus Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end
	
	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end
	
	-- Zandalar
	for uiMapID,mapname in pairs(zones80BattleZan) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					
					if(has_value(ach80BattleWQsCriteria, questID) and currentWQ[zoneOrder][questID] == nil) then
						--found80 = found80 + 1
						--print("Battle Exists: " .. tostring(questID));					
						if (completed80Battle == false and addon.config.profile.autoBattleAch and missing80WQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colRed .. mapname .. colReset .. " pet battle you need to do.")
						end
					end
					
					--if(ach80BattleWQsCriteria[questID] ~= nil) then
						--found80 = found80 + 1
						--print("Battle For Azeroth Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end
	
	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end
	
	-- Kul Tiras
	for uiMapID,mapname in pairs(zones80BattleKul) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					
					if(has_value(ach80BattleWQsCriteria, questID)) then
						--found80 = found80 + 1
						--print("Battle Exists: " .. tostring(questID));					
						if (completed80Battle == false and addon.config.profile.autoBattleAch and missing80WQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colBlue .. mapname .. colReset .. " pet battle you need to do.")
						end
					end
					
					--if(ach80BattleWQsCriteria[questID] ~= nil) then
						--found80 = found80 + 1
						--print("Battle For Azeroth Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end
	
	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end
	
	-- 8.2 Nazjatar and Mechagon
	for uiMapID,mapname in pairs(zones82Battle) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					--if(quest82Extra[questID] ~= nil) then
						--found82 = found82 + 1
						--print("BfA 8.2 Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end
	
	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end

	-- 9.0 Shadowlands
	for uiMapID,mapname in pairs(zones90Shadow) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					
					if(has_value(ach90ShadowWQsCriteria, questID)) then
						--found90fam = found90fam + 1
						--print("Shadowlands Exists: " .. tostring(questID));					
						if (completed90Shadow == false and addon.config.profile.autoShadowAch and missing90WQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colOrange .. mapname .. colReset .. " pet battle you need to do.")
						end
					end

					--if(ach90ShadowWQsCriteria[questID] ~= nil) then
						--found90fam = found90fam + 1
						--print("Shadowlands Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end
	
	if(table_count(currentWQ[zoneOrder]) > 0) then
		zoneOrder = zoneOrder + 1;
		currentWQ[zoneOrder] = {};
	end
	
	-- 10.0 Dragonflight
	for uiMapID,mapname in pairs(zones100Dragon) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					currentWQ[zoneOrder][questID] = mapname
					C_TaskQuest.RequestPreloadRewardData(questID)
					
					if((has_value(ach100DragonWQsCriteria, questID) or has_value(ach1007DragonWQsCriteria, questID))) then
						--print("Dragonflight Exists: " .. tostring(questID));					
						if ((completed100Dragon == false or completed1007Dragon == false) and addon.config.profile.autoDragonAch and missing100WQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colDragonflight1 .. mapname .. colReset .. " pet battle you need to do.")
						end
					end

					--if(ach100DragonWQsCriteria[questID] ~= nil or ach1007DragonWQsCriteria[questID] ~= nil) then
						--print("Dragonflight Exists: " .. tostring(questID));
					--end
				end
			end
		end
	end

	-- local cacheFound = table_count(CheckPetWQsCache)
	-- if(found70fam >= 3) then
		-- --print("CheckPetWQs Familar: Found at least 3 quests, saving to cache.")
		-- CheckPetWQsCache = currentWQ
	-- elseif(found70fam > 0) then
		-- --print("CheckPetWQs Familar: Need to figure out which quests have been done, and save to cache.")
		-- for questID,tamer in pairs(quest70Family) do
			-- if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
				-- currentWQ[questID] = "Unknown"
			-- end
		-- end
		-- for order,zInfo in ipairs(quest81Family) do
			-- for questID,tamer in pairs(zInfo) do
				-- if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
					-- currentWQ[questID] = "Unknown"
				-- end
			-- end
		-- end
		-- for order,zInfo in ipairs(quest90Family) do
			-- for questID,tamer in pairs(zInfo) do
				-- if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
					-- currentWQ[questID] = "Unknown"
				-- end
			-- end
		-- end
		-- for order,zInfo in ipairs(quest100Family) do
			-- for questID,tamer in pairs(zInfo) do
				-- if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
					-- currentWQ[questID] = "Unknown"
				-- end
			-- end
		-- end
		-- for order,zInfo in ipairs(quest101Family) do
			-- for questID,tamer in pairs(zInfo) do
				-- if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
					-- currentWQ[questID] = "Unknown"
				-- end
			-- end
		-- end
		-- CheckPetWQsCache = currentWQ
	-- else
		-- --print("CheckPetWQs Familar: Found no quests, using cache instead.")
		-- currentWQ = CheckPetWQsCache
	-- end
	
	local txtTamerInfo = ""
	local txtTamerInfoZone = ""
	local txtTamerInfoNum = ""
	local txtTypeInfo = ""
	
	local num70Criteria = 0
	local num81Criteria = 0
	local num90Criteria = 0
	local num100Criteria = 0
	local num101Criteria = 0
	
	if(addon.config.profile.popupShowFF) then
		if(currentWQ ~= nil) then
			-- Family Familar
			for questID,mapname in pairs(currentWQ) do
				if (quest70Family[questID] ~= nil) then -- exists, as in is FF
					local tamer70 = quest70Family[questID]
				
					--found73fam = found73fam + 1
					local numComp = 0
					local txtcriteria = ""
					for order,achID in ipairs(ach70FamilyIDorder[useOrder]) do
						local achName = ach70FamilyIDtoName[achID][1]
						local achType = ach70FamilyIDtoName[achID][2]
						local _,_,_, achComp = GetAchievementInfo(achID)
						local numCriteriaFam = GetAchievementNumCriteria(achID)
						for k=1,numCriteriaFam,1 do
							local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

							if(cDesc == tamer70) then
								local add = ""
								if(cComp == true) then --Criteria
									numComp = numComp + 1
									add = colGrey .. string.sub(achType, 1, 3) .. colReset
								elseif(achComp == true) then
									add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
								else
									num70Criteria = num70Criteria + 1
									add = string.sub(achType, 1, 3)
								end
								
								if(achID == ach70FamilyIDorder[useOrder][1]) then
									txtcriteria = add
								else
									txtcriteria = txtcriteria .. " " .. add
								end
							end
						end
					end

					local availabilty = colGrey .. mapname .. colReset
					if(C_QuestLog.IsQuestFlaggedCompleted(questID) == false) then
						availabilty = colGreen .. mapname .. colReset
						something70Available = true
					elseif(force == true) then
						something70Available = true
					end

					if(txtTamerInfo == "") then
						txtTamerInfo = quest70Family[questID]
						txtTamerInfoZone = availabilty
						txtTamerInfoNum = tostring(numComp) .. " / 10"
						txtTypeInfo = txtcriteria
					else
						txtTamerInfo = txtTamerInfo .. "|n" .. quest70Family[questID]
						txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
						txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
						txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
					end
				end
			end
		end

		if(txtTamerInfo ~= "") then
			txtTamerInfo = txtTamerInfo .. "|n"
			txtTamerInfoZone = txtTamerInfoZone .. "|n"
			txtTamerInfoNum = txtTamerInfoNum .. "|n"
			txtTypeInfo = txtTypeInfo .. "|n"
		end
		
		for qID,npcInfo in pairs(npc73) do
			local numCriteria73 = 0
			local numComp = 0
			local txtcriteria = ""
			
			for order,achID in ipairs(ach73FamilyIDorder[useOrder]) do
				local achName = ach73FamilyIDtoName[achID][1]
				local achType = ach73FamilyIDtoName[achID][2]
				--local _,_,_, achComp = GetAchievementInfo(achID)
				local numCriteriaFam = GetAchievementNumCriteria(achID)
				for k=1,numCriteriaFam,1 do
					local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

					if(cDesc == npcInfo[1]) then
						local add = ""
						if(cComp == true) then --Criteria
							numComp = numComp + 1
							add = colGrey .. string.sub(achType, 1, 3) .. colReset
						else
							numCriteria73 = numCriteria73 + 1
							add = string.sub(achType, 1, 3)
						end

						if(achID == ach73FamilyIDorder[useOrder][1]) then
							txtcriteria = add
						else
							txtcriteria = txtcriteria .. " " .. add
						end
					end
				end
			end
			
			if(txtTamerInfo == "") then
				txtTamerInfo = colWhite .. npcInfo[1]
				txtTamerInfoZone = colPurple .. zones73Legion[npcInfo[2]] .. colReset
				txtTamerInfoNum = tostring(numComp) .. " / 10"
				txtTypeInfo = txtcriteria
			else
				txtTamerInfo = txtTamerInfo .. "|n" .. npcInfo[1]
				txtTamerInfoZone = txtTamerInfoZone .. "|n" .. colPurple .. zones73Legion[npcInfo[2]] .. colReset
				txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
				txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
			end
		end
		
		if(txtTamerInfo ~= "") then
			txtTamerInfo = txtTamerInfo .. "|n"
			txtTamerInfoZone = txtTamerInfoZone .. "|n"
			txtTamerInfoNum = txtTamerInfoNum .. "|n"
			txtTypeInfo = txtTypeInfo .. "|n"
		end
	end
	
	if(addon.config.profile.popupShowFB) then
		for order,zInfo in ipairs(quest81Family) do
			for questID,qInfo in pairs(zInfo) do
				local mapname = "Unknown"
				if(zones80BattleZan[qInfo[2]] ~= nil) then
					mapname = zones80BattleZan[qInfo[2]]
				elseif(zones80BattleKul[qInfo[2]] ~= nil) then
					mapname = zones80BattleKul[qInfo[2]]
				end

				local tamer81 = zInfo[questID][1]
				--found81fam = found81fam + 1
				local numComp = 0
				local txtcriteria = ""
				for order,achID in ipairs(ach81FamilyIDorder[useOrder]) do
					local achName = ach81FamilyIDtoName[achID][1]
					local achType = ach81FamilyIDtoName[achID][2]
					local _,_,_, achComp = GetAchievementInfo(achID)
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

						if(cDesc == tamer81) then
							local add = ""
							if(cComp == true) then --Criteria
								numComp = numComp + 1
								add = colGrey .. string.sub(achType, 1, 3) .. colReset
							elseif(achComp == true) then
								add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
							else
								num81Criteria = num81Criteria + 1
								add = string.sub(achType, 1, 3)
							end
							
							if(achID == ach81FamilyIDorder[useOrder][1]) then
								txtcriteria = add
							else
								txtcriteria = txtcriteria .. " " .. add
							end
						end
					end
				end

				local availabilty = colGrey .. mapname .. colReset
				if(has_valueAlt(zones80BattleZan, mapname)) then
					availabilty = colRed .. mapname .. colReset
				else
					availabilty = colBlue .. mapname .. colReset
				end

				if(txtTamerInfo == "") then
					txtTamerInfo = zInfo[questID][1]
					txtTamerInfoZone = availabilty
					txtTamerInfoNum = tostring(numComp) .. " / 10"
					txtTypeInfo = txtcriteria
				else
					txtTamerInfo = txtTamerInfo .. "|n" .. zInfo[questID][1]
					txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
					txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
					txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
				end
			end
		end
		
		if(txtTamerInfo ~= "") then
			txtTamerInfo = txtTamerInfo .. "|n"
			txtTamerInfoZone = txtTamerInfoZone .. "|n"
			txtTamerInfoNum = txtTamerInfoNum .. "|n"
			txtTypeInfo = txtTypeInfo .. "|n"
		end
	end
	
	if(addon.config.profile.popupShowFE) then
		for order,zInfo in ipairs(quest90Family) do
			for questID,qInfo in pairs(zInfo) do
				local mapname = "Unknown"
				if(zones90Shadow[qInfo[2]] ~= nil) then
					mapname = zones90Shadow[qInfo[2]]
				end

				local tamer90 = zInfo[questID][1]
				local tamer90alt = zInfo[questID][3] -- For spelling errors
				--found90fam = found90fam + 1
				local numComp = 0
				local txtcriteria = ""
				for order,achID in ipairs(ach90FamilyIDorder[useOrder]) do
					local achName = ach90FamilyIDtoName[achID][1]
					local achType = ach90FamilyIDtoName[achID][2]
					local _,_,_, achComp = GetAchievementInfo(achID)
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

						if(cDesc == tamer90 or cDesc == tamer90alt) then
							local add = ""
							if(cComp == true) then --Criteria
								numComp = numComp + 1
								add = colGrey .. string.sub(achType, 1, 3) .. colReset
							elseif(achComp == true) then
								add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
							else
								num90Criteria = num90Criteria + 1
								add = string.sub(achType, 1, 3)
							end
							
							if(achID == ach90FamilyIDorder[useOrder][1]) then
								txtcriteria = add
							else
								txtcriteria = txtcriteria .. " " .. add
							end
						end
					end
				end

				--local availabilty = colGrey .. mapname .. colReset
				local availabilty = colOrange .. mapname .. colReset

				if(txtTamerInfo == "") then
					txtTamerInfo = zInfo[questID][1]
					txtTamerInfoZone = availabilty
					txtTamerInfoNum = tostring(numComp) .. " / 10"
					txtTypeInfo = txtcriteria
				else
					txtTamerInfo = txtTamerInfo .. "|n" .. zInfo[questID][1]
					txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
					txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
					txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
				end
			end
		end
		
		if(txtTamerInfo ~= "") then
			txtTamerInfo = txtTamerInfo .. "|n"
			txtTamerInfoZone = txtTamerInfoZone .. "|n"
			txtTamerInfoNum = txtTamerInfoNum .. "|n"
			txtTypeInfo = txtTypeInfo .. "|n"
		end
	end
	
	if(addon.config.profile.popupShowFBDI) then
		for order,zInfo in ipairs(quest100Family) do
			for questID,qInfo in pairs(zInfo) do
				local mapname = "Unknown"
				if(zones100Dragon[qInfo[2]] ~= nil) then
					mapname = zones100Dragon[qInfo[2]]
				end

				local tamer100 = zInfo[questID][1]
				local tamer100alt = zInfo[questID][3] -- For spelling errors
				local numComp = 0
				local txtcriteria = ""
				for order,achID in ipairs(ach100FamilyIDorder[useOrder]) do
					local achName = ach100FamilyIDtoName[achID][1]
					local achType = ach100FamilyIDtoName[achID][2]
					local _,_,_, achComp = GetAchievementInfo(achID)
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

						if(cDesc == tamer100 or cDesc == tamer100alt) then
							local add = ""
							if(cComp == true) then --Criteria
								numComp = numComp + 1
								add = colGrey .. string.sub(achType, 1, 3) .. colReset
							elseif(achComp == true) then
								add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
							else
								num100Criteria = num100Criteria + 1
								add = string.sub(achType, 1, 3)
							end
							
							if(achID == ach100FamilyIDorder[useOrder][1]) then
								txtcriteria = add
							else
								txtcriteria = txtcriteria .. " " .. add
							end
						end
					end
				end

				--local availabilty = colGrey .. mapname .. colReset
				local availabilty = colDragonflight1 .. mapname .. colReset

				if(txtTamerInfo == "") then
					txtTamerInfo = zInfo[questID][1]
					txtTamerInfoZone = availabilty
					txtTamerInfoNum = tostring(numComp) .. " / 10"
					txtTypeInfo = txtcriteria
				else
					txtTamerInfo = txtTamerInfo .. "|n" .. zInfo[questID][1]
					txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
					txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
					txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
				end
			end
		end
		
		if(txtTamerInfo ~= "") then
			txtTamerInfo = txtTamerInfo .. "|n"
			txtTamerInfoZone = txtTamerInfoZone .. "|n"
			txtTamerInfoNum = txtTamerInfoNum .. "|n"
			txtTypeInfo = txtTypeInfo .. "|n"
		end
	end
	
	if(addon.config.profile.popupShowFBZL) then
		for order,zInfo in ipairs(quest101Family) do
			for questID,qInfo in pairs(zInfo) do
				local mapname = "Unknown"
				if(zones100Dragon[qInfo[2]] ~= nil) then --Intention
					mapname = zones100Dragon[qInfo[2]]
				end

				local tamer101 = zInfo[questID][1]
				--local tamer100alt = zInfo[questID][3] -- For spelling errors
				local numComp = 0
				local txtcriteria = ""
				for order,achID in ipairs(ach101FamilyIDorder[useOrder]) do
					local achName = ach101FamilyIDtoName[achID][1]
					local achType = ach101FamilyIDtoName[achID][2]
					local _,_,_, achComp = GetAchievementInfo(achID)
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)
						if(cDesc == tamer101) then --or cDesc == tamer101alt
							local add = ""
							if(cComp == true) then --Criteria
								numComp = numComp + 1
								add = colGrey .. string.sub(achType, 1, 3) .. colReset
							elseif(achComp == true) then
								add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
							else
								num101Criteria = num101Criteria + 1
								add = string.sub(achType, 1, 3)
							end
							
							if(achID == ach101FamilyIDorder[useOrder][1]) then
								txtcriteria = add
							else
								txtcriteria = txtcriteria .. " " .. add
							end
						end
					end
				end

				--local availabilty = colGrey .. mapname .. colReset
				local availabilty = colDragonflight1 .. mapname .. colReset

				if(txtTamerInfo == "") then
					txtTamerInfo = zInfo[questID][1]
					txtTamerInfoZone = availabilty
					txtTamerInfoNum = tostring(numComp) .. " / 10"
					txtTypeInfo = txtcriteria
				else
					txtTamerInfo = txtTamerInfo .. "|n" .. zInfo[questID][1]
					txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
					txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
					txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
				end
			end
		end
	end
	
	--

	txtTamerInfo = txtTamerInfo .. colReset
	fA.Content.TamerInfo:SetText(txtTamerInfo)
	fA.Content.TamerInfoZone:SetText(txtTamerInfoZone)
	fA.Content.TamerInfoNum:SetText(txtTamerInfoNum)
	fA.Content.TypeInfo:SetText(txtTypeInfo)
	
	if((UnitLevel("player") < levelCap or addon.config.profile.autoWindow == false) and force == false) then
		-- Don't display on characters that can't do Legion WQs
		something70Available = false;
	end
	if(force) then
		something70Available = true;
	end

	return something70Available, num70Criteria
end

local function PreDoChecks(force, checkRewards)
	useOrder = 1;
	if(addon.config.profile.orderTypesAlpha) then
		useOrder = 2
	end

	if(fA == nil) then
		fA = CheckPetWQsFighter
		fA.Title:SetText("CheckPetWQs: Family Familiar / Fighter / Battler / Exorcist")
		fA:SetScript("OnKeyDown", function(self,key) 
			if key == "ESCAPE" then
				fA:SetPropagateKeyboardInput(false)
				fA:Hide(); 
			end 
		end)
		fA:EnableKeyboard(true)
	end
	
	-- if(fRewards == nil) then
		-- fRewards = CheckPetWQsRewards
		-- fRewards.Title:SetText("CheckPetWQs: Rewards")
		-- fRewards:SetScript("OnKeyDown", function(self,key) 
			-- if key == "ESCAPE" then
				-- fRewards:SetPropagateKeyboardInput(false)
				-- fRewards:Hide(); 
			-- end 
		-- end)
		-- fRewards:EnableKeyboard(true)
	-- end
	  
	local something70Available, num70Criteria = DoChecks(force)
	if(checkRewards) then
		C_Timer.After(2, function() DoChecksRewards() end) -- Sometimes just need to do this later
	end
	
	-- Family Familiar
	local _,_,_, completed70Meta = GetAchievementInfo(ach70FamilyMetaID)
	if(something70Available == true) then
		if(num70Criteria == 0 and force == false) then
			if(addon.config.profile.notifyNoFF and completed70Meta == false) then
				print(colPink .. "CheckPetWQs" .. colReset .. ": None of the available Family Familiar WQs are required. Force open the window with: /ff")
			end
		else
			fA:Show()
			SkinFrame(fA, fA:GetName())
			fA:SetPropagateKeyboardInput(true)
			
			--fRewards:Show()
			--SkinFrame(fRewards, fRewards:GetName())
			--fRewards:SetPropagateKeyboardInput(true)
		end
	elseif(addon.config.profile.notifyNoFF and completed70Meta == false and UnitLevel("player") >= levelCap) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": No available WQs for Family Familiar found.")
	end
	-- Family Battler
	local _,_,_, completed81Meta = GetAchievementInfo(ach81FamilyMetaID)
	if(completed81Meta == false and force == false and UnitLevel("player") >= levelCap) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": Check your progress towards the 'Family Battler' achievement with: /ff")
	end
	-- Family Exorcist
	local _,_,_, completed90Meta = GetAchievementInfo(ach90FamilyMetaID)
	if(completed90Meta == false and force == false and UnitLevel("player") >= levelCap) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": Check your progress towards the 'Family Exorcist' achievement with: /ff")
	end
	-- Family Battler of the Dragon Isles
	local _,_,_, completed100Meta = GetAchievementInfo(ach100FamilyMetaID)
	if(completed100Meta == false and force == false and UnitLevel("player") >= levelCap) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": Check your progress towards the 'Family Battler of the Dragon Isles' achievement with: /ff")
	end
	-- Family Battler of Zaralek Cavern
	local _,_,_, completed101Meta = GetAchievementInfo(ach101FamilyMetaID)
	if(completed101Meta == false and force == false and UnitLevel("player") >= levelCap) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": Check your progress towards the 'Family Battler of Zaralek Cavern' achievement with: /ff")
	end
	
	-- Get the base widths
	local widthType = ceil(fA.Content.TamerInfo:GetStringWidth()) + 5
	local widthTypeZone = ceil(fA.Content.TamerInfoZone:GetStringWidth()) + 5
	local widthTypeNum = ceil(fA.Content.TamerInfoNum:GetStringWidth()) + 5
	local widthOne = ceil(fA.Content.TypeInfo:GetStringWidth()) + 10

	fA.Content.TamerInfo:SetWidth(widthType)
	fA.Content.TamerInfoZone:SetWidth(widthTypeZone)
	fA.Content.TamerInfoNum:SetWidth(widthTypeNum)
	fA.Content.TypeInfo:SetWidth(widthOne)

	fA.Content.TamerInfo:SetPoint("TOPLEFT", 0, 0)
	fA.Content.TamerInfoZone:SetPoint("TOPLEFT", widthType + 5, 0)
	fA.Content.TamerInfoNum:SetPoint("TOPLEFT", widthType + widthTypeZone, 0)
	fA.Content.TypeInfo:SetPoint("TOPLEFT", widthType + widthTypeZone + widthTypeNum, 0)

	local _, _, _, xOffset = fA.Content.TypeInfo:GetPoint()
	local totalWidth = xOffset + widthOne
	fA:SetSize(totalWidth + 10, fA.Content.TypeInfo:GetHeight() + 50)
	fA.Content:SetSize(totalWidth, 0)

	--

	-- local widthTypeR = ceil(fRewards.Content.TamerInfo:GetStringWidth()) + 5
	-- local widthTypeZoneR = ceil(fRewards.Content.TamerInfoZone:GetStringWidth()) + 5
	-- local widthOneR = ceil(fRewards.Content.TypeInfo:GetStringWidth()) + 10

	-- fRewards.Content.TamerInfo:SetWidth(widthTypeR)
	-- fRewards.Content.TamerInfoZone:SetWidth(widthTypeZoneR)
	-- fRewards.Content.TypeInfo:SetWidth(widthOneR)

	-- fRewards.Content.TamerInfo:SetPoint("TOPLEFT", 0, 0)
	-- fRewards.Content.TamerInfoZone:SetPoint("TOPLEFT", widthTypeR + 5, 0)
	-- fRewards.Content.TypeInfo:SetPoint("TOPLEFT", widthTypeR + widthTypeZoneR, 0)
	
	-- local _, _, _, xOffsetR = fRewards.Content.TypeInfo:GetPoint()
	-- local totalWidthR = xOffsetR + widthOneR
	-- fRewards:SetSize(totalWidthR + 10, fRewards.Content.TypeInfo:GetHeight() + 50)
	-- fRewards.Content:SetSize(totalWidthR, 0)
end
--

local CheckPetWQs = CreateFrame("Frame")
CheckPetWQs:RegisterEvent ("PLAYER_ENTERING_WORLD")
CheckPetWQs:RegisterEvent ("PLAYER_STARTED_MOVING")
CheckPetWQs:SetScript("OnEvent", function(self, event, ...)
	CheckPetWQs:UnregisterEvent ("PLAYER_ENTERING_WORLD")
	CheckPetWQs:UnregisterEvent ("PLAYER_STARTED_MOVING")

	local inInstance, instanceType = IsInInstance()
	if(inInstance) then
		return
	end
	
	if(runonce == true) then
		runonce = false;
		C_Timer.After(2, function() PreDoChecks(false, true) end)
	end
end)

local function CheckTarget(textCol, name, tamer, achIDorder, achIDtoName, levelCheck)
	if tamer == name then
		local _, _, petLevel1, _, _, _, _, _, _, petType1 = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(1))
		local _, _, petLevel2, _, _, _, _, _, _, petType2 = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(2))
		local _, _, petLevel3, _, _, _, _, _, _, petType3 = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(3))
		--print (typeID[petType1] .. " " .. typeID[petType2] .. " " .. typeID[petType3])
		
		if(petType1 == petType2 and petType2 == petType3) then
			for order,achID in ipairs(achIDorder[useOrder]) do
				if(achIDtoName[achID] ~= nil) then
					local achName = achIDtoName[achID][1]
					local achType = achIDtoName[achID][2]
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)
						if(cDesc == tamer and achType == typeID[petType1] and cComp == true) then
							print(textCol .. "CheckPetWQs" .. colReset .. ": Already completed " .. achType .. " for " .. tamer .. ".")
							return;
						elseif(levelCheck and (petLevel1 < 25 or petLevel2 < 25 or petLevel3 < 25)) then
							print(textCol .. "CheckPetWQs" .. colReset .. ": One of your pets isn't 25, it might not count for this achievement.")
							return
						end
					end
				end
			end
		else
			print(textCol .. "CheckPetWQs" .. colReset .. ": Your team is not all the same type.")
		end
	end
end

local frame2 = CreateFrame("Frame")
frame2:RegisterEvent("PLAYER_TARGET_CHANGED")
frame2:SetScript("OnEvent", function(self, event, ...)
	local name = UnitName("target")
	local currentAreaID = C_Map.GetBestMapForUnit("player")
	
	if(addon.config.profile.notifyWarnings and UnitInRaid("player") ~= 1 and name ~= nil) then
		if(zones70Legion[currentAreaID] ~= null) then
			for qID,tamer in pairs(quest70Family) do
				CheckTarget(colPink, name, tamer, ach70FamilyIDorder, ach70FamilyIDtoName, false)
			end
		end

		if(zones73Legion[currentAreaID] ~= null) then
			for qID,nInfo in pairs(npc73) do
				CheckTarget(colPurple, name, nInfo[1], ach73FamilyIDorder, ach73FamilyIDtoName, false)
			end
		end
	end
	
	if(addon.config.profile.notifyWarningsFB and UnitInRaid("player") ~= 1 and name ~= nil) then
		if(zones80BattleZan[currentAreaID] ~= null) then
			for order,zInfo in ipairs(quest81Family) do
				for qID,nInfo in pairs(zInfo) do
					CheckTarget(colRed, name, nInfo[1], ach81FamilyIDorder, ach81FamilyIDtoName, true)
				end
			end
		end
		
		if(zones80BattleKul[currentAreaID] ~= null) then
			for order,zInfo in ipairs(quest81Family) do
				for qID,nInfo in pairs(zInfo) do
					CheckTarget(colBlue, name, nInfo[1], ach81FamilyIDorder, ach81FamilyIDtoName, true)
				end
			end
		end
	end
	
	if(addon.config.profile.notifyWarningsFE and UnitInRaid("player") ~= 1 and name ~= nil) then
		if(zones90Shadow[currentAreaID] ~= null) then
			for order,zInfo in ipairs(quest90Family) do
				for qID,nInfo in pairs(zInfo) do
					CheckTarget(colOrange, name, nInfo[1], ach90FamilyIDorder, ach90FamilyIDtoName, true)
				end
			end
		end
	end
	
	if(addon.config.profile.notifyWarningsFBDI and UnitInRaid("player") ~= 1 and name ~= nil) then
		if(zones100Dragon[currentAreaID] ~= null) then
			for order,zInfo in ipairs(quest100Family) do
				for qID,nInfo in pairs(zInfo) do
					CheckTarget(colDragonflight1, name, nInfo[1], ach100FamilyIDorder, ach100FamilyIDtoName, true)
				end
			end
		end
	end
end)

SLASH_CHECKPETWQS1 = '/checkpetwqs';
SLASH_CHECKPETWQS2 = '/ff';
SLASH_CHECKPETWQS3 = '/cpwqs';
SLASH_CHECKPETWQS4 = '/cpwq';
function SlashCmdList.CHECKPETWQS(msg, editbox)
	if(msg == "map") then
		local playerMapID = C_Map.GetBestMapForUnit("player");
		local worldMapID = WorldMapFrame:GetMapID();
		
		local playerMapinfo = C_Map.GetMapInfo(playerMapID);
		local worldMapinfo = C_Map.GetMapInfo(worldMapID);
		
		print(format("You are in %s (%d)", playerMapinfo.name, playerMapID));
		
		if(playerMapID ~= worldMapID) then
			print(format("Looking at %s (%d)", worldMapinfo.name, worldMapID));
		end
	else
		runonce = false;
		PreDoChecks(true, true)
	end
end

local defaults = {
	profile = {
		autoDragonAch = true,
		autoShadowAch = true,
		autoBattleAch = true,
		autoIslesAch = true,
		orderTypesAlpha = false,
		notifyWarningsFB = false,
		notifyWarningsFE = true,
		notifyWarningsFBDI = true,
		autoWindow = true,
		popupShowFBZL = true,
		popupShowFBDI = true,
		popupShowFE = true,
		popupShowFB = true,
		popupShowFF = true,
		notifyNoFF = true,
		notifyWarnings = true, --Check team when targeting tamer
		notifyShowQuestName = false,
		notifyRewardItemsDragon = true,
		notifyRewardItemsShadow = false,
		notifyRewardItemsBattle = false,
		notifyRewardItemsLegion = false,
		rewardVisible = {
			[86143] = false, --Battle Pet Bandage
			[163036] = true, --Polished Pet Charm
		
			[92682] = true,
			[92683] = true,
			[98715] = true,
			[127755] = true,
			[122457] = true,
			[92665] = true,
			[92675] = true,
			[92676] = true,
			[92677] = true,
			[92678] = true,
			[92679] = true,
			[92680] = true,
			[92681] = true,
			[92741] = true,
		}
	}
}

local function getConfigOptions()
	local options = {
		name = addon_name,
		type = 'group',
		args = {
			sectionGeneral = {
				type = 'group',
				name = "General",
				order = 10,
				inline = true,
				args = {
					autoDragonAch = {
						type = "toggle",
						name = "Battle on the Dragon Isles",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoDragonAch = val; end,
						get = function(info) return addon.config.profile.autoDragonAch end,
						order = 1,
					},
					autoShadowAch = {
						type = "toggle",
						name = "Battle in the Shadowlands",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoShadowAch = val; end,
						get = function(info) return addon.config.profile.autoShadowAch end,
						order = 2,
					},
					autoBattleAch = {
						type = "toggle",
						name = "Battle on Zandalar and Kul Tiras",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoBattleAch = val; end,
						get = function(info) return addon.config.profile.autoBattleAch end,
						order = 3,
					},
					autoIslesAch = {
						type = "toggle",
						name = "Battle on the Broken Isles",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoIslesAch = val; end,
						get = function(info) return addon.config.profile.autoIslesAch end,
						order = 4,
					},
					orderTypesAlpha = {
						type = "toggle",
						name = "Order Types Alphabetically",
						width = 1.6,
						set = function(info,val)
							addon.config.profile.orderTypesAlpha = val;
							if(fA:IsShown()) then PreDoChecks(true, false) end
						end,
						get = function(info) return addon.config.profile.orderTypesAlpha end,
						order = 4,
					},
				}
			},
			sectionFamilyBattlerZaralekCavern = {
				type = 'group',
				name = "Dragonflight: Battler of Zaralek Cavern",
				order = 15,
				inline = true,
				args = {
					popupShowFBZL = {
						type = "toggle",
						name = "Show in popup",
						width = 1.6,
						set = function(info,val) addon.config.profile.popupShowFBZL = val; end,
						get = function(info) return addon.config.profile.popupShowFBZL end,
						order = 1,
					},
					notifyWarningsFBZL = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarningsFBZL = val; end,
						get = function(info) return addon.config.profile.notifyWarningsFBZL end,
						order = 2,
					}
				}
			},
			sectionFamilyBattlerDragonIsles = {
				type = 'group',
				name = "Dragonflight: Battler of the Dragon Isles",
				order = 15,
				inline = true,
				args = {
					popupShowFBDI = {
						type = "toggle",
						name = "Show in popup",
						width = 1.6,
						set = function(info,val) addon.config.profile.popupShowFBDI = val; end,
						get = function(info) return addon.config.profile.popupShowFBDI end,
						order = 1,
					},
					notifyWarningsFBDI = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarningsFBDI = val; end,
						get = function(info) return addon.config.profile.notifyWarningsFBDI end,
						order = 2,
					}
				}
			},
			sectionFamilyExorcist = {
				type = 'group',
				name = "Shadowlands: Family Exorcist",
				order = 20,
				inline = true,
				args = {
					popupShowFE = {
						type = "toggle",
						name = "Show in popup",
						width = 1.6,
						set = function(info,val) addon.config.profile.popupShowFE = val; end,
						get = function(info) return addon.config.profile.popupShowFE end,
						order = 1,
					},
					notifyWarningsFE = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarningsFE = val; end,
						get = function(info) return addon.config.profile.notifyWarningsFE end,
						order = 2,
					}
				}
			},
			sectionFamilyBattler = {
				type = 'group',
				name = "Battle for Azeroth: Family Battler",
				order = 30,
				inline = true,
				args = {
					popupShowFB = {
						type = "toggle",
						name = "Show in popup",
						width = 1.6,
						set = function(info,val) addon.config.profile.popupShowFB = val; end,
						get = function(info) return addon.config.profile.popupShowFB end,
						order = 1,
					},
					notifyWarningsFB = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarningsFB = val; end,
						get = function(info) return addon.config.profile.notifyWarningsFB end,
						order = 2,
					}
				}
			},
			sectionLegion = {
				type = 'group',
				name = "Legion: Family Familiar and Family Fighter",
				order = 40,
				inline = true,
				args = {
					autoWindow = {
						type = "toggle",
						name = "Automatically open window",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoWindow = val; end,
						get = function(info) return addon.config.profile.autoWindow end,
						order = 1,
					},
					notifyNoFF = {
						type = "toggle",
						name = "Notify when there's no available quests",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyNoFF = val; end,
						get = function(info) return addon.config.profile.notifyNoFF end,
						order = 2,
					},
					popupShowFF = {
						type = "toggle",
						name = "Show in popup",
						width = 1.6,
						set = function(info,val) addon.config.profile.popupShowFF = val; end,
						get = function(info) return addon.config.profile.popupShowFF end,
						order = 3,
					},
					notifyWarnings = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarnings = val; end,
						get = function(info) return addon.config.profile.notifyWarnings end,
						order = 4,
					}
				}
			},
			sectionRewards = {
				type = 'group',
				name = "Reward Notifications",
				order = 50,
				inline = true,
				args = {
					notifyShowQuestName= {
						type = "toggle",
						name = "Show quest name",
						width = "normal",
						set = function(info,val) addon.config.profile.notifyShowQuestName = val; end,
						get = function(info) return addon.config.profile.notifyShowQuestName end,
						order = 1,
					},
					notifyRewardItemsDragon= {
						type = "toggle",
						name = "Dragonflight",
						width = "normal",
						set = function(info,val) addon.config.profile.notifyRewardItemsDragon = val; end,
						get = function(info) return addon.config.profile.notifyRewardItemsDragon end,
						order = 2,
					},
					notifyRewardItemsShadow = {
						type = "toggle",
						name = "Shadowlands",
						width = "normal",
						set = function(info,val) addon.config.profile.notifyRewardItemsShadow = val; end,
						get = function(info) return addon.config.profile.notifyRewardItemsShadow end,
						order = 3,
					},
					notifyRewardItemsBattle = {
						type = "toggle",
						name = "Battle for Azeroth",
						width = "normal",
						set = function(info,val) addon.config.profile.notifyRewardItemsBattle = val; end,
						get = function(info) return addon.config.profile.notifyRewardItemsBattle end,
						order = 4,
					},
					notifyRewardItemsLegion = {
						type = "toggle",
						name = "Legion",
						width = "normal",
						set = function(info,val) addon.config.profile.notifyRewardItemsLegion = val; end,
						get = function(info) return addon.config.profile.notifyRewardItemsLegion end,
						order = 5,
					},
					notifyRewardsLabel = {
						type = "description",
						name = "Mass change below:",
						order = 6,
					},
					allTick = {
						type = "execute",
						name = "Tick",
						width = "half",
						func = function()
							for id, reward in next, rewardList do
								addon.config.profile.rewardVisible[id] = true
							end
						end,
						order = 7
					},
					allUntick = {
						type = "execute",
						name = "Untick",
						width = "half",
						func = function()
							for id, reward in next, rewardList do
								addon.config.profile.rewardVisible[id] = false
							end
						end,
						order = 8
					},
					rewardVisible = {
						type = "multiselect",
						name = "Check for rewards",
						values = rewardList,
						set = function(info, key,val) addon.config.profile.rewardVisible[key] = val; end,
						get = function(info, key) return addon.config.profile.rewardVisible[key] end,
						order = 9
					}
				}
			}
		}
	}
	
	return options;
end

function addon:OnInitialize()
	self.config = LibStub("AceDB-3.0"):New("CheckPetWQsConfig", defaults, true)
    self.options = getConfigOptions()
    
    LibStub("AceConfig-3.0"):RegisterOptionsTable(self.name, self.options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(self.name, self.name, nil)
end