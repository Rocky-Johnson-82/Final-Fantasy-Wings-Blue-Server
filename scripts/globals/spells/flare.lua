-----------------------------------------
-- Spell: Flare
-- Deals fire damage to an enemy and lowers its resistance against water.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = false
    spellParams.resistBonus = 1.0
    spellParams.V = 657
    spellParams.V0 = 700
    spellParams.V50 = 800
    spellParams.V100 = 900
    spellParams.V200 = 1100
    spellParams.M = 2
    spellParams.M0 = 2
    spellParams.M50 = 2
    spellParams.M100 = 2
    spellParams.M200 = 2
    spellParams.I = 684
    
    --Hazmat
    if caster:isMob() and caster:getID() == 17596520 then
        spellParams.V = 1445
    end

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster, target, spell, 30, 10, tpz.mod.WATERRES)

    return doElementalNuke(caster, spell, target, spellParams)
end
