local L =  LibStub("AceLocale-3.0"):GetLocale("RaidTracker", true)

--[[
 Conventions: Tags [TAQ], Real Name [Ahn'Qiraj], Display Name [Ahn'Qiraj Temple]
   tags         - for having a unique identifier for a zone reguardles of anyting else, changesin game, locale or whatever
   real name    - for mappign when GetRealZowenName is called in an instance, is the locale specific real instance name
   display name - the map name which is also locale specific for a zone
]]

RaidTracker_Tags = {		-- tag = zone trigger name
	-- releases
	["REL0"]	= "World Event",
	["REL1"]	= "Classic",
	["REL2"]	= "The Burning Crusades",
	["REL3"]	= "Wrath of the Lich King",

	-- zones
	["WB"]		= "World Boss",
	["KM"]		= "Kalimdor",
	["KM:DWM"]	=  "Dustwallow Marsh",
	["KM:SIL"]	=  "Silithus",
	["KM:TAN"]	=  "Tanaris",
	["EK"]		= "Eastern Kingdoms",
	["EK:BRM"]	=  "Blackrock Mountain",
	["EK:STV"]	=  "Stranglethorn Vale",
	["EK:DWP"]	=  "Deadwind Pass",
	["EK:EPL"]	=  "Easterm Plaguelands",
	["OL"]		= "Outlands",
	["OL:BEM"]	=  "Blade's Edge Mountains",
	["NR"]		= "Northrend",
	["NR:BRT"]	=  "Borean Tundra",
	["NR:CLD"]	=  "Coldarra",
	["NR:NEX"]	=  "The Nexus",
	["NR:UTG"]	=  "Utgarde Keep",
	["NR:PON"]	=  "Pit of Narjun",
	["NR:DAL"]	=  "Dalaran",
	["NR:UDR"]	=  "Ulduar",
	["NR:ZDK"]	=  "Zul'Drak",
	["NR:WRT"]	=  "Wyrmrest Temple",
	["NR:WRT"]	=  "Wintergrasp Keep",
	["NR:ICR"]	=  "Icecrown",
	["NR:ATG"]	=  "Argent Tournament Grounds",
	["NR:ICG"]	=  "Icecrown Glacier",
}

RaidTracker_GameReleases = { 3, 2, 1, 0, }; 

RaidTracker_Zones = {
	-- ALL
	["World Boss"]					= { id=0,  pid=0,  rel=0, tag="", loc="WB",     type="Raid",  man=40, min=0,  ran="60",		name="World Boss", },
	-- CLASIC
	["Teldrassil"]					= { id=0,  pid=0,  rel=1, tag="", loc="KM",		type="Raid",  man=40, min=58, ran="1-12",	name="Teldrassil", },
	["Molten Core"]					= { id=1,  pid=4,  rel=1, tag="", loc="EK:BRM", type="Raid",  man=40, min=58, ran="60+",	name="Molten Core", },
	["Blackwing Lair"]				= { id=2,  pid=6,  rel=1, tag="", loc="EK:BRM", type="Raid",  man=40, min=60, ran="60++",	name="Blackwing Lair", },
	["Onyxia's Lair1"]				= { id=3,  pid=5,  rel=1, tag="", loc="KM:DWM", type="Raid",  man=40, min=58, ran="60+",	name="Onyxia's Lair", },
	["Zul'Gurub"]					= { id=4,  pid=1,  rel=1, tag="", loc="EK:STV", type="Raid",  man=20, min=56, ran="60",		name="Zul'Gurub", },
	["Ruins of Ahn'Qiraj"]			= { id=5,  pid=2,  rel=1, tag="", loc="KM:TAN", type="Raid",  man=20, min=58, ran="60",		name="Ruins of Ahn'Qiraj", },
	["Ahn'Qiraj"]					= { id=6,  pid=3,  rel=1, tag="", loc="KM:TAN", type="Raid",  man=40, min=60, ran="60+",	name="Ahn'Qiraj", },
	["Naxxramas1"]					= { id=7,  pid=7,  rel=1, tag="", loc="EK:STV", type="Raid",  man=40, min=60, ran="60+++",	name="Naxxramas", },
	-- TBC
	["Karazhan"]					= { id=8,  pid=8,  rel=2, tag="", loc="EK:DWP", type="Raid",  man=10, min=68, ran="70+",	name="Karazhan", },
	["Gruul's Lair"]				= { id=9,  pid=9,  rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=68, ran="70+",	name="Gruul's Lair", },
	["Magtheridon's Lair"]			= { id=10, pid=10, rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=68, ran="70+",	name="Magtheridon's Lair", },
	["Serpentshrine Cavern"]		= { id=11, pid=12, rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=70, ran="70++",	name="Serpentshrine Cavern", },
	["Tempest Keep"]				= { id=12, pid=13, rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=70, ran="70++",	name="Tempest Keep", },
	["Hyjal Summit"]				= { id=13, pid=14, rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=70, ran="70+++",	name="Hyjal Summit", },
	["Black Temple"]				= { id=14, pid=15, rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=70, ran="70+++",	name="Black Temple", },
	["Zul'Aman"]					= { id=15, pid=11, rel=2, tag="", loc="OL:BEM", type="Raid",  man=10, min=70, ran="70++",	name="Zul'Aman", },
	["Sunwell Plateau"]				= { id=16, pid=16, rel=2, tag="", loc="OL:BEM", type="Raid",  man=25, min=70, ran="70+++",	name="Sunwell Plateau", },
	-- WOTLK
	["Utgarde Keep"]				= { id=17, pid=17, rel=3, tag="", loc="NR:UTG", type="Party", man=5,  min=65, ran="70-72",	name="Utgarde Keep", },
	["The Nexus"]					= { id=18, pid=18, rel=3, tag="", loc="NR:NEX", type="Party", man=5,  min=66, ran="71-73",	name="The Nexus", },
	["Azjol-Nerub"]					= { id=19, pid=19, rel=3, tag="", loc="NR:PON", type="Party", man=5,  min=67, ran="72-74",	name="Azjol-Nerub", },
	["Ahn'kahet: The Old Kingdom"]	= { id=20, pid=20, rel=3, tag="", loc="NR:PON", type="Party", man=5,  min=68, ran="73-75",	name="Ahn'kahet: The Old Kingdom", },
	["Drak'Tharon Keep"]			= { id=21, pid=21, rel=3, tag="", loc="NR:ZDK", type="Party", man=5,  min=69, ran="74-76",	name="Drak'Tharon Keep", },
	["The Violet Hold"]				= { id=22, pid=22, rel=3, tag="", loc="NR:DAL", type="Party", man=5,  min=70, ran="75-77",	name="The Violet Hold", },
	["Gundrak"]						= { id=23, pid=23, rel=3, tag="", loc="NR:ZDK", type="Party", man=5,  min=71, ran="76-78",	name="Gundrak", },
	["Halls of Stone"]				= { id=24, pid=24, rel=3, tag="", loc="NR:UDR", type="Party", man=5,  min=72, ran="77-79",	name="Halls of Stone", },
	["The Oculus"]					= { id=25, pid=25, rel=3, tag="", loc="NR:NEX", type="Party", man=5,  min=75, ran="80",		name="The Oculus", },
	["Utgarde Pinnacle"]			= { id=26, pid=26, rel=3, tag="", loc="NR:UTG", type="Party", man=5,  min=75, ran="80",		name="Utgarde Pinnacle", },
	["The Culling of Stratholme"]	= { id=27, pid=27, rel=3, tag="", loc="KM:TAN", type="Party", man=5,  min=75, ran="80",		name="The Culling of Stratholme", },
	["Halls of Lightning"]			= { id=28, pid=28, rel=3, tag="", loc="NR:UDR", type="Party", man=5,  min=75, ran="80",		name="Halls of Lightning", },
	["Naxxramas"]					= { id=29, pid=33, rel=3, tag="", loc="NR:NEX", type="Raid",  man=10, min=78, ran="80+",	name="Naxxramas", },
	["The Obsidian Sanctum"]		= { id=30, pid=34, rel=3, tag="", loc="NR:WRT", type="Raid",  man=10, min=78, ran="80+",	name="The Obsidian Sanctum", },
	["Vault of Archavon"]			= { id=31, pid=35, rel=3, tag="", loc="NR:WGK", type="Raid",  man=10, min=78, ran="80+",	name="Vault of Archavon", },
	["The Eye of Eternity"]			= { id=32, pid=36, rel=3, tag="", loc="NR:NEX", type="Raid",  man=10, min=80, ran="80++",	name="The Eye of Eternity", },
	["Ulduar"]						= { id=33, pid=37, rel=3, tag="", loc="NR:UDR", type="Raid",  man=10, min=80, ran="80++",   name="Ulduar", },
	["Trial of the Champion"]		= { id=34, pid=29, rel=3, tag="", loc="NR:ICR", type="Party", man=5,  min=80, ran="80+",	name="Trial of the Champion", },
	["Trial of the Crusader"]		= { id=35, pid=38, rel=3, tag="", loc="NR:ICR", type="Raid",  man=10, min=80, ran="80+++",	name="Trial of the Crusader", },
	["Onyxia's Lair"]				= { id=36, pid=39, rel=3, tag="", loc="KM:DWM", type="Raid",  man=10, min=80, ran="80+++",	name="Onyxia's Lair", },
	["The Forge of Souls"]			= { id=37, pid=30, rel=3, tag="", loc="NR:ICG", type="Party", man=5,  min=80, ran="80++",	name="The Forge of Souls", },
	["Pit of Saron"]				= { id=38, pid=31, rel=3, tag="", loc="NR:ICG", type="Party", man=5,  min=80, ran="80++",	name="Pit of Saron", },
	["Halls of Reflection"]			= { id=39, pid=32, rel=3, tag="", loc="NR:ICG", type="Party", man=5,  min=80, ran="80++",	name="Halls of Reflection", },
	["Icecrown Citadel"]			= { id=36, pid=40, rel=3, tag="", loc="NR:ICG", type="Raid",  man=10, min=80, ran="80++++", name="Icecrown Citadel", },
}

-- is realy just a lookup menu drop down list atm
--   realy nice if to not just waste on dropdowns
RaidTracker_ZoneBosses = {
	["Trash mob"] = 1,

	["World Boss"] = {
		"Lord Kazzak", "Azuregos",													-- raid, tainted scar in blasted lands, Southeast Azshara
		"Emeriss", "Lethon", "Ysondre", "Taerar",									-- raid, emarlad dragons Duskwood (Twilight Grove), the Hinterlands (Seradane), Feralas (Dream Bough), and Ashenvale (Bough Shadow). 
		"Lord Skwol", "Baron Kazum", "High Marshal Whirlaxis", "Prince Skaldrenox", -- raid, silithus
		"Avalanchion", "Baron Charr", "Princess Tempestria", "The Windreaver",		-- party, elemental, azshara, unguro, Ruins of Kel'Theril in Winterspring, silithus
		-- tbc
		"Highlord Kruul", "Doom Lord Kazzak", "Doomwalker",
		-- wotlk
	},
	-- Classic	
	["Teldrassil"] = { "Nightsaber Stalker", },
	["Molten Core"] = { "Lucifron", "Magmadar",	"Gehennas", "Garr", "Baron Geddon", "Shazzrah", "Sulfuron Harbinger", "Golemagg the Incinerator", "Majordomo Executus", "Ragnaros", },
	["Blackwing Lair"] = { "Razorgore the Untamed", "Vaelastrasz the Corrupt", "Broodlord Lashlayer", "Firemaw", "Ebonroc", "Flamegor",	"Chromaggus", "Nefarian", },
	["Zul'Gurub"] = { "High Priestess Jeklik", "High Priest Venoxis", "High Priestess Mar'li", "High Priest Thekal", "High Priestess Arlokk", "Hakkar", "Bloodlord Mandokir", "Jin'do the Hexxer", "Gahz'ranka", "Hazza'rah", "Gri'lek", "Renataki", "Wushoolay", },		
	["Ahn'Qiraj"] = { "The Prophet Skeram", "Fankriss the Unyielding", "Battleguard Sartura", "Princess Huhuran", "Twin Emperors", "C'Thun", "Vem", "Princess Yauj", "Lord Kri", "Viscidus", "Ouro", },
	["Ruins of Ahn'Qiraj"] = { "Kurinnaxx", "General Rajaxx", "Ayamiss the Hunter", "Moam", "Buru the Gorger", "Ossirian the Unscarred", },
	-- TBC
	["Karazhan"] = { "Attumen the Huntsman", "Moroes", "Maiden of Virtue",
		["Theater Event"] = { "Unknown", "The Crone", "The Big Bad Wolf", "Romulo and Julianne", },
		"The Curator", "Terestian Illhoof",	"Shade of Aran", "Chess Event", "Prince Malchezaar", "Netherspite", "Nightbane",
		"Rokad the Ravager", "Hyakiss the Lurker", "Shadikith the Glider", "Echo of Medivh", "Image of Medivh",	},
	["Gruul's Lair"] = { "High King Maulgar", "Gruul the Dragonkiller", },
	["Magtheridon's Lair"] = { "Magtheridon", },
	["Serpentshrine Cavern"] = { "Hydross the Unstable", "The Lurker Below", "Leotheras the Blind", "Fathom-Lord Karathress", "Morogrim Tidewalker", "Lady Vashj", },
	["Caverns Of Time"] = { "Unknown", },
	["Black Temple"] = { "High Warlord Naj'entus", "Supremus", "Gurtogg Bloodboil", "Teron Gorefiend", "Shade of Akama", "Reliquary of Souls", "Mother Shahraz", "Illidari Council", "Illidan Stormrage", },
	["Tempest Keep"] = { "Al'ar", "High Astromancer Solarian", "Void Reaver", "Kael'thas Sunstrider", },
	["Hyjal Summit"] = { "Rage Winterchill", "Anetheron", "Kaz'rogal", "Azgalor", "Archimonde", },
	["Zul'Aman"] = { "Nalorakk", "Akil'zon", "Jan'alai", "Halazzi", "Witch Doctor", "Hex Lord Malacrass", "Zul'jin", },
	["Sunwell Plateau"] = { "Kalecgos", "Sathrovarr the Corruptor", "Brutallus", "Felmyst", "Eredar Twins", "Entropius", "Kil'jaeden", },
	-- WOTLK
	["Utgarde Keep"] = { "Dalronn the Controller", "Skarvald the Constructor", "Constructor & Controller", "Ingvar the Plunderer", "Prince Keleseth", },  -- "Constructor & Controller", --these are one encounter, so we do as an encounter name
	["The Nexus"] = { "Anomalus", "Commander Stoutbeard", "Grand Magus Telestra", "Keristrasza", "Ormorok the Tree-Shaper", },
	["Azjol-Nerub"] = { "Anub'arak", "Hadronox", "Krik'thir the Gatewatcher", },
	["Ahn'kahet: The Old Kingdom"]	= { "Amanitar", "Elder Nadox", "Herald Volazj", "Jedoga Shadowseeker", "Prince Taldaram", },
	["Drak'Tharon Keep"] = { "King Dred", "Novos the Summoner", "The Prophet Tharon'ja", "Trollgore", },
	["The Violet Hold"] = { "Cyanigosa", "Erekem", "Ichoron", "Lavanthor", "Moragg", "Xevozz", "Zuramat the Obliterator", },
	["Gundrak"] = { "Eck the Ferocious", "Drakkari Colossus", "Gal'darah", "Moorabi", "Slad'ran", },
	["Halls of Stone"] = { "Krystallus", "Maiden of Grief", "Sjonnir The Ironshaper", "The Tribunal of Ages", },
	["The Oculus"] = { "Drakos the Interrogator", "Ley-Guardian Eregos", "Mage-Lord Urom", "Varos Cloudstrider", },
	["Utgarde Pinnacle"] = { "Skadi the Ruthless", "King Ymiron", "Svala Sorrowgrave", "Gortok Palehoof", },
	["The Culling of Stratholme"] = { "Meathook", "Chrono-Lord Epoch", "Mal'Ganis", "Salramm the Fleshcrafter", },
	["Halls of Lightning"] = { "General Bjarngrim", "Ionar", "Loken", "Volkhan", },
	["Naxxramas"] = { "Patchwerk", "Grobbulus", "Gluth", "Thaddius", "Instructor Razuvious", "Gothik the Harvester", "Highlord Mograine",
		"Baron Rivendare", "Thane Korth'azz", "Lady Blaumeux", "Sir Zeliek", "The Four Horsemen", "Noth the Plaguebringer",
		"Heigan the Unclean", "Loatheb", "Anub'Rekhan", "Grand Widow Faerlina", "Maexxna", "Sapphiron", "Kel'Thuzad", },
	["The Obsidian Sanctum"] = { "Sartharion", "Shadron", "Tenebron", "Vesperon", },
	["Vault of Archavon"] = { "Archavon the Stone Watcher", "Emalon the Storm Watcher", "Koralon the Flame Watcher", "Toravon the Ice Watcher", },
	["The Eye of Eternity"] = { "Malygos", },
	["Ulduar"] = { "Flame Leviathan", "Ignis the Furnace Master", "Razorscale", "XT-002 Deconstructor", "The Iron Council", "Steelbreaker", "Runemaster Molgeim", "Stormcaller Brundir",
		"Kologarn", "Auriaya", "Mimiron", "Freya", "Thorim", "Hodir", "General Vezax", "Yogg-Saron", "Algalon the Observer", },
	["Trial of the Champion"] = { "Deathstalker Visceri", "Eressea Dawnsinger", "Mokra the Skullcrusher", "Runok Wildmane", "Zul'tore", "Ambrose Boltspark", 
		"Colosos", "Jacob Alerius", "Jaelyne Evensong", "Lana Stouthammer", "Argent Confessor Paletress", "Eadric the Pure", "The Black Knight", },
	["Trial of the Crusader"] = { "Anub'arak", "Faction Champions", "Lord Jaraxxus", "The Beasts of Northrend", "The Twin Val'kyr", },
	["Onyxia's Lair"] = { "Onyxia", },
	["The Forge of Souls"]	= { "Bronjahm", "Devourer of Souls", },
	["Pit of Saron"]	= { "Forgemaster Garfrost", "Smelting wife's father Garfrost", "Krick and Ick", "Krick", "Ick", "Scourgelord Tyrannus", },
	["Halls of Reflection"]	= { "Falric", "Marwyn", "The Lich King", },
	["Icecrown Citadel"]	= { 
		"Lord Marrowgar", "Lady Deathwhisper", "Icecrown Gunship Battle", "Deathbringer Saurfang",
		"Festergut", "Rotface", "Professor Putricide", "Blood Princes",
		"Blood-Queen Lana'thel", "Valithria Dreamwalker", "Sindragosa", "The Lich King", },
}

RaidTracker_Bosses = {
	DEFAULTBOSS = "Trash mob",
	-- MC
	Majordomo = "Majordomo Executus",					-- yell temp hack
	-- BWL
	["Lord Victor Nefarius"] = "Nefarian",
	-- AQ
	["Emperor Vek'lor"] = "Twin Emperors",
	["Emperor Vek'nilash"] = "Twin Emperors",
	-- Naxx
	["Baron Rivendare"] = "The Four Horsemen",
	["Lady Blaumeux"] = "The Four Horsemen",
	["Sir Zeliek"] = "The Four Horsemen",
	["Thane Korth'azz"] = "The Four Horsemen",
	--Karazhan
	["Rokad the Ravager"] = "Rokad the Ravager",		-- animal boss, make it event
	["Hyakiss the Lurker"] = "Hyakiss the Lurker",		-- animal boss, make it event
	["Shadikith the Glider"] = "Shadikith the Glider",	-- animal boss, make it event
	["The Big Bad Wolf"] = "The Big Bad Wolf",
	["The Crone"] = "The Crone",
	["Julianne"] = "Romulo and Julianne",
	["Chess Event"] = "Chess Event",
	["Echo of Medivh"] = "Echo of Medivh",				-- leave as possible mouse-over trigger for chess
	["Image of Medivh"] = "Image of Medivh",			-- leave as possible mouse-over trigger for nightbane
	--Black Temple
	["Essence of Anger"] = "Reliquary of Souls",
	["Gathios the Shatterer"] = "Illidari Council",
	["High Nethermancer Zerevor"] = "Illidari Council",
	["Lady Malande"] = "Illidari Council",
	["Veras Darkshadow"] = "Illidari Council",
	--Sunwell Plateau
	["Kalecgos"] =  "IGNORE", -- Kalecgos
	["Sathrovarr the Corruptor"] = "Kalecgos",
	Sathrovarr = "Kalecgos",							-- temp yell hack
	["Lady Sacrolash"] = "Eredar Twins",
	["Grand Warlock Alythess"] = "Eredar Twins",
	-- Ulduar
	["Steelbreaker"] = "The Iron Council",
	["Runemaster Molgeim"] = "The Iron Council",
	["Stormcaller Brundir"] = "The Iron Council",
	Molgeim = "The Iron Council",
	Brundir = "The Iron Council",						-- temp to patch the yell
	Ignis = "Ignis the Furnace Master",
	-- Trial of the Crusader
	["Gormok the Impaler"] = "The Beasts of Northrend", 
	["Acidmaw"] = "The Beasts of Northrend", 
	["Dreadscale"] = "The Beasts of Northrend", 
	["Icehowl"] = "The Beasts of Northrend", 
	["Eydis Darkbane"] = "The Twin Val'kyr", 
	["Fjola Lightbane"] = "The Twin Val'kyr",	
	Twin_Valkyr = "The Twin Val'kyr",
	Anubarak = "Anub'arak",
	["Gorgrim Shadowcleave"] = "Faction Champions", 
	["Birana Stormhoof"] = "Faction Champions", 
	["Erin Misthoof"] = "Faction Champions", 
	["Ruj'kah"] = "Faction Champions", 
	["Ginselle Blightslinger"] = "Faction Champions", 
	["Liandra Suncaller"] = "Faction Champions", 
	["Malithas Brightblade"] = "Faction Champions", 
	["Caiphus the Stern"] = "Faction Champions", 
	["Vivienne Blackwhisper"] = "Faction Champions", 
	["Maz'dinah"] = "Faction Champions", 
	["Thrakgar"] = "Faction Champions", 
	["Broln Stouthorn"] = "Faction Champions", 
	["Harkzog"] = "Faction Champions", 
	["Narrhok Steelbreaker"] = "Faction Champions", 
	["Krick"] = "Krick and Ick",
	["Ick"] = "Krick and Ick",
	-- Icecrown Citadel
	["Valanar"] = "Blood Princes",
	["Keleseth"] = "Blood Princes",
	["Taldaram"] = "Blood Princes",
	Gunship_Battle = "Icecrown Gunship Battle",
	Valithria = "Valithria Dreamwalker",
}


local t = RaidTracker_Bosses
for k,v in pairs(RaidTracker_ZoneBosses) do
	if type(v) == "table" then
		for k1,v1 in pairs(v) do
			if type(v1) ~= "table" then
				if not t[v1] then t[v1] = v1 end
			end
		end
	end
end

