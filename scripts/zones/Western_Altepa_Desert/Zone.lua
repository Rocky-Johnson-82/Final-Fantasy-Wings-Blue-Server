-----------------------------------
--
-- Zone: Western_Altepa_Desert (125)
--
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/quests/i_can_hear_a_rainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/world")
require("scripts/globals/zone")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onChocoboDig(player, precheck)
    return tpz.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.KING_VINEGARROON)
    local KingVine = GetMobByID(ID.mob.KING_VINEGARROON)
	local kvre = GetServerVariable("KVRespawn")
    DisallowRespawn(KingVine:getID(), true)

	if os.time() < kvre then
		GetMobByID(ID.mob.KING_VINEGARROON):setRespawnTime(kvre - os.time())
	end

    tpz.bmt.updatePeddlestox(tpz.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onGameDay()
    tpz.bmt.updatePeddlestox(tpz.zone.WESTERN_ALTEPA_DESERT, ID.npc.PEDDLESTOX)

    SetServerVariable("[DIG]ZONE125_ITEMS", 0)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-19.901, 13.607, 440.058, 78)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 2
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 2 then
        quests.rainbow.onEventUpdate(player)
    end
end

function onEventFinish(player, csid, option)
end

function onZoneWeatherChange(weather)
    UpdateNMSpawnPoint(ID.mob.KING_VINEGARROON)
	local kvre = GetServerVariable("KVRespawn")
    local KingVine = GetMobByID(ID.mob.KING_VINEGARROON)

    if
        KingVine:isSpawned() == false and os.time() > kvre
        and weather == tpz.weather.DUST_STORM
    then
        -- 10% chance for KV pop at start of single earth weather
        chance = math.random(1, 10)
        if chance == 1 then
            DisallowRespawn(KingVine:getID(), false)
            SpawnMob(ID.mob.KING_VINEGARROON)
        end
    elseif
        KingVine:isSpawned() == false and os.time() > kvre
        and weather == tpz.weather.SAND_STORM
    then
        DisallowRespawn(KingVine:getID(), false)
        SpawnMob(ID.mob.KING_VINEGARROON)
    end
end