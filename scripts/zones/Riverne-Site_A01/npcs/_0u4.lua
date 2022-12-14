-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-----------------------------------
local RIVERNE_SITE_A01 = require("scripts/zones/Riverne-Site_A01/globals")
-----------------------------------

function onTrade(player, npc, trade)
    RIVERNE_SITE_A01.unstableDisplacementTrade(player, npc, trade)
end

function onTrigger(player, npc)
    RIVERNE_SITE_A01.unstableDisplacementTrigger(player, npc, 32)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32 then
        for _, entry in pairs(player:getNotorietyList()) do
            entry:deaggroPlayer(player:getName()) -- reset hate on player after teleporting
        end
    end
end
