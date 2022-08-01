---------------------------------------------------
-- Aero 2
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local ele = tpz.damageType.ICE
    local coe = getAvatarEcosystemCoefficient(target, ele)
    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local tp = skill:getTP()

    local damage = math.floor(338 * (1 + 0.578*tp/3000) * coe)
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet, target, skill, damage, tpz.magic.ele.ICE, 1, TP_NO_EFFECT, 0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.ICE)
    damage = AvatarFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, 1)

    local skillchainTier, skillchainCount = FormMagicBurst(tpz.damageType.ICE - 5, target)
    if (skillchainTier > 0) then
        skill:setMsg(747)
    end
    
    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.ICE)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end
