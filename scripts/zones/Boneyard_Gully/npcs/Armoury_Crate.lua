-----------------------------------
-- Area: Boneyard Gully
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: Like the Wind
    [673] =
    {
        {
            {itemid =     0, droprate =  140}, -- nothing
            {itemid =  1763, droprate =  310}, -- Viridian Urushi
            {itemid =  1769, droprate =  241}, -- Square of Galateia
            {itemid =  1764, droprate =  310}, -- Kejusu Satin
        },
        {
            {itemid =     0, droprate =  862}, -- nothing
            {itemid =  1842, droprate =  138}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  380}, -- nothing
            {itemid = 17946, droprate =  138}, -- Maneater
            {itemid = 18358, droprate =  172}, -- Wagh Baghnakhs
            {itemid = 16976, droprate =  138}, -- Onimaru
            {itemid =  4990, droprate =  172}, -- Army's Paeon V
        },
        {
            {itemid =     0, droprate =  380}, -- nothing
            {itemid = 17946, droprate =  138}, -- Maneater
            {itemid = 18358, droprate =  172}, -- Wagh Baghnakhs
            {itemid = 16976, droprate =  138}, -- Onimaru
            {itemid =  4990, droprate =  172}, -- Army's Paeon V
        },
    },

    -- ENM: Sheep in Antlion's Clothing
    [674] =
    {
        {
            {itemid =    0, droprate = 124}, -- nothing
            {itemid = 1769, droprate = 268},  -- Square of Galateia (26.8% Drop Rate)
            {itemid = 1764, droprate = 266},  -- Kejusu Satin
            {itemid = 1763, droprate = 342},  -- Viridian Urushi
        },
        {
            {itemid =    0, droprate = 944}, -- nothing
            {itemid = 1842, droprate = 56},   -- Cloud Evoker (5.6% Drop Rate)
        },
        {
            {itemid =     0, droprate = 607}, -- nothing
            {itemid = 17829, droprate = 70},  -- Hagun
            {itemid = 17945, droprate = 78},  -- Martial Axe
            {itemid = 17467, droprate = 52},  -- Martial Wand
            {itemid = 13690, droprate = 90}, -- Forager's Mantle
            {itemid = 13109, droprate = 103}, -- Harmonia's Torque
        },
        {
            {itemid =     0, droprate = 935}, -- nothing
            {itemid = 17829, droprate = 12},  -- Hagun
            {itemid = 17945, droprate = 13},  -- Martial Axe
            {itemid = 17467, droprate = 10},  -- Martial Wand
            {itemid = 13690, droprate = 14}, -- Forager's Mantle
            {itemid = 13109, droprate = 16}, -- Harmonia's Torque
        },
        {
            {itemid =     0, droprate = 994}, -- nothing
            {itemid = 17829, droprate = 1},  -- Hagun
            {itemid = 17945, droprate = 1},  -- Martial Axe
            {itemid = 17467, droprate = 1},  -- Martial Wand
            {itemid = 13690, droprate = 1}, -- Forager's Mantle
            {itemid = 13109, droprate = 2}, -- Harmonia's Torque
        },
    },

    -- ENM: Shell We Dance?
    [675] =
    {
        {
            {itemid =    0, droprate =  34}, -- nothing
            {itemid = 1762, droprate = 375},  -- Cassia Lumber
            {itemid = 1767, droprate = 328},  -- Eltoro Leather
            {itemid = 1771, droprate = 263},  -- Dragon Bone
        },
        {
            {itemid =    0, droprate =  812}, -- nothing
            {itemid = 1842, droprate = 188},  -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  199}, -- nothing
            {itemid = 18099, droprate = 150}, -- Stone-splitter
            {itemid = 17365, droprate = 175}, -- Frenzy Fife
            {itemid = 18015, droprate = 238}, -- Blau Dolch
            {itemid = 4990, droprate = 238},  -- Scroll of Army's Paeon V
        },
        {
            {itemid =     0, droprate =  199}, -- nothing
            {itemid = 18099, droprate = 150}, -- Stone-splitter
            {itemid = 17365, droprate = 175}, -- Frenzy Fife
            {itemid = 18015, droprate = 238}, -- Blau Dolch
            {itemid = 4990, droprate = 238},  -- Scroll of Army's Paeon V
        },
    },

    -- ENM: Totentanz (Wiki did not have groupings or droprates, these values are guesses based on other ENMs)
    [676] =
    {
        {
            {itemid = 16976, droprate = 82},  -- Onimaru
            {itemid = 18015, droprate = 238}, -- Blau Dolch
            {itemid = 18099, droprate = 150}, -- Stone-splitter
            {itemid = 17946, droprate = 92},  -- Maneater
            {itemid = 18358, droprate = 63},  -- Wagh Baghnakhs
            {itemid = 17469, droprate = 65},  -- Raise II Rod
            {itemid = 17365, droprate = 175}, -- Frenzy Fife
            {itemid = 15464, droprate = 83},  -- Corse Cape
            {itemid = 1842, droprate = 188},  -- Cloud Evoker
            {itemid = 1763, droprate = 342},  -- Viridian Urushi
            {itemid = 1767, droprate = 328},  -- Eltoro Leather
            {itemid = 1841, droprate = 238},  -- Unicorn Horn
            {itemid = 1762, droprate = 375},  -- Cassia Lumber
            {itemid = 1771, droprate = 263},  -- Dragon Bone
        },
    }
}

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        tpz.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
