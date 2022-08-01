---------------------------------------------
-- Entangle
--
-- Description: Attempts to bind a single target with vines.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee
-- Notes: When used by the Cemetery Cherry and Jidra, it also deals damage, inflicts Poison, and resets hate. When used by Cernunnos, also drains HP equal to the damage inflicted.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if mob:getID() == 16932881 or mob:getID() == 17555863 then
        local typeEffect = tpz.effect.POISON

        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 120))

        target:takeDamage(250, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)

        mob:resetEnmity(target)

        return typeEffect
    else
        local typeEffect = tpz.effect.BIND

        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30))

        return typeEffect
    end
end