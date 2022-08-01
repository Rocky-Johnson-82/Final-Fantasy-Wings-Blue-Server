---------------------------------------------
--  Battle Dance
--
--  Description: Delivers an area attack. Additional effect: DEX Down. Duration of effect varies with TP.
--  Type: Physical (Slashing)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2.0
    if mob:getID() == 17391803 then -- Overlord_Bakgodek
        accmod = 1.5
        dmgmod = 2.3
    end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)

    local typeEffect = tpz.effect.DEX_DOWN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 120)
	if dmg > 0 and skill:getMsg() ~= 31 then target:tryInterruptSpell(mob, info.hitslanded) end

    return dmg
end