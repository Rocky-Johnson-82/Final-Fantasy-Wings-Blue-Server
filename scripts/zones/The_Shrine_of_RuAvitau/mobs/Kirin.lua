-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Kirin
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/titles")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMod(tpz.mod.REGAIN, 1000);
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.WINDRES, -64)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)

    mob:addStatusEffect(tpz.effect.REGEN, 50, 3, 0)
    mob:setLocalVar("numAdds", 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE)
end

function onMobFight( mob, target )
    -- spawn gods
    local numAdds = mob:getLocalVar("numAdds")
    if (mob:getBattleTime() / 180 == numAdds) then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining, i)
            end
        end
        if (#godsRemaining > 0) then
            mob:setLocalVar("numAdds", numAdds + 1)
            mob:entityAnimationPacket("casm")
            mob:SetAutoAttackEnabled(false)
            mob:SetMagicCastingEnabled(false)
            mob:SetMobAbilityEnabled(false)
            mob:timer(3000, function(mob)
                if mob:isAlive() then
                    mob:entityAnimationPacket("shsm")
                    spawnGod(mob)
                end
            end)
        end
    end

    -- ensure all spawned pets are doing stuff
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        local god = GetMobByID(i)
        if (god:getCurrentAction() == tpz.act.ROAMING) then
            god:updateEnmity(target)
        end
    end
end


function onMobWeaponSkill(target, mob, skill, act)

end

function onMobDeath(mob, player, isKiller)
    player:addTitle( tpz.title.KIRIN_CAPTIVATOR )
    player:showText( mob, ID.text.KIRIN_OFFSET + 1 )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end

function onMobDespawn( mob )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end

function spawnGod(mob, target)
    local godsRemaining = {}
    for i = 1, 4 do
       if (mob:getLocalVar("add"..i) == 0) then
           table.insert(godsRemaining, i)
       end
    end
    local g = godsRemaining[math.random(#godsRemaining)]
    local god = SpawnMob(ID.mob.KIRIN + g)
    god:updateEnmity(mob:getTarget())
    god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos())
    mob:setLocalVar("add"..g, 1)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
end
