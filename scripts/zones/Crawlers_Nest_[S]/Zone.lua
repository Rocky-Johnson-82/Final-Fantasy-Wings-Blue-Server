-----------------------------------
--
-- Zone: Crawlers_Nest_[S] (171)
--
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest_[S]/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    local lugh_respawn = GetServerVariable("Lugh_Respawn")
	if os.time() < lugh_respawn then
		GetMobByID(ID.mob.LUGH):setRespawnTime(lugh_respawn - os.time())
	else
		SpawnMob(ID.mob.LUGH)
    end
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(380.617, -34.61, 4.581, 65)
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
