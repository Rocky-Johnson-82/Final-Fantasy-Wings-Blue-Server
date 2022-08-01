-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: qm1 (???)
-- !pos 203.939 0.000 -238.811 120
-- Notes: Spawns Dribblix Greasemaw for ACP mission "Gatherer of Light (I)"
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
-----------------------------------

function onSpawn(npc)
    if ENABLE_ACP == 0 then
        npc:setStatus(tpz.status.DISAPPEAR)
    end
end

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not GetMobByID(ID.mob.DRIBBLIX_GREASEMAW):isSpawned() and player:hasKeyItem(tpz.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB) and not player:hasKeyItem(tpz.ki.SEEDSPALL_VIRIDIS) and not player:hasKeyItem(tpz.ki.VIRIDIAN_KEY) then
        player:messageSpecial(ID.text.FOREBODING)
        SpawnMob(ID.mob.DRIBBLIX_GREASEMAW):updateClaim(player)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS) -- NOTHING_OUT_OF_ORDINARY
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
