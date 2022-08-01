-----------------------------------
--
-- Zone: Halvung (62)
--
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/conquest")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    tpz.helm.initZone(zone, tpz.helm.type.MINING)
    local dorgerwor_respawn = GetServerVariable("Dorgerwor_Astute_Respawn")
    if os.time() < dorgerwor_respawn then
		GetMobByID(ID.mob.DORGERWOR_THE_ASTUTE):setRespawnTime(dorgerwor_respawn - os.time())
	else
		SpawnMob(ID.mob.DORGERWOR_THE_ASTUTE)
    end
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(160.54, -22.001, 139.988, 244)
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
