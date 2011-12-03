DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=45897;

DELETE FROM `creature_loot_template` WHERE `entry`=33955 AND `item`=45897;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33955,45897,-100,16,0,1,1);
