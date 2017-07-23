local L = LibStub("AceLocale-3.0", true):NewLocale("RaidTracker", "deDE", false)
if not L then return end


-- addon messages

-- functional strings (must match the game strings exactly)
L.LeftRaid = "([^%s]+) hat die Schlachtgruppe verlassen."
L.LeftParty2 = "Eure Gruppe wurde aufgel\195\182st."
L.ReceivesLoot1 = "([^%s]+) bekommt Beute: "..RT_ITEMREG.."."
L.ReceivesLoot2 = "Ihr erhaltet Beute: "..RT_ITEMREG.."."
L.ReceivesLoot3 = "([^%s]+) erh\195\164lt Beute: "..RT_ITEMREG_MULTI.."."
L.ReceivesLoot4 = "Ihr erhaltet Beute: "..RT_ITEMREG_MULTI.."."
L.ReceivesLoot5 = "([^%s]+) gewinnt: "..RT_ITEMREG_NOT_RETARDED
L.ReceivesLoot6 = "Ihr gewinnt: "..RT_ITEMREG_NOT_RETARDED

L.ReceivesLoot7 = "DKP: ([^%s]+) bekommt "..RT_ITEMREG_NOT_RETARDED.." f\195\188r: (.*) DKP."
L.ReceivesLootDKP = "DKP: (.*) f\195\188r: (.*) DKP."

L.ReceivesLootYou = "Ihr"

L.Yell_Majordomo = "Unm\195\182glich! Haltet ein, Sterbliche... Ich gebe auf! Ich gebe auf!"
L["Yell_Chess Event"] = "Als sich der Fluch, der auf den T\195\188ren der Halle der Spiele lastete, l\195\182st, beginnen die Mauern von Karazhan zu beben."
L.Yell_Julianne = "O willkommener Dolch! Dies werde deine Scheide. Roste da und lass mich sterben!"; -- need english translation
-- naxx
L.Yell_Steelbreaker = "Unm\195\182glich..."							-- Iron Council Hardmode / Steelbreaker last
L.Yell_Brundir = "Ihr lauft geradewegs in den Schlund des Wahnsinns!"				-- Iron Council Normalmode / Brundir last
L.Yell_Molgeim = "Ihr habt den Eisernen Rat besiegt und das Archivum ge\195\182ffnet! Gut gemacht, Leute!" -- general
L.Yell2_Molgeim = "Ihr habt den Eisernen Rat besiegt und das Archivum ge\195\182ffnet!  Gut gemacht, Leute!"
-- ulduar
L.Yell_Freya = "Seine Macht \195\188ber mich beginnt zu schwinden. Endlich kann ich wieder klar sehen. Ich danke Euch, Helden."
L.Yell_Thorim = "Senkt Eure Waffen! Ich ergebe mich!"
L.Yell_Hodir = "Ich... bin von ihm befreit... endlich."
L.Yell_Mimiron = "Es scheint, als w\195\164re mir eine klitzekleine Fehlkalkulation unterlaufen. Ich habe zugelassen, dass das Scheusal im Gef\195\164ngnis meine Prim\195\164rdirektive \195\188berschreibt. Alle Systeme nun funktionst\195\188chtig." 
-- toc
L.Yell_Twin_Valkyr = "Die Gei\195\159el kann nicht aufgehalten werden..."
L["Yell_Faction Champions"] = "Ein tragischer Sieg. Wir wurden schw\195\164cher durch die heutigen Verluste. Wer au\195\159er dem Lichk\195\182nig profitiert von solchen Torheiten? Gro\195\159e Krieger gaben ihr Leben. Und wof\195\188r? Die wahre Bedrohung erwartet uns noch - der Lichk\195\182nig erwartet uns alle im Tod."
-- icecrown
L.YellA_Gunship_Battle = "Sagt nicht, ich h\195\164tte Euch nicht gewarnt, Ihr Schurken! Vorw\195\164rts, Br\195\188der und Schwestern!"
L.YellH_Gunship_Battle = "ICH BIN GEHEILT! Ysera, erlaubt mir, diese \195\188blen Kreaturen zu beseitigen!"
L.Yell_Saurfang = "Ich... bin... frei..."
L.Yell_Valithria = "Die Allianz wankt. Vorw\195\164rts zum Lichk\195\182nig!"

-- zones

