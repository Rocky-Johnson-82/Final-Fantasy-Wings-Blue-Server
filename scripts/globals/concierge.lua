-----------------------------------
--  NPC: Linkshell_Concierge Helper
--  Working 98%
-----------------------------------
require("scripts/globals/settings")
-----------------------------------

tpz = tpz or {}
tpz.lsconciergetype = tpz.lsconciergetype or {}
LINKSHELL_CONCIERGE_SHARE = LINKSHELL_CONCIERGE_SHARE or 0

------------------------------------
-- Concierge Types
------------------------------------

tpz.lsconciergetype =
{
    EVERYTHING = 0,
    ANYTHING   = 0,
    HARDCORE   = 1,
    CASUAL     = 2,
    HNM        = 3,
    NEWPLAYERS = 4,
    NEW        = 4,
    ASSIST     = 5,
    TRADING    = 6,
    SYNTHESIS  = 6,
    CRAFTING   = 6,
    NOTHING    = 7,
    NONE       = 7,
}


function LinkShellConciergeEventTrigger(player, npc, conciergeNumber, conciergeType)

    -- conciergeNumber should be 0, 1 or 2, used to select which NPC will be "talking" to you
    -- conciergeType defines what text the NPC displays and type it handles in
    -- 0 = Do everything
    -- 1 = Hard-Core battle content
    -- 2 = Casual battle content
    -- 3 = HNM Vanquishing
    -- 4 = Meet other new players
    -- 5 = Assist each other
    -- 6 = Trading (and synthesis)
    -- 7 = Nothing

    -- player:PrintToPlayer("LSCon-Trigger: Called")
    
    -- Get the Linkshell ID (and item type)
    -- Only slot 1 is taken into account (this is the intended behavior)
    local myLinkShellID, myLinkShellType = player:getLinkShellID(0)
    if myLinkShellID and myLinkShellType > 2 then
        -- Only the shell owner and sack holders are allowed to register.
        -- Whether shell ID is set to zero or not is what decides whether the
        -- NPC allows you to register or not.
        myLinkShellID = 0x0000
        myLinkShellType = 3
    end

    if LINKSHELL_CONCIERGE_SHARE == 1 then
        player:startEvent(6100 + conciergeNumber, tpz.lsconciergetype.EVERYTHING, player:getGil(), 0, 0, 0, 0, 0, myLinkShellID)
    else
        player:startEvent(6100 + conciergeNumber, conciergeType, player:getGil(), 0, 0, 0, 0, 0, myLinkShellID)
    end
end

function LinkShellConciergeEventUpdate(player, csid, option, cannot_be_obtained_id, same_day_id)
    -- player:PrintToPlayer(string.format("LSCon-Update: Option is: %u", option))
    
    local lsCmd = option % 0x00000008
    local res = player:lsConciergeUpdate(csid, option, LINKSHELL_CONCIERGE_SHARE)
    
    if lsCmd == 5 and res == 98 then
        -- Dummy value indicating the player's inventory is full
        player:messageSpecial(cannot_be_obtained_id, 0x203)
        -- Prevent extra dialog (see below)
        player:release()
    elseif lsCmd == 5 and res == 97 then
         -- Dummy value indicating the player is trying to get more than one pearl per (Vana'diel) day
        player:messageText(player:getEventTarget(), same_day_id)
        -- player:release() is needed to stop the NPC from saying the "bestow" dialog.
        -- if anyone realizes how retail used to do this, feel free to fix.
        player:release()
    end
end

function LinkShellConciergeEventFinishInternal(player, csid, option)

    local lsCmd = option % 0x00000008
    local lsOptions = (option - lsCmd) / 0x00000008
    local myLinkShellID, myLinkShellType = player:getLinkShellID(0) -- get the Linkshell ID (and item type)
    if myLinkShellID and myLinkShellType > 2 then
        -- Only the shell owner and sack holders are allowed to register.
        myLinkShellID = 0x0000
        myLinkShellType = 3
    end

    if option == 0x40000000 then
        -- do nothing (cancelled/exit dialog normally)
        return 0
    elseif lsCmd == 1 then
        -- option 1 when "selling" pearls (is always LinkShell #1 that is used)

        -- player:PrintToPlayer(string.format("LSCon-Finish: CSID is %u   Option is: %u -> Finished selling pearls - %u", csid, option, lsOptions), 4 )

        local vLang = 0  -- What we'll use for None/Other
        local vLangFlags = lsOptions % 0x20  -- J E _ _ O
        lsOptions = bit.rshift(lsOptions, 5)

        local vCount = (lsOptions % 0x10) -- pearl count
        lsOptions = bit.rshift(lsOptions, 4)

        local vDays = (lsOptions % 0x10) -- Everyday, weekends, weekdays, mon..sun
        lsOptions = bit.rshift(lsOptions, 4)

        local vTimeZone = lsOptions % 0x4  -- none, JP, US, EU
        lsOptions = bit.rshift(lsOptions, 2)

        local vTimeOfDay = lsOptions % 0x8  -- morning, afternoon, evening, night, dawn
        lsOptions = bit.rshift(lsOptions, 2)

        if vLangFlags == 0x01 then
            vLang = 1
            -- player:PrintToPlayer("LSCon-Finish: Japanese", 4)
        elseif vLangFlags == 0x02 then
            vLang = 2
            -- player:PrintToPlayer("LSCon-Finish: English", 4)
        elseif vLangFlags == 0x10 then
            vLang = 0
            -- player:PrintToPlayer("LSCon-Finish: Other Language", 4)
        else
            vLang = 0
            -- player:PrintToPlayer(string.format("LSCon-Finish: Unknown Language Flags Combination: %u", vLangFlags))
        end

        -- player:PrintToPlayer(string.format("LSCon-Finish: LanguageFlags %u", vLangFlags), 4 )
        -- player:PrintToPlayer(string.format("LSCon-Finish: Language %u", vLang), 4 )
        -- player:PrintToPlayer(string.format("LSCon-Finish: PearlCount %u", vCount), 4 )
        -- player:PrintToPlayer(string.format("LSCon-Finish: Days %u", vDays), 4 )
        -- player:PrintToPlayer(string.format("LSCon-Finish: TimeZone %u", vTimeZone), 4 )
        -- player:PrintToPlayer(string.format("LSCon-Finish: TimeOfDay %u", vTimeOfDay), 4 )

        if myLinkShellID then
            if player:getGil() >= 0 then
                -- player:PrintToPlayer(string.format("LSCon-Finish: Linkshell registration not implemented yet -- CSID: %u -- option: %u", csid,option) ,4)
                local addResult = 0
                -- addResult = 99  -- Already registered
                addResult = player:lsConciergeRegister(myLinkShellID, player:getEventTarget():getID(), vLang, vCount, vDays, vTimeZone, vTimeOfDay, LINKSHELL_CONCIERGE_SHARE)

                if addResult == 1 then
                    player:delGil(0) -- The 500 gil is hard-coded into the dialog, so making this variable doesn't make much sense, you still could change it however, but the client only checks for 500 on-hand
                end

                return addResult
            else
                -- Dummy code for not enough gil
                return 96
            end
        else
            -- normally the client won't allow you to select adding a listing if you are not a shell or sack holder
            -- so technically you shouldn't be able to get here without a LS in slot 1
            -- player:PrintToPlayer(string.format("LSCon-Finish: You must have a linkshell equipped in slot 1 to register"))
            return 0xFF
        end

        --player:PrintToPlayer(string.format("LSCon-Finish: Pearls: %u", vCount) ,4)
        --player:PrintToPlayer(string.format("LSCon-Finish: Active Days: %u", vDays) ,4)
        --player:PrintToPlayer(string.format("LSCon-Finish: TimeZone: %u", vTimeZone) ,4)
        --if vTimeZone > 0 then
        --    player:PrintToPlayer(string.format("LSCon-Finish: TimeOfDay: %u", vTimeOfDay) ,4)
        --end
        --if lsOptions > 0 then
        --    player:PrintToPlayer(string.format("LSCon-Finish: _restbits: %u", lsOptions) ,4)
        --end

    elseif lsCmd == 2 then
        -- option 2 when a pearl is "bought"
        return 2
        -- player:PrintToPlayer(string.format("LSCon-Finish: CSID is %u   Option is: %u -> Finished getting new pearl", csid, option) ,4)
    elseif lsCmd == 3 then
        -- option 3 when current listing is canceled by owner
        -- player:PrintToPlayer(string.format("LSCon-Finish: CSID is %u   Option is: %u -> Finished canceling listed LinkShell (by owner)", csid,option) ,4)
        -- returns 3 on success, 0xFF on fails
        return player:lsConciergeCancel(myLinkShellID,player:getEventTarget():getID(), LINKSHELL_CONCIERGE_SHARE)
    else
        -- player:PrintToPlayer(string.format("LSCon-Finish: Unknown Data:  CSID is %u   Option is: %u ", csid, option) ,4)
    end

    return 0xFF
end

function LinkShellConciergeEventFinish(player, csid, option, registered1_id, registered2_id, already_listed_id, cancel_id, item_obtained_id, not_enough_gil_id)
    -- player:PrintToPlayer(string.format("LSCon-Finish: Option is: %u", option))
    local res = LinkShellConciergeEventFinishInternal(player, csid, option)

    if res == 0 then
        -- Do nothing
    elseif res == 1 then
        -- Listed Pearls
        player:messageText(player:getEventTarget(), registered1_id)
        player:messageText(player:getEventTarget(), registered2_id)
    elseif res == 99 then
        -- Dummy value indicating that the linkshell is already listed
        player:messageText(player:getEventTarget(), already_listed_id)
    elseif res == 96 then
        -- Dummy value indicating that the player doesn't have the 500 gil needed to register
        player:messageText(player:getEventTarget(), not_enough_gil_id)
    elseif res == 2 then
        -- Aquired Pearl
        player:messageSpecial(item_obtained_id, 0x0203) -- Linkpearl
    elseif res == 3 then
        -- Cancelled Pearl
        player:messageText(player:getEventTarget(), cancel_id)
    else
        -- player:PrintToPlayer(string.format("LSConFinish: Unexpected result for -- Result: %u -- CSID: %u -- option: %u", res, csid, option))
    end
end
