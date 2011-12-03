SET @GUID := 400050;

DELETE FROM `gameobject` WHERE `id` IN (500005,500006);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GUID,500005,603,1,1,354.8771,-12.9024,409.80365,0,0,0,0,0,-604800,255,1),
(@GUID+1,500006,603,2,1,354.8771,-12.9024,409.80365,0,0,0,0,0,-604800,255,1);

-- Cleanup
DELETE FROM `reference_loot_template` WHERE `entry`=34116 AND `lootmode`>1;
DELETE FROM `reference_loot_template` WHERE `entry`=34157 AND `lootmode`>1;

DELETE FROM `gameobject_loot_template` WHERE `entry`=40001;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('40001','1','100','1','0','-34116','2'),
('40001','2','100','8','0','-34117','1'),
('40001','3','100','16','0','-34118','1'),
('40001','40753','100','1','0','1','1'),
('40001','45087','100','4','0','2','2'),
('40001','45624','100','2','0','1','1'),
('40001','45912','0.1','1','0','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34117;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34117','45088','0','8','1','1','1'),
('34117','45089','0','8','1','1','1'),
('34117','45090','0','8','1','1','1'),
('34117','45091','0','8','1','1','1'),
('34117','45092','0','8','1','1','1'),
('34117','45093','0','8','1','1','1'),
('34117','45094','0','8','1','1','1'),
('34117','45095','0','8','1','1','1'),
('34117','45096','0','8','1','1','1'),
('34117','45097','0','8','1','1','1'),
('34117','45098','0','8','1','1','1'),
('34117','45099','0','8','1','1','1'),
('34117','45100','0','8','1','1','1'),
('34117','45101','0','8','1','1','1'),
('34117','45102','0','8','1','1','1'),
('34117','45103','0','8','1','1','1'),
('34117','45104','0','8','1','1','1'),
('34117','45105','0','8','1','1','1'),
('34117','45624','100','8','0','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34118;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34118','45293','0','16','1','1','1'),
('34118','45295','0','16','1','1','1'),
('34118','45296','0','16','1','1','1'),
('34118','45297','0','16','1','1','1'),
('34118','45300','0','16','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry`=40002;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('40002','1','100','1','0','-34157','3'),
('40002','2','100','2','0','-34158','1'),
('40002','3','100','4','0','-34159','1'),
('40002','4','100','8','0','-34154','1'),
('40002','5','10','1','0','-34154','1'),
('40002','45038','8','1','0','1','1'),
('40002','45087','75','1','0','1','1'),
('40002','45132','0','16','1','1','1'),
('40002','45133','0','16','1','1','1'),
('40002','45134','0','16','1','1','1'),
('40002','45135','0','16','1','1','1'),
('40002','45136','0','16','1','1','1'),
('40002','45624','100','1','0','1','1'),
('40002','45912','0.1','1','0','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34158;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34158','45624','100','2','0','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34159;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34159','45087','100','4','0','2','2'),
('34159','45624','100','4','0','1','1');


-- update `creature_template` set `faction_A`=2101, `faction_H`=2101 where `entry`=33142;
UPDATE `creature_template` SET `faction_A`=1971, `faction_H`=1971 WHERE `entry`=33142;

UPDATE `gameobject_template` SET `ScriptName`='' WHERE `ScriptName`='go_ulduar_tower';
