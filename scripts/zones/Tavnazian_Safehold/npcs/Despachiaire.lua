-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Despachiaire
-- !pos 108 -40 -83 26
-----------------------------------
require("scripts/globals/missions")
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/settings")
-----------------------------------
-- TODO:
-- Starts quests: "X Marks the Spot"
--                "Elderly Pursuits"
--                "Tango with a Tracker"
--                "Requiem of Sin"
-- Involved in:   "Secrets of Ovens Lost"
-- https://github.com/project-topaz/topaz/issues/1481

function onTrade(player, npc, trade)
    if player:getCharVar("AnnyEvent2020") == 3 and Anniversary_Event_2021 == 1 then
        if trade:hasItemQty(539, 1) and player:getFreeSlotsCount() > 0 and trade:getItemCount() == 1 then
            player:tradeComplete()
            player:setCharVar("AnnyEvent2020", 4)
            player:addItem(949)
            player:PrintToPlayer("Despachiaire : This must of taken you a long time to get here..", 0xD)
            player:PrintToPlayer("Despachiaire : For your next step, take this to the youngest of a pair of sisters...", 0xD)
            player:messageSpecial((ID.text.ITEM_OBTAINED), 949)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 949)
            player:PrintToPlayer("Despachiaire : Come back after cleaning up that mess of an inventory...", 0xD)
        end
    end
end

function onTrigger(player, npc)
    local copCurrentMission = player:getCurrentMission(COP)
    local copMissionStatus = player:getCharVar("PromathiaStatus")
    local copMissions = tpz.mission.id.cop

    -- COP 2-2 "The Lost City"
    if copCurrentMission == copMissions.THE_LOST_CITY and copMissionStatus == 0 then
        player:startEvent(102)
    -- COP 4-1 "Sheltering Doubt"
    elseif copCurrentMission == copMissions.SHELTERING_DOUBT and copMissionStatus == 1 then
        player:startEvent(108)
    -- COP 4-4 "Slanderous Utterings" is an area approach handled in Tavnazian_Safehold/Zone.lua
    -- COP 5-1 "Sheltering Doubt" (optional)
    elseif
        copCurrentMission == copMissions.THE_ENDURING_TUMULT_OF_WAR and
        copMissionStatus == 0 and
        player:getCharVar("COP_optional_CS_Despachaire") == 0
    then
        player:startEvent(117)
    -- COP 5-3 "Three Paths"
    elseif copCurrentMission == copMissions.THREE_PATHS then
        if player:getCharVar("COP_Louverance_s_Path") == 0 then
            player:startEvent(118)
        else
            player:startEvent(134)
        end
    -- Putting Secrets of Ovens Lost at a lower priority than all missions
    elseif player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.SECRETS_OF_OVENS_LOST) == QUEST_AVAILABLE and
           player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.SPICE_GALS) == QUEST_COMPLETED and
           (player:hasCompletedMission(COP, tpz.mission.id.cop.THE_SECRETS_OF_WORSHIP) or (copCurrentMission == tpz.mission.id.cop.THE_SECRETS_OF_WORSHIP and copMissionStatus >= 1)) then
           -- wiki says access to Sacrarium, so going with can trigger entrance to Sacrarium or later
        player:startEvent(505) -- Tells player to talk to Jonette
    -- COP Default dialogue change
    elseif player:getCurrentMission(COP) > copMissions.DARKNESS_NAMED then
        player:startEvent(315) -- "Jeuno offered its help"; TODO: might trigger as early as 5-2?
    -- Default dialogue
    else
        player:startEvent(106)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 102 or csid == 108 then
        player:setCharVar("PromathiaStatus", 2)
    elseif csid == 117 then
        player:setCharVar("COP_optional_CS_Despachaire", 1)
    elseif csid == 118 then
        player:setCharVar("COP_Louverance_s_Path", 1)
    elseif csid == 505 then
        player:setCharVar("SecretsOfOvenLostDespCS", 1)
    end

end

-- TODO: cutscenes including Despachiaire for reference
--Despachiaire     102 ++
--Despachiaire     104 ++
--Despachiaire     106 ++
--Despachiaire     107 ++
--Despachiaire     108 ++
--Despachiaire     110 ++
--Despachiaire     112 ++
--Despachiaire     117 ++
--Despachiaire     118 ++
--Despachiaire     132
--Despachiaire     133
--Despachiaire     134 ??
--Despachiaire     139
--Despachiaire     144 chat
--Despachiaire     149 XX
--Despachiaire     315 chat
--Despachiaire     317 chat
--Despachiaire     318 chat
--Despachiaire     505 CS - openeing CS for Secrets of Ovens lost
--Despachiaire     517 CS (despachiaire's wife)
--Despachiaire     518 CS (ulmia mother)
--Despachiaire     576 CS
--Despachiaire     577 chat
--Despachiaire     578 chat
--Despachiaire     579 chat
--Despachiaire     617 XX
--Despachiaire     618 XX
