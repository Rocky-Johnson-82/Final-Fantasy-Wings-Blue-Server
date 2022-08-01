-----------------------------------
-- Area: Bastok Mines
--  NPC: Deegis
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        12450, 18360, 1,     --Padded Cap
        12424,  9234, 1,     --Iron Mask
        12578, 28339, 1,     --Padded Armor
        12706, 15552, 1,     --Iron Mittens
        12449,  1471, 2,     --Brass Cap
        12440,   396, 2,     --Leather Bandana
        12577,  2236, 2,     --Brass Harness
        12568,   604, 2,     --Leather Vest
        12705,  1228, 2,     --Brass Mittens
        12696,   324, 2,     --Leather Gloves
        12448,   151, 3,     --Bronze Cap
        12576,   230, 3,     --Bronze Harness
        12552, 14256, 3,     --Chainmail
        12704,   126, 3,     --Bronze Mittens
        12680,  7614, 3,     --Chain Mittens
        14585, 8000, 3, -- Fourth Tunica
        18727, 83000, 3, -- Fourth Division Gun
        18494, 113000, 3, -- Fourth Division Toporok
        18854, 98000, 3, -- Fourth Division Mace
        18946, 88000, 3, -- Fourth Division Zaghnal
    }

    player:showText(npc, ID.text.DEEGIS_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
