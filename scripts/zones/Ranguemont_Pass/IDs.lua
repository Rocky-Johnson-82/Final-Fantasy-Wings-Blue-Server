-----------------------------------
-- Area: Ranguemont Pass (166)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.RANGUEMONT_PASS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING      = 6403,  -- You are suddenly overcome with a sense of foreboding...
        FELLOW_MESSAGE_OFFSET    = 6417,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS      = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY  = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER             = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        GEOMAGNETRON_ATTUNED     = 7010,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7208,  -- You can't fish here.
        REGIME_REGISTERED        = 9518,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 10669, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        PLAYER_OBTAINS_ITEM      = 10570, -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10571, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10572, -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP     = 10573, -- You already possess that temporary item.
        NO_COMBINATION           = 10578, -- You were unable to enter a combination.
    },
    mob =
    {
        GLOOM_EYE_PH =
        {
            [17457200] = 17457204,
        },
        TAISAIJIN_PH =
        {
            17457213, -- -18.325 1.830 -114.932
            17457214, -- -5.188 11.730 -141.503
            17457215, -- 59.15 -120 50
        },
        HYAKUME_PH =
        {
            [17457229] = 17457236, -- 125.987, 3.561, -57.222
        },
        TAISAIJIN    = 17457216,
        TROS         = 17457309,
        MUCOID_MASS  = 17457245,
    },
    npc =
    {
        CASKET_BASE  = 17457315,
    },
}

return zones[tpz.zone.RANGUEMONT_PASS]