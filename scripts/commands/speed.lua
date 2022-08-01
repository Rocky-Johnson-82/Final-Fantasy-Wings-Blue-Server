---------------------------------------------------------------------------------------------------
-- func: speed
-- desc: Sets the players movement speed.
---------------------------------------------------------------------------------------------------
require("scripts/globals/status");

cmdprops =
{
    permission = 2,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!speed <0-255>")
end

function onTrigger(player, speed)
    if not speed then
        player:PrintToPlayer(string.format("Current Speed: %u", player:speed()))
        player:PrintToPlayer(string.format("Current tpz.mod.MOVE: %u", player:getMod(tpz.mod.MOVE)))
        return
    end

    -- Validate speed amount
    if speed < 0 or speed > 255 then
        error(player, "Invalid speed amount.")
        return
    end

    -- Inform player and set speed
    player:PrintToPlayer(string.format("Old Speed: %u", player:speed()))
    player:PrintToPlayer(string.format("New Speed: %u", speed))
    player:speed(speed)
end