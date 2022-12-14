-----------------------------------------
-- Spell: Voracious Trunk
-- Steals an enemy's buff
-- Spell cost: 72 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: AGI +2
-- Level: 72
-- Casting Time: 10 seconds
-- Recast Time: 56 seconds
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local bonus = caster:getStatusEffect(tpz.effect.CONVERGENCE) == nil and 0 or (caster:getStatusEffect(tpz.effect.CONVERGENCE)):getPower()
    bonus = bonus + caster:getMerit(tpz.merit.MAGICAL_ACCURACY)
    local resist = applyResistanceAbility(caster, target, tpz.magic.ele.WIND, 0, bonus)
    local stolen = 0

    if resist >= 0.25 and math.random() < 0.8 then
        stolen = caster:stealStatusEffect(target)
        if stolen ~= 0 and stolen ~= nil then
            spell:setMsg(tpz.msg.basic.MAGIC_STEAL)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return stolen
end
