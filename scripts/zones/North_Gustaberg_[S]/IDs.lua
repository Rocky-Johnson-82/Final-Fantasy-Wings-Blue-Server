-----------------------------------
-- Area: North_Gustaberg_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.NORTH_GUSTABERG_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        FELLOW_MESSAGE_OFFSET   = 6417, -- I'm ready. I suppose.
        CARRIED_OVER_POINTS     = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        LYCOPODIUM_ENTRANCED    = 7056, -- The lycopodium is entranced by a sparkling light...
        CONQUEST_BASE           = 7261, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7355, -- You can't fish here.
        MINING_IS_POSSIBLE_HERE = 7544, -- Mining is possible here if you have <item>.
        COMMON_SENSE_SURVIVAL   = 9076, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        ANKABUT_PH =
        {
            [17137701] = 17137705, -- 656.399 -11.580 507.091
        },
        GLOOMANITA_PH =
        {
            [17137820] = 17137821, -- -19.961 0.5 623.989
        },
        OLGOI_KHORKHOI = 17137859,
    },
    npc =
    {
        MINING =
        {
            17138511,
            17138512,
            17138513,
            17138514,
            17138515,
            17138516,
        },
    },
}

return zones[tpz.zone.NORTH_GUSTABERG_S]
