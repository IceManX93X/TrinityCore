UPDATE `creature_template` SET `lootid`=`entry` WHERE `entry` IN (32913,32914,32915,33391,33392,33393);

DELETE FROM `creature_loot_template` WHERE `entry` IN (32913,32914,32915,33391,33392,33393);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32913,40753,100,1,0,1,1),
(32914,40753,100,1,0,1,1),
(32915,40753,100,1,0,1,1),
(33391,45624,100,1,0,1,1),
(33392,45624,100,1,0,1,1),
(33393,45624,100,1,0,1,1);

UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry`=32915;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=33391;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry` IN (33271,33449);
