---------------------------------------------
-- Extremely Bad Breath
-- Family: Morbol
-- Description: A horrific case of halitosis instantly K.O.'s any players in a fan-shaped area of effect.
-- Type: Breath
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Conal up to 15'
-- Notes: Some Morbol NMs
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)
    target:takeDamage(target:getHP(), mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    return tpz.effect.KO
end