---------------------------------------------------
-- Spinning Dive M=12
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local ele = tpz.damageType.WATER
    local coe = getAvatarEcosystemCoefficient(target, ele)
    local numhits = 1
    local accmod = 20 + math.floor(15*skill:getTP()/3000)
    local dmgmod = 6 * coe --12 * coe or correct formula when smn calcs have been auditted

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, 0, TP_NO_EFFECT, 1, 2, 3)
    totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end
