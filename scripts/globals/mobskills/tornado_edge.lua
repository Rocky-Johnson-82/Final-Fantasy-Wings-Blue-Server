---------------------------------------------------
-- Tornado Edge
-- Deals damage to targets in front of the user. Additional effects: Max HP Down, Max MP Down, Max TP Down
-- Effect Reduces HP by 50%, MP by 50% and reduces max TP to 100%.
-- Each debuff assigned to one of the 3 hits. It is possible to avoid a status by having a shadow absorb part of the attack. IE: If only 1 hit lands, whichever status goes with that hit will be applied.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 1.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local requireNumHits = true
    local finalInfo = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded, requireNumHits)
    local dmg

    if (type(finalInfo) == "number") then
        dmg = finalInfo
    else
        dmg = finalInfo.dmg

        if (finalInfo.hitslanded > 0) then
            MobStatusEffectMove(mob, target, tpz.effect.MAX_HP_DOWN, 50, 0, 60)
        end

        if (finalInfo.hitslanded > 1) then
            MobStatusEffectMove(mob, target, tpz.effect.MAX_MP_DOWN, 50, 0, 60)
        end

        if (finalInfo.hitslanded > 2) then
            MobStatusEffectMove(mob, target, tpz.effect.MAX_TP_DOWN, 2000, 0, 60)
        end
    end

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)

    return dmg
end
