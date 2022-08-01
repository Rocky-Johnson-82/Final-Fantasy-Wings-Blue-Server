-----------------------------------
-- Area: King Ranperres Tomb
--   NM: Cemetery Cherry
-- !pos 33.000 0.500 -287.000 190
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
-----------------------------------

function spawnSaplings()
    for i = ID.mob.CHERRY_SAPLING_OFFSET, ID.mob.CHERRY_SAPLING_OFFSET + 12 do
        local mob = GetMobByID(i)
        if mob ~= nil and mob:getName() == 'Cherry_Sapling' and not mob:isSpawned() then
            SpawnMob(i)
        end
    end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)

    local saplingsRespawn = math.random(1800, 3600) -- 30 to 60 minutes
    mob:timer(saplingsRespawn * 1000, function(mob) spawnSaplings() end)
end

function onMobSpawn(mob)
    mob:setLocalVar("wasKilled", 0)
    mob:setMod(tpz.mod.RESBUILD_GRAVITY, 25)
    mob:setMod(tpz.mod.RESBUILD_BIND, 15)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("wasKilled", 1)
    player:addTitle(tpz.title.MON_CHERRY)
end

function onMobDespawn(mob)
    local saplingsRespawn = 0
    if mob:getLocalVar("wasKilled") == 1 then
        saplingsRespawn = math.random(216000, 259200) -- 60 to 72 hours
        SetServerVariable("CherryRespawn",(os.time() + saplingsRespawn))
    else
        saplingsRespawn = math.random(1800, 3600) -- 30 to 60 minutes
        SetServerVariable("CherryRespawn",(os.time() + saplingsRespawn))
    end
    mob:timer(saplingsRespawn * 1000, function(mob) spawnSaplings() end)
end
