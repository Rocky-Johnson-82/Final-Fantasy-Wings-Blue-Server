-----------------------------------
-- Area: Southern_San_dOria
--  NPC: Valeriano
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4394,     10,    -- Ginger Cookie
        17345,    43,    -- Flute
        17347,   990,    -- Piccolo
        5017,    585,    -- Scroll of Scop's Operetta
        5018,  16920,    -- Scroll of Puppet's Operetta
        5013,   2916,    -- Scroll of Fowl Aubade
        5027,   2059,    -- Scroll of Advancing March
        5072,  90000,    -- Scroll of Goddess's Hymnus
     --   14532, 2500,    --- onoko yukata (4th of jly version)
      --  14533, 2500,   --- ladys yukata (4th of july version)
      --  4252, 25,   --summer fan
       -- 5883, 125,   --falling star
       -- 5881, 125,  --shisai kabuko (sparkler)
       -- 5882, 125,  --firework marine bliss
        --14450, 5000,  ---hume gilet
        ---15408, 5000, --hume trunks
        --14451, 5000, --hume top
        --15409, 5000, --home shorts
        --14454, 5000,  --taru maillot
        --15412, 5000,  --taru trunks
        --14471, 5000, --taru top
        --15423, 5000,  --taru shorts
        --14452, 5000, --elvaan gilet
        --15410, 5000, -- elvaan trunks
        --15411, 5000, -- elvaan shorts
        --14456, 5000, --galka gilet
        --15414, 5000, -- galka trunks
        --14455, 5000, -- mithra top
        --15413, 5000, -- mithra shortss
    }

    player:showText(npc, ID.text.VALERIANO_SHOP_DIALOG)
    tpz.shop.general(player, stock, SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
