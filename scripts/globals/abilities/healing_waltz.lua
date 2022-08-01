-----------------------------------
-- Ability: Healing Waltz
-- Removes one detrimental status effect from target party member.
-- Obtained: Dancer Level 35
-- TP Required: 20%
-- Recast Time: 00:15
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local cost = 200
    if player:getMod(tpz.mod.WALTZ_COST) > 0 then
        cost = cost - 20
    end

    if target:getHP() == 0 then
        return tpz.msg.basic.CANNOT_ON_THAT_TARG, 0
    elseif player:hasStatusEffect(tpz.effect.SABER_DANCE) then
        return tpz.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif player:hasStatusEffect(tpz.effect.TRANCE) then
        return 0, 0
    elseif player:getTP() < cost then
        return tpz.msg.basic.NOT_ENOUGH_TP, 0
    else
        --[[ Apply "Waltz Ability Delay" reduction
            1 modifier = 1 second]]
        -- local recastMod = player:getMod(tpz.mod.WALTZ_DELAY)
        -- if (recastMod ~= 0) then
        --     local newRecast = ability:getRecast() +recastMod
        --     ability:setRecast(utils.clamp(newRecast, 0, newRecast))
        -- end
        -- OOE Secondary Merit Effect
        --  Apply "Fan Dance" Waltz recast reduction
        -- if (player:hasStatusEffect(tpz.effect.FAN_DANCE)) then
        --     local fanDanceMerits = target:getMerit(tpz.merit.FAN_DANCE)
        --     -- Every tier beyond the 1st is -5% recast time
        --     if (fanDanceMerits > 5) then
        --         ability:setRecast(ability:getRecast() * ((fanDanceMerits -5)/100))
        --     end
        -- end
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        local cost = 200
        if player:getMod(tpz.mod.WALTZ_COST) > 0 then
            player:delTP(cost - 20)
        else
            player:delTP(cost)
        end
    end

    local effect = target:healingWaltz()

    if (effect == tpz.effect.NONE) then
        ability:setMsg(tpz.msg.basic.NO_EFFECT) -- no effect
    else
        ability:setMsg(tpz.msg.basic.JA_REMOVE_EFFECT)
    end

    return effect
end