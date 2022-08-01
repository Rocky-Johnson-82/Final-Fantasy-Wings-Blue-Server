-----------------------------------
-- Area: Bostaunieux_Oubliette
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.BOSTAUNIEUX_OUBLIETTE] =
{
    text =
    {
        CONQUEST_BASE            = 0,     -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED  = 6541,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6547,  -- Obtained: <item>.
        GIL_OBTAINED             = 6548,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6550,  -- Obtained key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL      = 6552, -- You do not have enough gil.
        NOTHING_OUT_OF_ORDINARY  = 6561,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET    = 6576,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS      = 7158, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY  = 7159, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER             = 7160, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        FISHING_MESSAGE_OFFSET   = 7208,  -- You can't fish here.
        CHUMIA_DIALOG            = 7308,  -- Welcome to Bostaunieux Oubliette...
        SEEMS_LOCKED             = 7310,  -- It seems to be locked.
        SPIRAL_HELL_LEARNED      = 7417,  -- You have learned the weapon skill Spiral Hell!
        SENSE_OMINOUS_PRESENCE   = 7418,  -- You sense an ominous presence...
        ITEMS_ITEMS_LA_LA        = 7421,  -- You can hear a strange voice... Items, items, la la la la la
        GOBLIN_SLIPPED_AWAY      = 7427,  -- The Goblin slipped away when you were not looking...
        REGIME_REGISTERED        = 9532,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 10625, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        PLAYER_OBTAINS_ITEM      = 10584, -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10585, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10586, -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP     = 10587, -- You already possess that temporary item.
        NO_COMBINATION           = 10592, -- You were unable to enter a combination.
        LS_CONCIERGE_LISTING_CANCEL = 10654, -- It was my pleasure to meet with you this fine day. May you encounter many friendly faces throughout your travels.
        LS_CONCIERGE_SAME_DAY       = 14658, -- In the interest of fairness, I am unable to distribute multiple linkpearls to someone on the same day. Please come back tomorrow.
        LS_CONCIERGE_REGISTERED1    = 10706, -- Your registration is officially complete.
        LS_CONCIERGE_REGISTERED2    = 10707, -- May your journeys lead you to many as-yet-unmet friends, and may the bonds you forge last a lifetime.
        LS_CONCIERGE_ALREADY_LISTED = 10708, -- Another member of that linkshell currently has an active registration. Please wait until that registration expires and try again.
    },
    mob =
    {
        SEWER_SYRUP_PH          =
        {
            [17461354] = 17461307, -- -42.649, 0.992, -340.026
            [17461357] = 17461307, -- -25.787, 0.978, -343.811
            [17461358] = 17461307, -- -23.896, 0.511, -344.890
        },
        SHII_PH                 =
        {
            [17461311] = 17461315, -- -59.000 0.941 -149.000
            [17461334] = 17461315, -- -64.000 -0.500 -144.000
            [17461277] = 17461315, -- -65.000 -1.000 -137.000
            [17461309] = 17461315, -- -64.000 0.950 -132.000
            [17461312] = 17461315, -- -53.000 -0.500 -137.000
            [17461308] = 17461315, -- -57.000 0.998 -135.000
        },
        ARIOCH_PH               =
        {
            [17461322] = 17461433, -- -259 0.489 -188
        },
        MANES_PH                =
        {
            [17461469] = 17461471,
            [17461470] = 17461471,
            [17461476] = 17461471,
            [17461477] = 17461471,
        },
        DREXERION_THE_CONDEMNED = 17461338,
        PHANDURON_THE_CONDEMNED = 17461343,
        BLOODSUCKER             = 17461478,
        BODACH                  = 17461479,
        SHII                    = 17461315,
    },
    npc =
    {
        CASKET_BASE = 17461487,
    },
}

return zones[tpz.zone.BOSTAUNIEUX_OUBLIETTE]
