---------------------------------------------
--  Chaos Blade
--
--  Description: Deals Dark damage to enemies within a fan-shaped area. Additional effect: Curse
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores Shadows
--  Range: Melee
--  Notes:
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

    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    mob:lookAt(target:getPos())
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)

    -- curse LAST so you don't die
    local typeEffect = tpz.effect.CURSE_I
    local mobID = mob:getID()
    if (mobID == 17125681 or mobID == 17125682 or mobID == 17125683) then -- Galarhigg curses 80% for 30mins  ToDo: find a better alternative than hardcoding each mob
        MobStatusEffectMove(mob, target, typeEffect, 80, 0, 1800)
    else
        MobStatusEffectMove(mob, target, typeEffect, 25, 0, 420)
    end
    return dmg
end
