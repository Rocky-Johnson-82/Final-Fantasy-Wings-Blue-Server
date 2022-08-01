-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Tonberry Pursuer
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
-----------------------------------


function onMobDespawn(mob, target)
    local randomchance = math.random(5,10)
	tpz.mob.phOnDespawn(mob, ID.mob.SOZU_ROGBERRY_PH, randomchance, 3600) -- 1 hour
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 790, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 791, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 792, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 793, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 794, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 795, 1, tpz.regime.type.GROUNDS)
end

