-----------------------------------------
-- ID: 5263
-- Item: Bottle Of Terroanima
-- Item Effect: Terror
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/player")
-----------------------------------------

function onItemCheck(target, param, player)
    local result = 0
    local id = target:getID()

	if id ~= 16855041 and id ~= 16855046 and id ~= 16855051 and 
	id ~= 16846849 and id ~= 16846850 and id ~= 16846851 and
	id ~= 16863233 and id ~= 16863234 and id ~= 16863235 and
	id ~= 16871425 and id ~= 16871426 and id ~= 16871431 and 
	id ~= 16871432 and id ~= 16871433 and id ~= 16871438 and
	id ~= 16871439 and id ~= 16871440 and id ~= 16871445 and
	id ~= 16867330 and id ~= 16867329 and id ~= 16867333 then
        result = tpz.msg.basic.ITEM_UNABLE_TO_USE
    elseif target:checkDistance(player) > 10 then
        result = tpz.msg.basic.TOO_FAR_AWAY
    end

    return result
end

function onItemUse(target)
	target:setLocalVar("EmptyTerror",os.time()+math.random(25,32))
	target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.TERROR)
end