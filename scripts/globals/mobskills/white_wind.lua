---------------------------------------------
-- White Wind
--
-- Description:
-- HP recovery on all nearby mobs centered on the user.
-- The higher the user's HP, the higher the HP recovery.
-- Only used by certain puks.
--
-- Player Blue Magic Version uses MaxHP instead of current HP: floor(MaxHP/7)*2
-- The math for mob version may be different, it's presumed to be the same here.
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
    skill:setMsg(tpz.msg.basic.SKILL_RECOVERS_HP)
    -- Todo: verify/correct maths
    -- based on captures/videos of Vulpangue - *2 was too high
    local healAmount = math.floor(mob:getHP()/7)*1.5
    if (healAmount > 2000) then
        healAmount = math.random(1800, 2000)
    end
    return MobHealMove(mob, healAmount)
end
