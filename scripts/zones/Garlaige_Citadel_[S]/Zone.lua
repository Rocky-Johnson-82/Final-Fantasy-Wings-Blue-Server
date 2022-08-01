-----------------------------------
--
-- Zone: Garlaige_Citadel_[S] (164)
--
-----------------------------------
local ID = require("scripts/zones/Garlaige_Citadel_[S]/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    local buarainech_respawn = GetServerVariable("Buarainech_Respawn")
    local elatha_respawn = GetServerVariable("Elatha_Respawn")
    if os.time() < elatha_respawn then
		GetMobByID(ID.mob.ELATHA):setRespawnTime(elatha_respawn - os.time())
	else
		SpawnMob(ID.mob.ELATHA)
    end
    if os.time() < buarainech_respawn then
		GetMobByID(ID.mob.BUARAINECH):setRespawnTime(buarainech_respawn - os.time())
	else
		SpawnMob(ID.mob.BUARAINECH)
    end
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-300, -13.548, 157, 64)
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
