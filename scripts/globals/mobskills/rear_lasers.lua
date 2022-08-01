---------------------------------------------------
-- Rear Lasers
-- Fires aft lasers at players behind user. Additional effects: Petrification
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(tpz.mobMod.SKILL_LIST)

    if (skillList == 54 and mob:getHPP() > 25) or (skillList == 727 and mob:AnimationSub() == 1 and target:isBehind(mob)) then
        return 0
    else
        return 1
    end

end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PETRIFICATION

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30))

    return typeEffect
end