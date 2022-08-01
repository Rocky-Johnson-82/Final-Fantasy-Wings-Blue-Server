---------------------------------------------------------------------------------------------------
-- func: getweaponskillpoints <slot> {player}
-- desc: Shows weapon skill points of an equipped item.
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 3,
    parameters = "is"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getweaponskillpoints <slot> {player} (main=0, sub=1, ranged=2)")
end

function onTrigger(player, slot, target)

    -- validate slot
    if slot == nil or slot < tpz.slot.MAIN or slot > tpz.slot.RANGED then
        error(player, "Slot out of range.")
        return
    end

    -- validate target
    if target == nil then
        target = player
    else
        target = GetPlayerByName(target)
        if target == nil then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    local item = target:getStorageItem(0, 0, slot)
    if item == nil then
        local slotname = slot == 0 and 'main' or slot == 1 and 'sub' or slot == 2 and 'ranged'
        error(player, string.format('No weapon equipped in %s slot.', slotname))
        return
    end

    -- get weaponskill points
    player:PrintToPlayer(string.format('%s\'s weapon %s has %s weapon skill points.', target:getName(), item:getName(), item:getWeaponskillPoints()))
    
end
