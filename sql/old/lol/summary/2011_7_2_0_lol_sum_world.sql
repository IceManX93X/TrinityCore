-- Fix Gold Loot of Ulduar
SET @Gold_10_Trash_min  :=100000;
SET @Gold_10_Trash_max  :=@Gold_10_Trash_min*1.5;
SET @Gold_25_Trash_min  :=250000;
SET @Gold_25_Trash_max  :=@Gold_25_Trash_min*1.5;

UPDATE creature_template SET creature_template.mingold = @Gold_10_Trash_min, creature_template.maxgold = @Gold_10_Trash_max 
WHERE
entry IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
faction_A IN (14,16) AND
faction_H IN (14,16) AND
rank=1 AND
entry NOT IN (34234,33236,34164,34164,32872); 


UPDATE creature_template INNER JOIN creature_template creat ON creature_template.entry = creat.difficulty_entry_1
SET creature_template.mingold = @Gold_25_Trash_min, creature_template.maxgold = @Gold_25_Trash_max 
WHERE
creat.entry IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
creat.faction_A IN (14,16) AND
creat.faction_H IN (14,16) AND
creat.rank=1 AND
creat.entry NOT IN (34234,33236,34164,34164,32872);

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=33998;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82, `dmg_multiplier`=25 WHERE `entry`=34200;
UPDATE `creature_template` SET `dmg_multiplier`=20, `ScriptName`='mob_tempest_minion' WHERE `entry`=34015;
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=34016;
UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry` IN (33998,34200,33993,33994,34015,34016);

UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33993 AND `item`=47241;
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33994 AND `item`=47241;

DELETE FROM `spell_script_names` WHERE `spell_id`=65279;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65279, 'spell_emalon_lightning_nova');

UPDATE `creature_template` SET `npcflag`=1,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=900003;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (900003);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(900003,0,0,1,62,0,100,0,30000,1,0,0,62,571,0,0,0,0,0,8,0,0,0,5474,2841,419,6.26,'port to Vault of Archavon on gossip select'),
(900003,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close gossip');

-- Fix Engineering Loot for Flame Leviathan, XT-002, Mimiron
SET @ENTRY  :=100012;
UPDATE `creature_template` SET `type_flags`=`type_flags`|32768,`skinloot`=@ENTRY WHERE `entry` IN (33113,34003,33293,33885,33350);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (@ENTRY);
INSERT INTO `skinning_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,35627,63,1,0,2,10), -- Eternal Shadow
(@ENTRY,35624,37,1,0,4,10), -- Eternal Earth
(@ENTRY,36860,36,1,0,2,6),  -- Eternal Fire
(@ENTRY,35623,34,1,0,2,6),  -- Eternal Air
(@ENTRY,36916,43,1,0,4,13), -- Cobalt Bar
(@ENTRY,36913,42,1,0,4,10), -- Saronite Bar
(@ENTRY,39682,27,1,0,4,6),  -- Overcharged Capacitor
(@ENTRY,39681,25,1,0,8,10), -- Handful of Cobalt Bolts
(@ENTRY,39683,23,1,0,2,3),  -- Froststeel Tube
(@ENTRY,39690,23,1,0,16,19),-- Volatile Blasting Trigger
(@ENTRY,37663,14,1,0,1,2),  -- Titansteel Bar
(@ENTRY,49050,10,1,0,1,1),  -- Schematic: Jeeves
(@ENTRY,44499,3,1,0,1,1),   -- Salvaged Iron Golem Parts
(@ENTRY,44501,3,1,0,2,4),   -- Goblin-machined Piston
(@ENTRY,44500,3,1,0,1,1);   -- Elementium-plated Exhaust Pipe
UPDATE `creature` SET `position_x`=2406.222,`position_y`=62.616,`position_z`=434.342 WHERE `guid`=136608;
UPDATE `creature` SET `position_x`=2267.847,`position_y`=-113.317,`position_z`=430.503 WHERE `guid`=136606;
UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `guid`=136604;
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(136607,33430,603,3,1,19775,0,2322.52, 3.06219,427.529,0.583555,604800,5,0,195495,0,0,1,0,0,0); -- add missing Guardian Lasher

-- Fix Engineering Loot for Ulduar Trash
SET @ENTRY  :=100013;
UPDATE `creature_template` SET `type_flags`=`type_flags`|32768,`skinloot`=@ENTRY WHERE `entry` IN (34183,34214,34193,34220,34267,34268,34269,34270,34271,34272,34273,34274);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (@ENTRY);
INSERT INTO `skinning_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,41338,90,1,0,1,3),  -- Sprung Whirlygig
(@ENTRY,41337,80,1,0,1,3),  -- Whizzed-Out Gizmo
(@ENTRY,39681,25,1,0,2,4),  -- Handful of Cobalt Bolts
(@ENTRY,39690,25,1,0,1,3),  -- Volatile Blasting Trigger
(@ENTRY,39682,17,1,0,1,2),  -- Overcharged Capacitor
(@ENTRY,39683,17,1,0,1,2),  -- Froststeel Tube
(@ENTRY,49050,3,1,0,1,1);   -- Schematic: Jeeves
-- vezax - run speed
UPDATE `creature_template` SET `speed_run`=1.42857, `baseattacktime`=1500 WHERE `entry` IN (33271,33449);

-- herb and mineral respawn
UPDATE `gameobject` SET `spawntimesecs`=604800 WHERE `map`=603 AND `spawntimesecs`=3600;

-- thorim - lightning orb (temporary)
UPDATE `creature_template` SET `speed_run`=9.6, `dmg_multiplier`=200, `baseattacktime`=1000, `Health_mod`=100 WHERE `entry`=33138;

-- steelbreaker - electrical charge
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=61901;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61901,18,1,32867);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (61911,63495);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61911, 'spell_steelbreaker_static_disruption'),
(63495, 'spell_steelbreaker_static_disruption');

SET @GUID := 303000;
SET @GO_GUID := 400020;

-- torch toss target condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (46054,45732);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,45732,18,1,25535),
(13,46054,18,1,25535);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=45723;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(45723,43313,2, 'Torch Tossing - Target Indicator Visual');

UPDATE `creature_template` SET `ScriptName`='npc_torch_tossing_bunny' WHERE `entry`=25535;

UPDATE `quest_template` SET `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry` IN (11731,11922);
UPDATE `quest_template` SET `PrevQuestId`=11731, `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry`=11921;
UPDATE `quest_template` SET `PrevQuestId`=11922, `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry`=11926;
UPDATE `quest_template` SET `StartScript`=11731 WHERE `entry` IN (11731,11922);
UPDATE `quest_template` SET `StartScript`=11921 WHERE `entry` IN (11921,11926);

-- add torch toss aura on quest accept
DELETE FROM `quest_start_scripts` WHERE `id` IN (11731,11921);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(11731,0,14,45724,0,0,0,0,0,0),
(11731,1,15,45716,0,0,0,0,0,0),
(11921,0,14,45724,0,0,0,0,0,0),
(11921,1,15,46630,0,0,0,0,0,0);

-- more objects
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+6;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID,'187708','0','1','1','-8822.4','846.766','99.0875','2.10363','0','0','0.868324','0.495997','300','0','1'),
(@GO_GUID+1,'187708','0','1','1','-8817.63','851.846','98.9217','2.93222','0','0','0.994525','0.104495','300','0','1'),
(@GO_GUID+2,'187708','0','1','1','-8816.68','854.946','98.9073','2.92043','0','0','0.993892','0.110354','300','0','1'),
(@GO_GUID+3,'187708','0','1','1','-8816.66','858.591','98.9913','3.1427','0','0','1','-0.000551387','300','0','1'),
(@GO_GUID+4,'300068','0','1','1','-8834.32','857.823','99.8395','6.0196','0','0','0.131411','-0.991328','300','0','1'),
(@GO_GUID+5,'187708','1','1','1','1913.57','-4315.85','23.1799','4.90635','0','0','0.635316','-0.772252','300','0','1'),
(@GO_GUID+6,'300068','1','1','1','1914.7','-4336.27','22.1744','1.01471','0','0','0.485865','0.874034','300','0','1');

DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+6;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID),
(1,@GO_GUID+1),
(1,@GO_GUID+2),
(1,@GO_GUID+3),
(1,@GO_GUID+4),
(1,@GO_GUID+5),
(1,@GO_GUID+6);

-- more bunnies
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+11;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'25535','0','1','1','0','0','-8825.75','845.668','100.848','2.15624','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+1,'25535','0','1','1','0','0','-8822.48','846.841','100.883','2.2018','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+2,'25535','0','1','1','0','0','-8819.42','848.453','100.745','2.70837','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+3,'25535','0','1','1','0','0','-8817.56','851.801','100.717','2.7767','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+4,'25535','0','1','1','0','0','-8816.67','854.896','100.703','2.9275','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+5,'25535','0','1','1','0','0','-8816.57','858.57','100.787','3.28328','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+6,'25535','1','1','1','0','0','1925.17','-4321.24','23.4473','4.69918','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+7,'25535','1','1','1','0','0','1923.89','-4315.22','24.2852','4.59786','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+8,'25535','1','1','1','0','0','1920.46','-4319.27','23.6163','5.01334','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+9,'25535','1','1','1','0','0','1918.05','-4314.94','24.6482','5.04868','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+10,'25535','1','1','1','0','0','1913.58','-4315.8','24.9737','5.22382','30','0','0','4120','0','0','0','0','0','0'),
(@GUID+11,'25535','1','1','1','0','0','1915.54','-4320.43','23.6154','5.09658','30','0','0','4120','0','0','0','0','0','0');

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID AND @GUID+11;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@GUID),
(1,@GUID+1),
(1,@GUID+2),
(1,@GUID+3),
(1,@GUID+4),
(1,@GUID+5),
(1,@GUID+6),
(1,@GUID+7),
(1,@GUID+8),
(1,@GUID+9),
(1,@GUID+10),
(1,@GUID+11);

SET @GO_GUID := 400027;

UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry`=188128;
UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=188129;

-- move one loremaster to stormwind
UPDATE `creature` SET `position_x`=-8833.497, `position_y`=864.7697, `position_z`=98.9, `orientation`=5.89 WHERE `guid`=94857;

-- add flame of the exodar
DELETE FROM `gameobject` WHERE `id`=188128;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID,'188128','530','1','1','-3796.45','-11503.7','-134.772','0.350275','0','0','0.174244','0.984703','300','0','1');

DELETE FROM `game_event_gameobject` WHERE `guid`=@GO_GUID;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID);

-- create flame items
DELETE FROM `spell_scripts` WHERE `id` IN (29137,29135,29126,46671,29139,29136,29138,46672);
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(29137,2,0,15,29101,2,0,0,0,0,0), -- flame of stormwind
(29135,2,0,15,29102,2,0,0,0,0,0), -- flame of ironforge
(29126,2,0,15,29099,2,0,0,0,0,0), -- flame of darnassus
(46671,2,0,15,46690,2,0,0,0,0,0), -- flame of the exodar
(29139,2,0,15,29133,2,0,0,0,0,0), -- flame of the undercity
(29136,2,0,15,29130,2,0,0,0,0,0), -- flame of orgrimmar
(29138,2,0,15,29132,2,0,0,0,0,0), -- flame of thunder bluff
(46672,2,0,15,46689,2,0,0,0,0,0); -- flame of silvermoon

-- correct some relations
DELETE FROM `creature_questrelation` WHERE `id`=16817 AND `quest`=11935;
DELETE FROM `creature_questrelation` WHERE `id`=16818 AND `quest`=11933;
UPDATE `creature_questrelation` SET `id`=16818 WHERE `quest`=9339;
UPDATE `creature_involvedrelation` SET `id`=16818 WHERE `quest`=9339;
UPDATE `creature_questrelation` SET `id`=16817 WHERE `quest`=9365;
UPDATE `creature_involvedrelation` SET `id`=16817 WHERE `quest`=9365;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (45907,45671);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45907, 'spell_gen_torch_target_picker'),
(45671, 'spell_gen_juggle_torch_catch');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (45907,45671);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,45907,18,1,25515),
(13,45671,18,1,0),
(13,45671,18,1,25515);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=46747;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(46747,45907,0, 'Fling Torch - Torch Target Picker');

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=25515;

UPDATE `quest_template` SET `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry`=11923;
UPDATE `quest_template` SET `PrevQuestId`=11657 WHERE `entry`=11924;
UPDATE `quest_template` SET `PrevQuestId`=11923, `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry`=11925;

SET @GUID := 303012;
SET @GO_GUID := 400028;

DELETE FROM `creature` WHERE `id`=25515;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'25515','1','1','1','0','0','1921.68','-4326.24','21.7631','4.69113','30','0','0','42','0','0','0','0','0','0'),
(@GUID+1,'25515','0','1','1','0','0','-8820.57','863.37','98.9602','1.09525','30','0','0','42','0','0','0','0','0','0'),
(@GUID+2,'25515','0','1','1','0','0','-8819.07','881.422','98.6388','4.52744','30','0','0','42','0','0','0','0','0','0'),
(@GUID+3,'25515','0','1','1','0','0','-8812.03','885.719','98.5385','4.4489','30','0','0','42','0','0','0','0','0','0'),
(@GUID+4,'25515','0','1','1','0','0','-8814.08','873.969','98.8659','1.10232','30','0','0','42','0','0','0','0','0','0'),
(@GUID+5,'25515','0','1','1','0','0','-8814.7','864.967','99.0339','1.1141','30','0','0','42','0','0','0','0','0','0'),
(@GUID+6,'25515','0','1','1','0','0','-8821.88','870.852','98.7882','4.06092','30','0','0','42','0','0','0','0','0','0'),
(@GUID+7,'25515','0','1','1','0','0','-8807.15','878.687','98.8254','3.52921','30','0','0','42','0','0','0','0','0','0'),
(@GUID+8,'25515','0','1','1','0','0','-8823.06','855.943','99.045','1.4479','30','0','0','42','0','0','0','0','0','0'),
(@GUID+9,'25515','1','1','1','0','0','1932.16','-4325.71','20.1871','4.38482','30','0','0','42','0','0','0','0','0','0'),
(@GUID+10,'25515','1','1','1','0','0','1946.67','-4327.83','22.6344','3.60335','30','0','0','42','0','0','0','0','0','0'),
(@GUID+11,'25515','1','1','1','0','0','1943','-4339.9','21.5222','3.88609','30','0','0','42','0','0','0','0','0','0'),
(@GUID+12,'25515','1','1','1','0','0','1934.19','-4334.65','20.0495','3.48554','30','0','0','42','0','0','0','0','0','0'),
(@GUID+13,'25515','1','1','1','0','0','1930.03','-4346.83','19.7546','3.8429','30','0','0','42','0','0','0','0','0','0'),
(@GUID+14,'25515','1','1','1','0','0','1940.22','-4353.12','20.1355','4.05967','30','0','0','42','0','0','0','0','0','0'),
(@GUID+15,'25515','1','1','1','0','0','1932.25','-4361.06','20.9716','2.11973','30','0','0','42','0','0','0','0','0','0'),
(@GUID+16,'25515','0','1','1','0','0','1833.6','223.202','60.3987','2.25109','30','0','0','42','0','0','0','0','0','0'),
(@GUID+17,'25515','0','1','1','0','0','1831.21','233.347','60.134','1.62277','30','0','0','42','0','0','0','0','0','0'),
(@GUID+18,'25515','0','1','1','0','0','1832.31','244.952','59.9711','1.24735','30','0','0','42','0','0','0','0','0','0'),
(@GUID+19,'25515','0','1','1','0','0','1832.3','256.49','59.6549','2.65793','30','0','0','42','0','0','0','0','0','0'),
(@GUID+20,'25515','0','1','1','0','0','1822.36','261.071','59.9183','4.76437','30','0','0','42','0','0','0','0','0','0'),
(@GUID+21,'25515','0','1','1','0','0','1823.9','252.272','60.0337','4.96229','30','0','0','42','0','0','0','0','0','0'),
(@GUID+22,'25515','0','1','1','0','0','1814.4','247.51','60.5868','5.74847','30','0','0','42','0','0','0','0','0','0'),
(@GUID+23,'25515','0','1','1','0','0','1821.79','238.343','60.6741','4.77144','30','0','0','42','0','0','0','0','0','0'),
(@GUID+24,'25515','0','1','1','0','0','-4698.32','-1214.39','501.66','1.4847','30','0','0','42','0','0','0','0','0','0'),
(@GUID+25,'25515','0','1','1','0','0','-4701.21','-1204.98','501.66','2.14051','30','0','0','42','0','0','0','0','0','0'),
(@GUID+26,'25515','0','1','1','0','0','-4711.01','-1195.42','501.675','2.40362','30','0','0','42','0','0','0','0','0','0'),
(@GUID+27,'25515','0','1','1','0','0','-4724.79','-1194.03','501.696','5.31745','30','0','0','42','0','0','0','0','0','0'),
(@GUID+28,'25515','0','1','1','0','0','-4714.44','-1204.85','501.66','5.40384','30','0','0','42','0','0','0','0','0','0'),
(@GUID+29,'25515','0','1','1','0','0','-4727.47','-1205.35','501.696','4.54775','30','0','0','42','0','0','0','0','0','0'),
(@GUID+30,'25515','0','1','1','0','0','-4718.13','-1216.85','501.66','5.08575','30','0','0','42','0','0','0','0','0','0'),
(@GUID+31,'25515','0','1','1','0','0','-4692.04','-1200.08','501.66','3.52281','30','0','0','42','0','0','0','0','0','0');

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID AND @GUID+31;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@GUID),
(1,@GUID+1),
(1,@GUID+2),
(1,@GUID+3),
(1,@GUID+4),
(1,@GUID+5),
(1,@GUID+6),
(1,@GUID+7),
(1,@GUID+8),
(1,@GUID+9),
(1,@GUID+10),
(1,@GUID+11),
(1,@GUID+12),
(1,@GUID+13),
(1,@GUID+14),
(1,@GUID+15),
(1,@GUID+16),
(1,@GUID+17),
(1,@GUID+18),
(1,@GUID+19),
(1,@GUID+20),
(1,@GUID+21),
(1,@GUID+22),
(1,@GUID+23),
(1,@GUID+24),
(1,@GUID+25),
(1,@GUID+26),
(1,@GUID+27),
(1,@GUID+28),
(1,@GUID+29),
(1,@GUID+30),
(1,@GUID+31);

DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+1;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID,'300068','0','1','1','1823.19','221.194','60.9658','4.08421','0','0','0.890974','-0.454055','300','0','1'),
(@GO_GUID+1,'300068','0','1','1','-4702.18','-1221.19','502.491','5.2232','0','0','0.505528','-0.86281','300','0','1');

DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+1;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID),
(1,@GO_GUID+1);

SET @GUID := 303044;

-- unify money reward
UPDATE `quest_template` SET `RewOrReqMoney`=37000, `RewMoneyMaxLevel`=66300 WHERE `title`='Honor the Flame';

######################
## flame warden (A) ##
######################
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry`=11583 OR `entry` BETWEEN 11804 AND 11834;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=25883 OR `entry` BETWEEN 25887 AND 25917;

-- questrelations
DELETE FROM `creature_questrelation` WHERE `quest`=11583 OR `quest` BETWEEN 11804 AND 11834;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
## outland
(25889,11807), -- blades edge
(25903,11821), -- nagrand
(25905,11823), -- shadowmoon
(25912,11829), -- nagrand
(25900,11818), -- hellfire
(25913,11830), -- netherstorm
(25907,11825), -- terokkar
## kalimdor
(25883,11805), -- ashenvale
(25891,11809), -- bloodmyst
(25894,11812), -- desolace
(25899,11817), -- feralas
(25906,11824), -- teldrassil
(25888,11806), -- azuremyst
(25893,11811), -- darkshore
(25897,11815), -- dustwallow marsh
(25914,11831), -- silithus
(25916,11833), -- tanaris
(25917,11834), -- winterspring
## eastern kingdoms
(25887,11804), -- arathi highlands
(25892,11810), -- burning steppes
(25896,11814), -- duskwood
(25901,11819), -- hillsbrad foothills
(25904,11822), -- redridge mountains
(25908,11826), -- hinterlands
(25909,11827), -- western plaguelands
(25890,11808), -- blasted lands
(25895,11813), -- dun morogh
(25898,11816), -- elwynn forest
(25902,11820), -- loch modan
(25915,11832), -- stranglethorn vale
(25911,11828), -- wetlands
(25910,11583); -- westfall

-- involvedrelations
DELETE FROM `creature_involvedrelation` WHERE `quest`=11583 OR `quest` BETWEEN 11804 AND 11834;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
## outland
(25889,11807), -- blades edge
(25903,11821), -- nagrand
(25905,11823), -- shadowmoon
(25912,11829), -- nagrand
(25900,11818), -- hellfire
(25913,11830), -- netherstorm
(25907,11825), -- terokkar
## kalimdor
(25883,11805), -- ashenvale
(25891,11809), -- bloodmyst
(25894,11812), -- desolace
(25899,11817), -- feralas
(25906,11824), -- teldrassil
(25888,11806), -- azuremyst
(25893,11811), -- darkshore
(25897,11815), -- dustwallow marsh
(25914,11831), -- silithus
(25916,11833), -- tanaris
(25917,11834), -- winterspring
## eastern kingdoms
(25887,11804), -- arathi highlands
(25892,11810), -- burning steppes
(25896,11814), -- duskwood
(25901,11819), -- hillsbrad foothills
(25904,11822), -- redridge mountains
(25908,11826), -- hinterlands
(25909,11827), -- western plaguelands
(25890,11808), -- blasted lands
(25895,11813), -- dun morogh
(25898,11816), -- elwynn forest
(25902,11820), -- loch modan
(25915,11832), -- stranglethorn vale
(25911,11828), -- wetlands
(25910,11583); -- westfall

-- spawn missing warden
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+10;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'25888','530','1','1','0','0','-4204.55','-12333.2','2.34492','2.74105','30','0','0','1524','0','0','0','0','0','0'),
(@GUID+1,'25889','530','1','1','0','0','2024.83','6607.65','137.407','0.480902','30','0','0','1524','0','0','0','0','0','0'),
(@GUID+2,'25891','530','1','1','0','0','-2175.01','-11885','32.3573','2.36091','30','0','0','1524','0','0','0','0','0','0'),
(@GUID+3,'25892','0','1','1','0','0','-8231.91','-2611.69','133.167','1.84443','30','0','0','1524','0','0','0','0','0','0'),
(@GUID+4,'25899','1','1','1','0','0','-4396.98','3459.2','10.8561','5.49229','30','0','0','1524','0','0','0','0','0','0'),
(@GUID+5,'25903','530','1','1','0','0','-2491.53','7538.32','-1.03453','2.51409','30','0','0','3052','0','0','0','0','0','0'),
(@GUID+6,'25905','530','1','1','0','0','-3926.57','2037.81','95.1806','6.08835','30','0','0','42','0','0','0','0','0','0'),
(@GUID+7,'25907','530','1','1','0','0','-2983.44','4165.95','7.86408','3.07031','30','0','0','42','0','0','0','0','0','0'),
(@GUID+8,'25909','0','1','1','0','0','1004.72','-1447.66','61.8342','5.14376','30','0','0','42','0','0','0','0','0','0'),
(@GUID+9,'25912','530','1','1','0','0','244.981','5998.43','23.8744','2.19129','30','0','0','42','0','0','0','0','0','0'),
(@GUID+10,'25913','530','1','1','0','0','3120.33','3709.94','144.328','5.38094','30','0','0','42','0','0','0','0','0','0');

-- warden event relation
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID AND @GUID+10;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@GUID),
(1,@GUID+1),
(1,@GUID+2),
(1,@GUID+3),
(1,@GUID+4),
(1,@GUID+5),
(1,@GUID+6),
(1,@GUID+7),
(1,@GUID+8),
(1,@GUID+9),
(1,@GUID+10);

######################
## flame keeper (H) ##
######################
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry`=11584 OR `entry` BETWEEN 11835 AND 11863;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=25884 OR `entry` BETWEEN 25918 AND 25923 OR `entry` BETWEEN 25925 AND 25947;

-- questrelations
DELETE FROM `creature_questrelation` WHERE `quest`=11584 OR `quest` BETWEEN 11835 AND 11863;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
## outland
(25926,11843), -- blades edge
(25937,11854), -- nagrand
(25938,11855), -- shadowmoon
(25947,11863), -- nagrand
(25934,11851), -- hellfire
(25918,11835), -- netherstorm
(25942,11858), -- terokkar
## kalimdor
(25884,11841), -- ashenvale
(25929,11846), -- durotar
(25928,11845), -- desolace
(25932,11849), -- feralas
(25943,11859), -- the barrens
(25940,11856), -- stonetalon mountains
(25936,11852), -- mulgore
(25930,11847), -- dustwallow marsh
(25919,11836), -- silithus
(25921,11838), -- tanaris
(25922,11839), -- winterspring
(25945,11861), -- thousand needles
## eastern kingdoms
(25925,11842), -- badlands
(25931,11848), -- eversong woods
(25935,11853), -- hillsbrad foothills
(25920,11837), -- stranglethorn vale
(25944,11860), -- hinterlands
(25923,11840), -- arathi highlands
(25927,11844), -- burning steppes
(25933,11850), -- ghostlands
(25939,11584), -- silverpine forest
(25941,11857), -- swamp of sorrows
(25946,11862); -- tirisfal glades

-- involvedrelations
DELETE FROM `creature_involvedrelation` WHERE `quest`=11584 OR `quest` BETWEEN 11835 AND 11863;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
## outland
(25926,11843), -- blades edge
(25937,11854), -- nagrand
(25938,11855), -- shadowmoon
(25947,11863), -- nagrand
(25934,11851), -- hellfire
(25918,11835), -- netherstorm
(25942,11858), -- terokkar
## kalimdor
(25884,11841), -- ashenvale
(25929,11846), -- durotar
(25928,11845), -- desolace
(25932,11849), -- feralas
(25943,11859), -- the barrens
(25940,11856), -- stonetalon mountains
(25936,11852), -- mulgore
(25930,11847), -- dustwallow marsh
(25919,11836), -- silithus
(25921,11838), -- tanaris
(25922,11839), -- winterspring
(25945,11861), -- thousand needles
## eastern kingdoms
(25925,11842), -- badlands
(25931,11848), -- eversong woods
(25935,11853), -- hillsbrad foothills
(25920,11837), -- stranglethorn vale
(25944,11860), -- hinterlands
(25923,11840), -- arathi highlands
(25927,11844), -- burning steppes
(25933,11850), -- ghostlands
(25939,11584), -- silverpine forest
(25941,11857), -- swamp of sorrows
(25946,11862); -- tirisfal glades

-- spawn missing keeper
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+11 AND @GUID+14;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID+11,'25918','530','1','1','0','0','2939.25','3707.13','143.35','2.41213','30','0','0','42','0','0','0','0','0','0'),
(@GUID+12,'25926','530','1','1','0','0','2299.3','6140.85','134.987','2.15454','30','0','0','42','0','0','0','0','0','0'),
(@GUID+13,'25936','1','1','1','0','0','-2325.35','-612.436','-8.94079','0.669778','30','0','0','42','0','0','0','0','0','0'),
(@GUID+14,'25938','530','1','1','0','0','-3079.78','2433.31','63.9935','0.138969','30','0','0','42','0','0','0','0','0','0');

-- keeper event relation
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID+11 AND @GUID+14;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@GUID+11),
(1,@GUID+12),
(1,@GUID+13),
(1,@GUID+14);

UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60, `unit_flags`=33587968, `InhabitType`=7, `flags_extra`=130, `ScriptName`='npc_generic_oracle_treasure_trigger' WHERE `entry`=28088;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=19656;

UPDATE `creature` SET `id`=28088 WHERE `id`=19656 AND `map`=571;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51368;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,51368,18,1,26693);

-- Fix Rubble Stalker Kologarn Aggroing after combat
UPDATE `creature_template` SET `unit_Flags` = `unit_flags`|512 WHERE `entry` IN (
33809, -- Rubble Stalker Kologarn
33942, -- Rubble Stalker Kologarn (heroic)
33571, -- Ulduar Gauntlet Generator
34159  -- Ulduar Gauntlet Generator (small radius)
);