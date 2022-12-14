-----------------------------------
-- Area: Arrapago Reef
--   NM: Euryale
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 474)
end

function onMobDespawn(mob)
    local respawn = 7200
    mob:setRespawnTime(respawn) -- 2 hours
    SetServerVariable("Euryale_Respawn", (os.time() + respawn))
end
