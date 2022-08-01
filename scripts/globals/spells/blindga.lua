-----------------------------------------
-- Spell: Blind
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)

    if target:getMod(tpz.mod.STATUSRES) >= 100 or target:getMod(tpz.mod.BLINDRES) >= 100 then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return tpz.effect.BLINDNESS
    end

    -- Pull base stats.
    local dINT = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.MND)) --blind uses caster INT vs target MND

    -- Base power.  May need more research.
    local power = math.floor(dINT * 9/40) + 23

    if (power < 5) then
        power = 5
    end

    if (power > 50) then
        power = 50
    end

    local params = {}
    params.diff = nil
    params.attribute = tpz.mod.INT
    params.skillType = 35
    params.bonus = 0
    params.effect = tpz.effect.BLINDNESS
    -- Duration, including resistance.  Unconfirmed.
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = math.ceil(180 * resist * tryBuildResistance(tpz.mod.RESBUILD_BLIND, target))
    if (duration >= 60) then --Do it!
        if (target:addStatusEffect(tpz.effect.BLINDNESS, power, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
    return tpz.effect.BLINDNESS
end