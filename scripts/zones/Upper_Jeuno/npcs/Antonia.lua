-----------------------------------
-- Area: Upper Jeuno
--  NPC: Antonia
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        --[[
        21504, 100100,    -- Arasy Sainti
        21554, 100100,    -- Arasy Knife
        21604, 100100,    -- Arasy Sword
        21654, 100100,    -- Arasy Claymore
        21704, 100100,    -- Arasy Tabar
        21762, 100100,    -- Arasy Axe
        21812, 100100,    -- Arasy Scythe
        21865, 100100,    -- Arasy Lance
        21909, 100100,    -- Yoshikiri
        21960, 100100,    -- Ashijiro no Tachi
        22015, 100100,    -- Arasy Rod
        22074, 100100,    -- Arasy Staff
        22122, 100100,    -- Arasy Bow
        22135, 100100,    -- Arasy Gun
        21392, 100100,    -- Animator Z
        21393, 100100,    -- Arasy Sachet
        ]]
        17061, 6256, -- mythril rod
        17027, 11232, -- oak cudgel
        17036, 18048, -- mythril mace
        17044, 6033, -- warhammer
        17089, 37440, -- oak pole
        16836, 44550, -- halberd
        16774, 10596, -- scythe
        17320, 7, -- iron arrow
    }

    player:showText(npc, ID.text.ANTONIA_SHOP_DIALOG)
    tpz.shop.general(player, stock, JEUNO)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
