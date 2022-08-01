-----------------------------------
-- Area: Sacrarium
--  Mob: Old Professor Mariselle
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/pathfind")
require("scripts/globals/regimes")
-----------------------------------

local function Teleport(mob, hideDuration)

    if mob:isDead() then
        return
    end

    mob:hideName(true)
    mob:untargetable(true)
    mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:SetMobSkillAttack(false)
    mob:entityAnimationPacket("kesu")

    hideDuration = hideDuration or 5000

    if hideDuration < 1500 then
        hideDuration = 1500
    end

    mob:timer(hideDuration, function(mob)
    mob:hideName(false)
    mob:untargetable(false)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:SetMobSkillAttack(true)

        if mob:isDead() then
            return
        end

        mob:entityAnimationPacket("deru")
    end)
end

function onMobSpawn(mob)
    GetNPCByID(16892155):setLocalVar("profLocation", GetServerVariable("old_prof_spawn_location"))
end

function onMobFight(mob, target)

    local OP_Mariselle = mob:getID()

    -- Setting up potential tele locations in each room that can be referenced later
    SW = --Southwest room
    {
        {8.7566, -2.0000, -109.7524},
        {20.8865, -2.0000, -110.3810},
        {31.4743, -2.0000, -110.4831},
        {31.4395, -2.0000, -115.9673},
        {18.1959, -2.0000, -116.3700},
        {8.1382, -2.0000, -116.6599},
        {11.1776, -2.1785, -129.9487},
        {19.9970, -2.7298, -129.7488},
        {29.3828, -2.1785, -129.9017},  
    }
    SM = --Southmid room
    {
        {49.0167, -2.0000, -109.8401},
        {60.2168, -2.0000, -109.9171},
        {73.0027, -2.0000, -110.6675},
        {72.0441, -2.0000, -115.7637},
        {58.3822, -2.0000, -116.0210},
        {48.5663, -2.0000, -116.0103},
        {49.0839, -2.1785, -130.2026},
        {62.3159, -2.6880, -129.7956},
        {69.3685, -2.1785, -129.3329}   
    }
    SE = --Southeast room
    {
        {110.3006, -2.1785, -129.8003},
        {98.4509, -2.7298, -129.8176},
        {90.0133, -2.1785, -128.4242},
        {89.6509, -2.0000, -115.7570},
        {100.2014, -2.0000, -115.8586},
        {112.5715, -2.0000, -115.8909},
        {111.0784, -2.0000, -109.7074},
        {97.4817, -2.0000, -109.9677},
        {88.0128, -2.0000, -110.1289}        
    }
    NW = -- Sorthwest room
    {
        {9.7012, -2, 109.5587},
        {22.042, -2, 110.0485},
        {31.9411, -2, 112.7432},
        {30.6844, -2, 117.8574},
        {18.2341, -2, 116.4862},
        {7.4438, -2, 116.2394},
        {9.3145, -2.1785, 130.6581},
        {19.8528, -2.7298, 130.7574},
        {30.7859, -2.1785, 129.5448}      
    }
    NM = --Sorthmid room
    {
        {70.8789, -2, 109.542},
        {60.4267, -2, 110.0887},
        {48.2896, -2, 111.3439},
        {49.2171, -2, 117.5056},
        {61.5946, -2, 116.0528},
        {71.7462, -2, 116.0356},
        {69.0619, -2.1785, 130.0243},
        {58.1095, -2.7298, 129.9273},
        {50.1262, -2.1785, 130.2446}       
    }
    NE = --Sortheast room
    {
        {88.6123, -2, 110.1267},
        {99.8369, -2, 109.8693},
        {111.5963, -2, 111.03},
        {112.236, -2, 117.1377},
        {88.3052, -2, 118.776},
        {88.8908, -2.1785, 129.5286},
        {100.0305, -2.7298, 130.7616},
        {110.8072, -2.1785, 130.0085},
        {100.0483, -2, 116.4553}
    }
    -- TODO: Casting animation for summons. When he spawns them isn't retail accurate.
    if (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3) then       
        local X = mob:getXPos()
        local Y = mob:getYPos()
        local Z = mob:getZPos()

        for i = OP_Mariselle+1, OP_Mariselle+2 do
            local m = GetMobByID(i)
            if not m:isSpawned() then
                m:spawn()
                m:setPos(X + 1, Y, Z + 1) -- Set pupil x and z position +1 from Mariselle
                m:updateEnmity(target)
                return
            end
        end
    end

    for i = OP_Mariselle+1, OP_Mariselle+2 do
        local m = GetMobByID(i)
        if m:isSpawned() then
            m:updateEnmity(target)
        end
    end



    local teleTime = mob:getLocalVar("teleTime")
    if mob:getBattleTime() - teleTime > 30 and mob:getBattleTime() > 59 then    
        local profLocation = GetNPCByID(16892155):getLocalVar("profLocation") 
        if profLocation == 2 then
            randPos1 = NE[math.random((1), (9))]
            Teleport(mob, 2000)
            mob:setPos(randPos1, 0)
            mob:setSpawn(randPos1)
        elseif profLocation == 3 then
            randPos1 = NM[math.random((1), (9))]
            Teleport(mob, 2000)
            mob:setPos(randPos1, 0)  
            mob:setSpawn(randPos1)   
        elseif profLocation == 4 then
            randPos1 = NW[math.random((1), (9))]
            Teleport(mob, 2000)
            mob:setPos(randPos1, 0)
            mob:setSpawn(randPos1)
        elseif profLocation == 5 then 
            randPos1 = SE[math.random((1), (9))]
            Teleport(mob, 2000)
            mob:setPos(randPos1, 0)
            mob:setSpawn(randPos1)
        elseif profLocation == 6 then
            randPos1 = SM[math.random((1), (9))]
            Teleport(mob, 2000)
            mob:setPos(randPos1, 0)
            mob:setSpawn(randPos1)
        else
            randPos1 = SW[math.random((1), (9))]
            Teleport(mob, 2000)
            mob:setPos(randPos1, 0)
            mob:setSpawn(randPos1)
        end
        mob:setLocalVar("teleTime", mob:getBattleTime())
    end          

    if mob:checkDistance(mob:getTarget()) > 55 then     -- If players wander too far from professor and his teleport room he deaggros
        mob:disengage()
        mob:resetEnmity(target)
        for i = OP_Mariselle+1, OP_Mariselle+2 do
            local m = GetMobByID(i)
                m:disengage()
                m:resetEnmity(target) 
        end  
    end
end

function onMobDisengage(mob)
    mob:setLocalVar("teleTime", 0)
end    

function onMobDeath(mob, player, isKiller)
    local OP_Mariselle = mob:getID()

    for i = OP_Mariselle+1, OP_Mariselle+2 do
        local m = GetMobByID(i)
        if m:isSpawned() then
            DespawnMob(i)
        end
    end

    if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_SECRETS_OF_WORSHIP and player:getCharVar("PromathiaStatus") == 3 and  player:hasKeyItem(tpz.ki.RELIQUIARIUM_KEY)==false) then
        player:setCharVar("PromathiaStatus", 4)
    end
end

function onMobDespawn( mob )
    -- Set random variable for determining Old Prof. Mariselle's next spawn location
    local rand = math.random((2), (7))
    SetServerVariable("Old_Prof_Spawn_Location", rand)
end

function onMobRoam(mob)
    local profLocation = GetNPCByID(16892155):getLocalVar("profLocation")
    if profLocation == 2 then
        posPath = {mob:getXPos(), mob:getYPos(), mob:getZPos(), 102.669, -3.111, 127.279}
        tpz.path.patrol(mob, posPath)
    elseif profLocation == 3 then
        posPath = {mob:getXPos(), mob:getYPos(), mob:getZPos(), 62.668, -3.111, 127.288}
        tpz.path.patrol(mob, posPath)
    elseif profLocation == 4 then
        posPath = {mob:getXPos(), mob:getYPos(), mob:getZPos(), 22.669, -3.111, 127.279}
        tpz.path.patrol(mob, posPath)
    elseif profLocation == 5 then 
        posPath = {mob:getXPos(), mob:getYPos(), mob:getZPos(), 102.670, -3.111, -127.318}
        tpz.path.patrol(mob, posPath)
    elseif profLocation == 6 then
        posPath = {mob:getXPos(), mob:getYPos(), mob:getZPos(), 102.670, -3.111, -127.318}
        tpz.path.patrol(mob, posPath)
    else
        posPath = {mob:getXPos(), mob:getYPos(), mob:getZPos(), 22.669, -3.111, -127.318}
        tpz.path.patrol(mob, posPath)

    end
end

