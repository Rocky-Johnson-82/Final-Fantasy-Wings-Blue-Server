-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Ze'Vho Fallsplitter
-----------------------------------
require("scripts/globals/dynamis")
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

local zone = 186

function onMobDeath(mob, player, isKiller)
    require("scripts/zones/Dynamis-Bastok/dynamis_mobs")
    require("scripts/zones/Dynamis-Bastok/dynamis_handler")
    local ID = require("scripts/zones/Dynamis-Bastok/IDs")
    dynamis.mobOnDeath(mob, mobList[zone], ID.text.DYNAMIS_TIME_EXTEND)
end

function onMobRoamAction(mob)
    dynamis.mobOnRoamAction(mob)
end

function onMobRoam(mob)
    dynamis.mobOnRoam(mob)
end

function onMobSpawn(mob)
    dynamis.setNMStats(mob)
end