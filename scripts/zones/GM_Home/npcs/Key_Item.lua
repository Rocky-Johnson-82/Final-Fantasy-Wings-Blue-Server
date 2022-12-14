-----------------------------------
-- Area: GM Home
--  NPC: Key Item
-- Gives GMs necessary KIs
-- License: GPLv3
-----------------------------------

local ID = require("scripts/zones/GM_Home/IDs")

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(20);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
	if option == 1 then
		player:addKeyItem(8)
		player:messageSpecial( ID.text.KEYITEM_OBTAINED, 8 )
		player:addKeyItem(9)
		player:messageSpecial( ID.text.KEYITEM_OBTAINED, 9 )
	elseif option == 2 then
		player:addKeyItem(138)
		player:messageSpecial( ID.text.KEYITEM_OBTAINED, 138 )
	elseif option == 3 then
		addAllMaps(player)
	elseif option == 4 then
		player:addKeyItem(619)
		player:messageSpecial( ID.text.KEYITEM_OBTAINED, 619 )
	elseif option == 5 then
		player:delKeyItem(619)
		player:messageSpecial( ID.text.KEYITEM_OBTAINED + 1, 619 )
	elseif option == 6 then
		player:addKeyItem(880)
		player:messageSpecial( ID.text.KEYITEM_OBTAINED, 880 )
	end
end;

function addAllMaps(player)
    local keyIds =
    {
        383, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402,
        403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421,
        422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440,
        441, 442, 443, 444, 445, 446, 447, 1856, 1857, 1858, 1859, 1860, 1861, 1862, 1863, 1864, 1865,
        1866, 1867, 1868, 1869, 1870, 1871, 1872, 1873, 1874, 1875, 1876, 1877, 1878, 1879, 1880, 1881,
        1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893, 1894, 1895, 1896, 1897,
        1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913,
        1914, 1915, 1916, 1917, 1918, 2302, 2303, 2304, 2305, 2307, 2308, 2309
    }
    for _, v in ipairs( keyIds ) do
        player:addKeyItem( v )
		player:messageSpecial( ID.text.KEYITEM_OBTAINED, v )
    end
end
