-----------------------------------
-- Area: Sealion's Den
--  Mob: Kukki-Chebukki
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
mixins = {require("scripts/mixins/warriors_path_taru")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 60)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
    mob:setMobMod(tpz.mobMod.NO_LINK, 1)
    mob:addMod(tpz.mod.UDMGPHYS, -100)
    mob:addMod(tpz.mod.UDMGMAGIC, -100)
    mob:addMod(tpz.mod.UDMGRANGE, -100)
    mob:addMod(tpz.mod.UDMGBREATH, -100)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("kukki", 1)
end

function onMobEngaged(mob, target)
    mob:entityAnimationPacket("ouen") -- each taru will use this animation at the start of the fight
    mob:setMobMod(tpz.mobMod.NO_LINK, 0)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 0)
    mob:SetMagicCastingEnabled(true)
    mob:AnimationSub(1)
end

function onMobFight(mob, target)
    local battlefield = mob:getBattlefield()
    local battletime = mob:getBattleTime()
    local changetime = mob:getLocalVar("changetime")
    if battlefield:getLocalVar("fireworks") == 1 then
        if battletime - changetime >= 3 then
            mob:SetMagicCastingEnabled(false)
            mob:entityAnimationPacket("ffr2")
            mob:AnimationSub(2)
            mob:setLocalVar("changetime", mob:getBattleTime())
        end
    end
end

function onMobDisengage(mob, target)
    mob:AnimationSub(2) -- laughing pose
end

function onMobDeath(mob, player, isKiller)
end