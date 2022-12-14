-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Maa Illmu the Bestower
-- TODO:
--  Test what spells it casts at what HPP.
--  Immune to spell interruption from melee attacks. Only stuns and silence will interrupt it.
--  Will not use TP moves unless silenced - when Silence is inflicted it will immediately use Shirahadori if it has TP.
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 6)
    mob:setMod(tpz.mod.SILENCERES, 100)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    local respawn = math.random(7200, 14400)
    mob:setRespawnTime(respawn) -- 2 to 4 hrs
    SetServerVariable("Maa_Illmu_Respawn", (os.time() + respawn))
end
