-----------------------------------
-- Area: Appolyon
-- Name: NE Apollyon
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Apollyon/IDs")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("randomF1", math.random(1,6))
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("tick", 0)
    SetServerVariable("[NE_Apollyon]Time", battlefield:getTimeLimit()/60)
    tpz.limbus.handleDoors(battlefield)
    tpz.limbus.setupArmouryCrates(battlefield:getID())
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[SW_Apollyon]Time", battlefield:getRemainingTime()/60)
     end

     battlefield:setLocalVar("tick", battlefield:getLocalVar("tick") + 1)

     if battlefield:getLocalVar("tick") >= 90 then
         tpz.battlefield.onBattlefieldTick(battlefield, tick)
     end
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(tpz.ki.COSMOCLEANSE)
    player:delKeyItem(tpz.ki.BLACK_CARD)
end

function onBattlefieldDestroy(battlefield)
    tpz.limbus.handleDoors(battlefield, true)
    SetServerVariable("[NE_Apollyon]Time", 0)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    player:messageSpecial(ID.text.HUM+1)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end