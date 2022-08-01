-----------------------------------
-- Area: Waughroon Shrine
--  MOB: princess_jelly
-- Author: Setzor (ported to Topaz by Twilight)
-----------------------------------
require("scripts/globals/pathfind")
require("scripts/globals/utils")
-----------------------------------

local centers = {{-177.5,60,-142},{22.5,0,18},{222.5,-60,138}}
local queens = {17367173,17367183,17367193}
local princesses = {{17367174, 17367175, 17367176, 17367177, 17367178, 17367179, 17367180, 17367181},
                    {17367184, 17367185, 17367186, 17367187, 17367188, 17367189, 17367190, 17367191},
                    {17367194, 17367195, 17367196, 17367197, 17367198, 17367199, 17367200, 17367201}}
local elementalSpells = {{235,144},     -- burn, fire
                         {240,169},     -- drown, water
                         {239,164},     -- shock, thunder
                         {238,159},     -- rasp, stone
                         {237,154},     -- choke, aero
                         {236,149},     -- frost, blizard
                         { 23, 28},     -- dia, banish
                         {230,245}}     -- bio, drain

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobInitialize(mob)    
    mob:setMobMod(tpz.mobMod.MP_BASE, 300)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 30)
    mob:setMobMod(tpz.mobMod.SUPERLINK, mob:getShortID())
    mob:setMod(tpz.mod.SLEEPRESTRAIT, 100) -- immune to sleep
    mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:speed(-20)
end

function onMobSpawn(mob)
    mob:setUnkillable(false)
    mob:setLocalVar('mobElement', math.random(1,8))
end

function allJellysInCenter(bfNum)
    local totalMobsAlive = 0
    local totalInCenter = 0
    for i,v in ipairs(princesses[bfNum]) do
        local princess = GetMobByID(v)
        if getDistanceFromCenter(bfNum,princess) <= 0.5 then
            totalInCenter = totalInCenter + 1
        end
        if not princess:isDead() then
            totalMobsAlive = totalMobsAlive + 1
        end
    end
    if totalMobsAlive == 0 then
        -- Win condition
        return false
    end
    return totalMobsAlive == totalInCenter
end

function getDistanceFromCenter(bfNum,mob)
    local pos = mob:getPos()

    local centerX = centers[bfNum][1]
    local centerY = centers[bfNum][2]
    local centerZ = centers[bfNum][3]

    local difX = pos.x-centerX
    local difY = pos.y-centerY
    local difZ = pos.z-centerZ
    return math.sqrt( math.pow(difX,2) + math.pow(difY,2) + math.pow(difZ,2) )
end

function princessesAlive(bfNum)
    local totalAlive = 0
    for i,v in ipairs(princesses[bfNum]) do
        local princess = GetMobByID(v)
        if not princess:isDead() then
            totalAlive = totalAlive + 1
        end
    end
    return totalAlive
end

function princessesTotalHP(bfNum)
    local totalHP = 0
    for i,v in ipairs(princesses[bfNum]) do
        local princess = GetMobByID(v)
        if not princess:isDead() then
            totalHP = totalHP + princess:getHP()
        end
    end
    return totalHP
end

function spawnQueenJelly(bfNum,target)
    local queen = GetMobByID(queens[bfNum])
    if not queen:isSpawned() then
        SpawnMob(queens[bfNum])
        queen:setHP(princessesTotalHP(bfNum))
        queen:setPos(centers[bfNum][1], centers[bfNum][2], centers[bfNum][3], 0)
        queen:setLocalVar('target',target:getID())
        queen:timer(3000,function(queen)
            local player = GetPlayerByID(queen:getLocalVar('target'))
            if player ~= nil and player:isAlive() then
                queen:updateClaim(player)
            end
        end)

        for i,v in ipairs(princesses[bfNum]) do
            local princess = GetMobByID(v)
            princess:setUnkillable(false)
            DespawnMob(v)
        end
    end
end

function onMonsterMagicPrepare(caster, target)
    local element = caster:getLocalVar('mobElement')
    local spell = math.random(1,3)
    if utils.getTargetDistance(caster, target) > 15 then
        return 0
    elseif spell == 1 then
        return elementalSpells[element][1] -- element spell 1
    elseif spell == 2 then
        return elementalSpells[element][2] -- element spell 2
    else
        return 258 -- bind
    end
    return 0
end

function onMobFight(mob, target)
    local bfNum = mob:getBattlefield():getArea()
    local queen = GetMobByID(queens[bfNum])
    local center = centers[bfNum]
    mob:pathThrough(center, tpz.path.flag.SCRIPT)
    if getDistanceFromCenter(bfNum,mob) <= 0.5 then
        mob:setUnkillable(true)
        if not queen:isSpawned() and allJellysInCenter(bfNum) then
            spawnQueenJelly(bfNum, target)
        end
    end
end

function onMobEngaged(mob, target)
    local bfNum = mob:getBattlefield():getArea()
    for i,v in ipairs(princesses[bfNum]) do
        local princess = GetMobByID(v)
        if not princess:isDead() then
            princess:updateEnmity(target)
        end
    end
end


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local bfNum = mob:getBattlefield():getArea()
    local queen = GetMobByID(queens[bfNum])
    if not queen:isSpawned() and allJellysInCenter(bfNum) then
        spawnQueenJelly(bfNum, player)
    end
end
