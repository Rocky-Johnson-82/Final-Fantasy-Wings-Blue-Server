---------------------------------------------------
-- Rock Throw M=3.5 SLOW
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
require("scripts/globals/magic")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local ele = tpz.damageType.EARTH
    local coe = getAvatarEcosystemCoefficient(target, ele)
    local numhits = 1
    local accmod = 0 + math.floor(6*skill:getTP()/3000)
    local dmgmod = 3.5 * coe

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, 0, TP_NO_EFFECT, 1, 2, 3)

    totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    
    local dVIT = pet:getStat(tpz.mod.VIT) - target:getStat(tpz.mod.VIT)
    local bonus = dVIT
    if pet:getMaster() ~= nil and (pet:getMaster()):isPC() then
        bonus = bonus + (pet:getMaster()):getMerit(1284) * 2 + getSummoningSkillOverCap(pet) + 1
    end
    local resist = applyResistanceAbility(pet,target,tpz.magic.element.EARTH,tpz.skill.ENFEEBLING_MAGIC,bonus)
    local duration = math.ceil(120 * resist * tryBuildResistance(tpz.mod.RESBUILD_SLOW, target))
    if resist >= 0.25 and totaldamage > 0 then
        target:addStatusEffect(tpz.effect.SLOW, 1200, 0, duration)
    end
    
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end
