-----------------------------------
-- Area: Xarcabard
--   NM: Ereshkigal
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local respawn = math.random(75600, 86400)
    mob:setRespawnTime(respawn) -- 21-24 hours
    SetServerVariable("Ereshkigal_Respawn", (os.time() + respawn))
end
