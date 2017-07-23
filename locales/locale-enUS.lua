local L = LibStub("AceLocale-3.0", true):NewLocale("RaidTracker", "enUS", true)
if not L then return end

RT_ITEMREG =       "(|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:(%-?%d+):(%-?%d+):(%-?%d+)|h%[.-%]|h|r)%"
RT_ITEMREG_MULTI = "(|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:(%-?%d+):(%-?%d+):(%-?%d+)|h%[.-%]|h|r)x(%d+)%"

-- addon messages
L["Added %s to the selected raid."] = true
L["Item Options"] = true
L["Show Item Options"] = true
L["additem"] = true
L["%s: Must supply an item link and a player name."] = true
L["%s: There is no raid selected"] = true
L["%s: Could not add %s"] = true
L["%s: Must be a current open raid."] = true
L["/rt - Shows the main window."] = true
L["/rt options|o - Shows Options window"] = true
L["/rt io - Shows the ItemOptions window"] = true
L["/rt io [ITEMLINK|ITEMID]... - Adds items to ItemOptions window"] = true
L["/rt additem [ITEMLINK] [PLAYER] - Adds a loot item to the selected raid"] = true
L["/rt join [PLAYER] - Add a player to the selected raid"] = true
L["/rt leave [PLAYER] - Removes a player from the selected raid"] = true
L["/rt deleteall - Deletes all raids"] = true
L["/rt debug 1|0 - Enables/Disables debug mode"] = true
L["/rt addwipe - Adds a Wipe with the current timestamp"] = true

-- functional strings (must match the game strings exactly)
L.LeftRaid = "([^%s]+) has left the raid group"
L.LeftParty = "([^%s]+) leaves the party"
L.LeftParty2 = "Your group has been disbanded"
L.ReceivesLoot1 = "([^%s]+) receives loot: "..RT_ITEMREG.."."
L.ReceivesLoot2 = "You receive loot: "..RT_ITEMREG.."."
L.ReceivesLoot3 = "([^%s]+) receives loot: "..RT_ITEMREG_MULTI.."."
L.ReceivesLoot4 = "You receive loot: "..RT_ITEMREG_MULTI.."."
L.ReceivesLootYou = "You receive loot: "..RT_ITEMREG_MULTI.."."

L.Yell_Majordomo = "Impossible! Stay your attack, mortals... I submit! I submit!"
L["Yell_Chess Event"] = "Karazhan - Chess, Victory Controller"
L.Yell_Julianne = "O happy dagger! This is thy sheath; there rust, and let me die!"
L.Yell_Sathrovarr = "I'm... never on... the losing... side..."
-- naxx
L.Yell_Steelbreaker = "Impossible..."								-- Iron Council Hardmode / Steelbreaker last
L.Yell_Brundir = "You rush headlong into the maw of madness!"					-- Iron Council Normalmode / Brundir last
L.Yell_Molgeim = "What have you gained from my defeat? You are no less doomed, mortals!"	-- Iron Council Semimode / Molgeim last
-- ulduar
L.Yell_Freya = "His hold on me dissipates. I can see clearly once more. Thank you, heroes."
L.Yell_Thorim = "Stay your arms! I yield!"
L.Yell_Hodir = "I... I am released from his grasp... at last."
L.Yell_Mimiron = "It would appear that I've made a slight miscalculation. I allowed my mind to be corrupted by the fiend in the prison, overriding my primary directive. All systems seem to be functional now. Clear."
L["Yell_Yogg-Saron"] = "Your fate is sealed. The end of days is finally upon you and ALL who inhabit this miserable little seedling! Uulwi ifis halahs gag erh'ongg w'ssh."
-- toc
L.Yell_Twin_Valkyr = "The Scourge cannot be stopped..."
L.Yell_Anubarak   = "I have failed you, master..."
L["Yell_Faction Champions"] = "A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death."
L.Yell_Ignis = "I...have...failed..."
-- icecrown
L.YellA_Gunship_Battle = "Don't say I didn't warn ye scoundrels. Onwards, brothers and sisters!" 
L.YellH_Gunship_Battle = "The Alliance falter. Onward to the Lich King!" 

-- zones
L["Hyjal Summit"] = true
L["World Boss"] = true

