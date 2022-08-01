-----------------------------------------
-- ID: 116
-- Item: windurstian_tree
-----------------------------------------
require("scripts/globals/common")
require("scripts/globals/quests")
require("scripts/globals/events/starlight_festivals")
-----------------------------------------

function onFurniturePlaced(player)
    player:setCharVar("WindurstianTree", 1)
    player:setCharVar("HolidayTree", 1)
end

function onFurnitureRemoved(player)
    player:setCharVar("WindurstianTree", 0)
    player:setCharVar("HolidayTree", 0)
end
