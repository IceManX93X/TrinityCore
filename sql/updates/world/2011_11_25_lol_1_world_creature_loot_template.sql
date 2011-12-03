UPDATE `creature_template` SET `lootid`=`entry`,`skinloot`=100013,`type_flags`=`type_flags`|32768 WHERE `entry`=29380;
DELETE FROM `creature_loot_template` WHERE `entry`=29380;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(29380,42780,33,0,0,1,1),   -- Relic of Ulduar
(29380,42203,10,0,0,1,1),   -- Dark Armor Plate (Quest Start Item)
(29380,42204,-33,0,0,1,1),  -- Dark Armor Sample (Quest Item)
(29380,45912,0.1,0,0,1,1),  -- Book of Glyph Mastery
(29380,1,10,0,0,-34106,1),  -- grey stuff
(29380,42931,20,0,0,1,1),   -- Toothless Gear
(29380,42930,80,0,0,1,1),   -- Crooked Cog 
(29380,2,2,0,0,-10011,1),   -- green stuff
(29380,3,0.1,0,0,-35074,1), -- epic stuff
(29380,4,1,0,0,-10009,1);   -- rare stuff