-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Seiryu
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REGAIN, 200)
    GetNPCByID(ID.npc.SEIRYU_PORTAL):setAnimation(tpz.animation.CLOSE_DOOR)
end

function onMonsterMagicPrepare(mob, target)
    if not mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS, 0) then
        local rnd = math.random()
        if rnd < 0.5 then
            return 186 -- aeroga 3
        elseif rnd < 0.7 then
            return 157 -- aero 4
        elseif rnd < 0.9 then
            return 208 -- tornado
        else
            return 237 -- choke
        end
    end
    return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 10)
end

function onMobDespawn(mob)
    GetNPCByID(ID.npc.SEIRYU_PORTAL):setAnimation(tpz.animation.OPEN_DOOR)
end
