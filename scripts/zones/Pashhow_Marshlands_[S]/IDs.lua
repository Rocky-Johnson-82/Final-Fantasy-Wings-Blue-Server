-----------------------------------
-- Area: Pashhow_Marshlands_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.PASHHOW_MARSHLANDS_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6388, -- Obtained: <item>.
        GIL_OBTAINED                  = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY       = 6402, -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET         = 6417, -- I'm ready. I suppose.
        CARRIED_OVER_POINTS           = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER                  = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        CANNOT_ENTER_LEVEL_RESTRICTED = 7021, -- Your party is unable to participate because certain members' levels are restricted.
        FISHING_MESSAGE_OFFSET        = 7146, -- You can't fish here.
        CONQUEST_BASE                 = 7246, -- Tallying conquest results...
        THERE_IS_NO_REPONSE           = 7866, -- There is no response...
        ALREADY_OBTAINED_TELE         = 7691, -- You already possess the gate crystal for this telepoint.
        CANNOT_ENTER                  = 7875, -- You cannot enter at this time. Please wait a moment and try again.
        PARTY_REQUIREMENTS_FAILED     = 7881, -- Not all of your party members meet the requirements for this objective. Unable to enter area.
        COMMON_SENSE_SURVIVAL         = 9071, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SUGAAR_PH =
        {
            [17145862] = 17145867, -- -412.599 24.437 -431.639
            [17145863] = 17145867, -- -455.311 24.499 -472.247
            [17145864] = 17145867, -- -446.738 24.499 -443.850
            [17145865] = 17145867, -- -417.691 23.840 -485.922
            [17145866] = 17145867, -- -444.380 24.499 -487.828
        },
        NOMMO_PH =
        {
            [17146007] = 17146012, -- -168.292 24.499 396.933
            [17146008] = 17146012, -- -165.745 24.499 349.06
        },
        KINEPIKWA = 17146147,
    },
    npc =
    {
        INDESCRIPT_MARKINGS_OFFSET = 17146626,
    },
}

return zones[tpz.zone.PASHHOW_MARSHLANDS_S]
