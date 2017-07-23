local L = LibStub("AceLocale-3.0", true):NewLocale("RaidTracker", "koKR", false)
if not L then return end
-- Author      : bisonai

-- addon messages
L["Added %s to the selected raid."] = "선택한 공격대에 %s 추가합니다."
L["Item Options"] = "아이템 옵션"
L["Show Item Options"] = "아이템 옵션 보기"
L["additem"] = "아이템 추가"
L["%s: Must supply an item link and a player name."] = "%s: 아이템 링크 및 플레이어 이름을 제공합니다."
L["%s: There is no raid selected"] = "%s: 공격대가 선택되지 않았습니다."
L["%s: Could not add %s"] = "%s: %s 추가 하지 못했습니다."
L["%s: Must be a current open raid."] = "현재 공격대를 열어야 합니다."
L["/rt - Shows the main window."] = "/루팅(rt) - 메인 창을 표시합니다."
L["/rt options|o - Shows Options window"] = "/루팅(rt) 옵션(o) - 설정창을 표시합니다."
L["/rt io - Shows the ItemOptions window"] = "/루팅(rt) 아이템옵션(io) - 아이템 설정창을 표시합니다."
L["/rt io [ITEMLINK|ITEMID]... - Adds items to ItemOptions window"] = "/루팅(rt) 아이템옵션(io) [ITEMLINK|ITEMID]... - 아이템 옵션창에 아이템을 추가합니다."
L["/rt additem [ITEMLINK] [PLAYER] - Adds a loot item to the selected raid"] = "/루팅(rt) 아이템추가(추가,additem,ai) [ITEMLINK] [PLAYER] - 선택한 공격대에 전리품 아이템을 추가합니다."
L["/rt join [PLAYER] - Add a player to the selected raid"] = "/루팅(rt) 입장(join) [PLAYER] - 선택한 공격대에 플레이어를 추가합니다."
L["/rt leave [PLAYER] - Removes a player from the selected raid"] = "/루팅(rt) 나감(leave) [PLAYER] - 선택한 공격대에서 플레이어를 삭제합니다."
L["/rt deleteall - Deletes all raids"] = "/루팅(rt) 삭제(deleteall) - 모든 공격대를 삭제합니다."
L["/rt debug 1|0 - Enables/Disables debug mode"] = "/루팅(rt) 디버그(debug) 1|0 - 디버그 모드를 활성화/비활성화 합니다."
L["/rt addwipe - Adds a Wipe with the current timestamp"] = "/루팅(rt) 추가와이프(addwipe) - 현재 타임 스탬프와 함께 추가합니다."

-- functional strings (must match the game strings exactly)
L.LeftRaid = "([^%s]+)님이 공격대를 떠났습니다."
L.LeftParty = "([^%s]+)님이 파티를 떠났습니다."
L.LeftParty2 = "파티가 해체되었습니다."
L.ReceivesLoot1 = "([^%s]+)님이 아이템을 획득했습니다: "..RT_ITEMREG..".*"
L.ReceivesLoot2 = "아이템을 획득했습니다: "..RT_ITEMREG..".*"
L.ReceivesLoot3 = "([^%s]+)님이 아이템을 획득했습니다: "..RT_ITEMREG_MULTI..".*"
L.ReceivesLoot4 = "아이템을 획득했습니다: "..RT_ITEMREG_MULTI..".*"
--L.ReceivesLootYou = "아이템을 획득했습니다: "..RT_ITEMREG_MULTI..".*"
L.ReceivesLootYou = "아이템을 획득했습니다: "..RT_ITEMREG_MULTI.."*"


-- naxx

-- ulduar
L.Yell_Freya = "내게서 그의 지배력이 걷혔다. 다시 온전한 정신을 찾았도다. 영웅들이여, 고맙다."
L.Yell_Thorim = "무기를 거둬라! 내가 졌다!"
L.Yell_Hodir = "드디어... 드디어 그의 손아귀를... 벗어나는구나."
-- toc
L.Yell_Anubarak = "실명시켜 드렸군요, 주인님..."
L.Yell_Krick = "잠간! 멈취! 제발, 죽이지마!"

-- icecrown
L.Yell_The_Lich_King = "도망갈 곳은 없다... 너는 이제 나의 것이다!"


-- zones
L["Hyjal Summit"] = "하이잘 정상"
L["World Boss"] = "월드 보스"
L["Smelting wife's father Garfrost"] = "제련장인 가프로스트"
L["Krick"] = "크리스"
L["Ick"] = "이크"

-- UI_Options
L["Raid Tracker - Options"] = "RaidTracker 옵션"
L["Logging"] = "기록 설정"
L["Raids"] = "공격대"
L["Parties"] = "파티"
L["Solo"] = "솔로잉"
L["Battelgroups"] = "전장"
L["Arenas"] = "투기장"
L["Attendees"] = "참석자"
L["Guildies"] = "길드"
L["Wipes"] = "wipe 요구 백분율"
L["Item Quality"] = "아이템 품질"
L["Min Rarity"] = "최소 품질"
L["Min iLevel"] = "최소 레벨"
L["Min to Ask Cost"] = "최소 포인트 묻기"
L["Min to Get Cost"] = "포인트 획득 최소 묻기"
L["Max to Stack"] = "중첩하는 최대 아이템"
L["Advanced"] = "고급 설정"
L["Show Tooltips"] = "툴팁 표시"
L["Auto Event"] = "자동 보스킬"
L["Event Cooldown"] = "보스킬 간격"
L["Export level"] = "최대 레벨"
L["Auto Zone"] = "자동 지역"
L["Debug Mode"] = "디버그 모드"
L["Export Format"] = "형식 내보내기"

-- UI_ItemOptions
L["Unknown"] = "알수 없음"
L["RaidTracker - Item Options"] = "RaidTracker 아이템 옵션"
L["Log"] = "기록"
L["Stack"] = "중첩"
L["Get Cost"] = "획득 포인트 묻기"
L["Ask Cost"] = "포인트 묻기"

-- UI_Dialog
L["Join"] = "참여"
L["Leave"] = "나감"

-- UI_Button
L["Edit Start"] = "시작 수정"
L["Edit End"] = "종료 수정"
L["None"] = "없음"
L["none"] = "없음"
L["Edit Zone"] = "지역 수정"
L["Edit Note"] = "메모 수정"
L["Show Export String"] = "형식 내보내기 보기"
L["Edit Looter"] = "획득자 수정"
L["Edit Cost"] = "포인트 수정"
L["Edit Count"] = "획득수 수정"
L["Edit Time"] = "시간 수정"
L["Edit Item Options"] = "아이템 옵션 수정"
L["Dropped from"] = "획득 지역(보스)"

L["25 man"] = "25인"
L["25"] = "25인"
L["10 man"] = "10인"
L["10"] = "10인"
L["Heroic"] = "|cffff0000영웅|r"

L["bank"] = "은행"
L["disenchant"] = "마력 추출"
L["Bank"] = "은행"
L["Disenchant"] = "마력 추출"
L["Yes"] = "예"
L["No"] = "아니오"
L["Save"] = "저장"
L["Cancel"] = "아니오"
L["Delete"] = "삭제" 
