-----------------------------------
-- Area: Den of Rancor
--   NM: Tonberry Pontifex
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 798, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 799, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 800, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    local respawn = math.random(75600, 86400)
    mob:setRespawnTime(respawn) -- 21 to 24 hours
    SetServerVariable("Pontifex_Respawn", (os.time() + respawn))
end
