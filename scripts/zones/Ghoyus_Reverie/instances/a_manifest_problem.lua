-----------------------------------
--
-- A Manifest Problem
-- WotG Windy Mission Quest - 04
-----------------------------------
require("scripts/globals/instance")
require("scripts/globals/keyitems")
require("scripts/globals/msg")
local ID = require("scripts/zones/Ghoyus_Reverie/IDs")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

function onInstanceCreated(instance)
    for mobID = ID.mob.MANIFEST_PROBLEM_START, ID.mob.MANIFEST_PROBLEM_END, 1
    do
        SpawnMob(mobID, instance)
    end
end

function onInstanceTimeUpdate(instance, elapsed)
    if instance:getStage() == 0 and elapsed > 900000 then -- Force a change stage to 1 after 15 mins - and send in the yags
        setInstanceWideAggro(instance)
        instance:setStage(1)
    elseif instance:getStage() == 1 then
        -- During stage 1 - respawn mobs infinitely
        for mobID = ID.mob.MANIFEST_PROBLEM_START, ID.mob.MANIFEST_PROBLEM_END, 1
        do
            local mob = GetMobByID(mobID, instance)
            if not mob:isSpawned() then
                SpawnMob(mobID, instance)
                local offset = math.random(-10, 10)
                if not mob:isEngaged() then
                    mob:pathTo(-137.27+offset, 1.0, 201.26+offset)
                end
                mob:setSpawn(-137.27+offset, 1.0, 201.26+offset)
            end
        end
    elseif instance:getStage() == 3 then
        -- track all mobs alive for win condition
        local mobs = instance:getMobs()
        local win = true
        for i, mob in pairs(mobs) do
            if mob:isSpawned() then
                win = false
            end
        end
        
        if win then
            instance:setStage(4) -- prevent possible double instance complete
            instance:complete()
        end
    end
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    -- intentionally no localVar status update on failure

    local chars = instance:getChars()
    for i, v in pairs(chars) do
        v:startEvent(10001)
    end
end

function onInstanceProgressUpdate(instance, progress)
    if progress > 45 and instance:getStage() ~= 2 and instance:getStage() ~= 3 then
        instance:setStage(2) -- Spawn the boss, stop respawn of other yagudos
    end
end

function onInstanceStageChange(instance, stage)
    if stage == 1 then
        pathAllMobsToCenter(instance, false)
    elseif stage == 2 then
        -- Attempt to respawn all yagudo who may not be currently spawned along with the boss
        local mobs = instance:getMobs()
        for i, mob in pairs(mobs) do
            if not mob:isSpawned() then
                SpawnMob(mob:getID(), instance)
            end
        end
        pathAllMobsToCenter(instance, true)
    end
    
end

function onInstanceComplete(instance)

    local chars = instance:getChars()

    for i, player in pairs(chars) do
        if (player:getCharVar("ManifestProblem") == 4) then
            player:setCharVar("ManifestProblem", 5)
            player:startEvent(10000, 300, -750, 205115, 2349) -- params dont seem to have an effect, but these are from a capture
        else
            player:startEvent(10001) -- player who dont complete the mission are put back by the colorful door
        end
    end
end

function onRegionEnter(player, region)
    local regionId = region:GetRegionID()

    local instance = player:getInstance()
    if instance ~= nil and instance:getStage() == 0 and regionId == 1 then
        instance:setStage(1) -- this triggeres the mobs to be active and begin moving in the instance
    end
    
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
     if csid == 10001 then -- A Manifest Problem
        player:setPos(-136.89, -68.25, 101.99, 0, 96) -- Send back to Fort_Karugo-Narugo_[S] on failure or non-mission completion
    elseif csid == 10000 then
        player:setPos(332.595, -4.816, -16.181, 90, 95) -- Send to West_Sarutabaruta_[S] on success and mission completion
    end
end

function pathAllMobsToCenter(instance, moveLaaYaku)
    local mobs = instance:getMobs()

    for i, mob in pairs(mobs) do
        local offset = math.random(-10, 10)
        if mob:getID() ~= ID.mob.LAA_YAKU_THE_AUSTERE or moveLaaYaku then
            if not mob:isEngaged() then
                mob:pathTo(-137.27+offset, 1.0, 201.26+offset)
            end
            mob:setSpawn(-137.27+offset, 1.0, 201.26+offset)
        end
    end
end

function setInstanceWideAggro(instance)
    local chars = instance:getChars()

    local mobs = instance:getMobs()
    for i, mob in pairs(mobs) do
        if mob and mob:isAlive() and mob:getID() ~= ID.mob.LAA_YAKU_THE_AUSTERE then
            mob:updateEnmity(chars[math.random(#chars)]) -- technically can target a dead player.  Only called if players have been idle for 15mins
        end
    end
end

