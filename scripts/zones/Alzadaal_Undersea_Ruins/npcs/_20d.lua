-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Doors (South)
-- !pos 180 0 -39 72
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------

function onTrigger(player, npc)
    if player:hasKeyItem(tpz.ki.NYZUL_ISLE_ASSAULT_ORDERS) and player:getZPos() >= -39.1 and player:getZPos() <= -35 then
        player:messageSpecial(ID.text.CANNOT_LEAVE, tpz.ki.NYZUL_ISLE_ASSAULT_ORDERS)
    elseif player:getZPos() >= -39.1 and player:getZPos() <= -37 then
        player:messageSpecial(ID.text.STAGING_POINT_NYZUL)
        player:messageSpecial(ID.text.IMPERIAL_CONTROL)
        player:startEvent(115)
    elseif player:getZPos() >= -42 and player:getZPos() <= -40 then
        player:messageSpecial(ID.text.STAGING_POINT_NYZUL)
        player:messageSpecial(ID.text.IMPERIAL_CONTROL)
        player:startEvent(114)
    else
        player:messageSpecial(ID.text.MOVE_CLOSER)
    end
end

function onEventUpdate(player, csid, option)
	if csid == 114 and option == 0 then
		for _, entry in pairs(player:getNotorietyList()) do
			entry:deaggroPlayer(player:getName()) -- reset hate on player entering staging point
		end
	end
end

function onEventFinish(player, csid, option)

end
