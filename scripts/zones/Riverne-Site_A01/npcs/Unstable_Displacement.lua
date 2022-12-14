-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-- !pos 184 0 344 30
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
    local offset = npc:getID() - ID.npc.DISPLACEMENT_OFFSET
    if (offset == 5 and TradeBCNM(player, npc, trade)) then -- Ouryu Cometh
        return
    end
end

function onTrigger(player, npc)
    local offset = npc:getID() - ID.npc.DISPLACEMENT_OFFSET

    -- OURYU COMETH
    if offset == 5 and EventTriggerBCNM(player, npc) then
        return
    elseif (offset == 5) then
        player:messageSpecial(ID.text.SPACE_SEEMS_DISTORTED)
    end
end

function onEventUpdate(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

function onEventFinish(player, csid, option)
end
