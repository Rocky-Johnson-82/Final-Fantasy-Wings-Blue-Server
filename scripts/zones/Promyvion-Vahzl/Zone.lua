-----------------------------------
--
-- Zone: Promyvion-Vahzl (22)
--
-----------------------------------
local ID = require("scripts/zones/Promyvion-Vahzl/IDs")
require("scripts/globals/promyvion")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    tpz.promyvion.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-14.744, 0.036, -119.736, 1) -- To Floor 1 {R}
    end

    if player:getCurrentMission(COP) == tpz.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 0 then
        cs = 50
    end

    return cs
end

function afterZoneIn(player)
    if ENABLE_COP_ZONE_CAP == 1 then
        player:addStatusEffect(tpz.effect.LEVEL_RESTRICTION, 50, 0, 0)
    end
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
    tpz.promyvion.onRegionEnter(player, region)
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
    if csid >= 30 and csid <= 44 and option == 0 then
        for _, entry in pairs(player:getNotorietyList()) do
            entry:deaggroPlayer(player:getName()) -- reset hate on player after teleporting
        end
    end
end

function onEventFinish(player, csid, option)
    if csid == 50 then
        player:setCharVar("PromathiaStatus", 1)
        player:addKeyItem(tpz.ki.MYSTERIOUS_AMULET_DRAINED)
        player:addKeyItem(tpz.ki.LIGHT_OF_VAHZL)
        player:messageSpecial(ID.text.AMULET_RETURNED, tpz.ki.MYSTERIOUS_AMULET)
        player:messageSpecial(ID.text.LIGHT_OF_VAHZL, tpz.ki.LIGHT_OF_VAHZL)
    elseif csid == 45 and option == 1 then
        player:setPos(-379.947, 48.045, 334.059, 192, 9) -- To Pso'Xja {R}
    end
end
