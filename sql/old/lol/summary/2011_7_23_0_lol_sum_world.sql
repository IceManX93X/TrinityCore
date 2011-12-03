-- Creatures
UPDATE `creature` SET `position_x`=754.26 WHERE `guid`=132302;
UPDATE `creature` SET `position_x`=754.29 WHERE `guid`=132303;
UPDATE `creature` SET `position_x`=652.42 WHERE `guid`=132309;
UPDATE `creature` SET `position_x`=847.67 WHERE `guid`=132310;
UPDATE `creature` SET `position_x`=647.68 WHERE `guid`=132311;
UPDATE `creature` SET `position_x`=843.18 WHERE `guid`=132312;
UPDATE `creature` SET `position_x`=808.53 WHERE `guid`=132313;
UPDATE `creature` SET `position_x`=754.54 WHERE `guid`=132314;
-- GameObjects
UPDATE `gameobject` SET `position_x`=764.56 WHERE `guid`=151793;
UPDATE `gameobject` SET `position_x`=764.56 WHERE `guid`=151792;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=67449;
UPDATE `gameobject` SET `position_x`=724.68 WHERE `guid`=67450;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=400001;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=400000;
-- Areatrigger
UPDATE `areatrigger_teleport` SET `target_position_x`=727.94 WHERE `id`=5290;
-- Disable LOS
DELETE FROM `disables` WHERE `sourceType`=6 AND `entry`=616;
INSERT INTO `disables` VALUES (6, 616, 4, 0, 0, "Disable Eye of Eternity LOS");

UPDATE creature_template SET VehicleId = 160 WHERE entry = 30236;

DELETE FROM npc_spellclick_spells WHERE npc_entry = 30236;
INSERT INTO  npc_spellclick_spells VALUES
(30236,57573,13086,1,13086,1,0,0,0);

DELETE FROM spell_script_names WHERE spell_id IN (57385,57412);
INSERT INTO spell_script_names VALUES
(57385,'spell_argent_cannon'),
(57412,'spell_argent_cannon');

UPDATE creature_template SET  flags_extra = flags_extra | 64 | 262144 | 268435456, faction_A = 2068, faction_H = 2068 WHERE entry IN (30593,30575);
UPDATE creature_template SET faction_A = 2131, faction_H = 2131 WHERE entry IN (30672);

SET @start_guid = 730000;
DELETE FROM gameobject WHERE id IN (192657,192658,192769,192770,192771,192772,192767,192768);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@start_guid,'192658','571','1','64','6162.76','60.8036','397.167','0.0228746','0','0','0.011437','0.999935','300','0','1'),
(@start_guid+1,'192771','571','1','64','6256.14','93.0182','404.473','5.5827','0','0','0.343125','-0.93929','300','0','1'),
(@start_guid+2,'192772','571','1','64','6256.14','93.0182','407.571','5.5827','0','0','0.343125','-0.93929','300','0','1'),
(@start_guid+3,'192767','571','1','64','6297.1','53.4663','404.575','5.64161','0','0','0.315316','-0.948987','300','0','1'),
(@start_guid+4,'192769','571','1','64','6219.22','60.0652','394.066','0.0668562','0','0','0.0334219','0.999441','300','0','1'),
(@start_guid+5,'192768','571','1','64','6297.1','53.4663','407.674','5.64161','0','0','0.315316','-0.948987','300','0','1'),
(@start_guid+6,'192770','571','1','64','6219.3','60.0708','397.164','0.0668562','0','0','0.0334219','0.999441','300','0','1'),
(@start_guid+7,'192657','571','1','64','6162.79','60.8041','394.068','0.00323963','0','0','0.00161982','0.999999','300','0','1');

DELETE FROM  creature WHERE id IN (30593,30575,30672,30236);
SET @start_guid = 611000;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@start_guid+54,'30236','571','1','64','0','0','6219.07','60.6374','399.529','1.72168','300','0','0','126000','1000','0','0','0','0'),
(@start_guid,'30236','571','1','64','0','0','6162.64','61.13','399.532','1.62351','30','0','0','126000','1000','0','0','0','0'),
(@start_guid+1,'30236','571','1','64','0','0','6256.27','93.32','409.937','0.811405','30','0','0','126000','1000','0','0','0','0'),
(@start_guid+2,'30236','571','1','64','0','0','6297.3','53.7969','410.039','0.862456','30','0','0','126000','1000','0','0','0','0'),
(@start_guid+3,'30575','571','1','64','0','0','6150.44','93.7565','389.714','5.20943','30','0','0','1050','0','0','0','0','0'),
(@start_guid+4,'30575','571','1','64','0','0','6221.62','106.62','397.54','4.67929','30','0','0','1050','0','0','0','0','0'),
(@start_guid+5,'30575','571','1','64','0','0','6276.62','125.711','403.924','4.30624','30','0','0','1050','0','0','0','0','0'),
(@start_guid+6,'30575','571','1','64','0','0','6328.05','86.6171','406.413','3.97087','30','0','0','1050','0','0','0','0','0'),
(@start_guid+7,'30593','571','1','64','0','0','6151.11','85.9223','371.663','5.30073','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+8,'30593','571','1','64','0','0','6163.06','91.1032','372.088','5.07925','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+9,'30593','571','1','64','0','0','6154.13','101.185','373.479','5.07925','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+10,'30593','571','1','64','0','0','6167.36','106.27','375.583','5.07925','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+11,'30593','571','1','64','0','0','6187.13','102.049','378.32','4.79887','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+12,'30593','571','1','64','0','0','6195.87','102.045','378.472','4.79887','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+13,'30593','571','1','64','0','0','6191.34','113.157','377.881','4.79887','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+14,'30593','571','1','64','0','0','6212.48','97.4891','376.442','4.44308','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+15,'30593','571','1','64','0','0','6221.58','94.9785','377.831','4.44308','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+16,'30593','571','1','64','0','0','6220.89','106.64','378.239','4.44308','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+17,'30593','571','1','64','0','0','6270.23','120.232','385.116','4.0551','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+18,'30593','571','1','64','0','0','6281.1','111.837','387.828','4.0551','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+19,'30593','571','1','64','0','0','6283.71','125.334','387.258','4.0551','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+20,'30593','571','1','64','0','0','6292.9','103.739','390.832','4.0551','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+21,'30593','571','1','64','0','0','6304.65','94.6678','390.971','4.0551','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+22,'30593','571','1','64','0','0','6310.33','105.701','390.763','4.0551','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+23,'30593','571','1','64','0','0','6304.3','109.923','391.126','4.0551','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+24,'30593','571','1','64','0','0','6315.02','85.1544','389.752','3.49432','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+25,'30593','571','1','64','0','0','6322.17','69.6267','388.085','3.49432','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+26,'30593','571','1','64','0','0','6332.51','78.2585','390.296','3.49432','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+27,'30593','571','1','64','0','0','6329.13','87.442','390.78','3.49432','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+28,'30593','571','1','64','0','0','6254.49','122.589','382.625','4.77531','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+29,'30593','571','1','64','0','0','6239.81','121.664','381.542','4.77531','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+30,'30593','571','1','64','0','0','6247.22','137.374','381.697','4.77531','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+31,'30593','571','1','64','0','0','6266.85','138.198','384.19','4.19333','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+32,'30593','571','1','64','0','0','6222','120.261','379.934','4.66831','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+33,'30593','571','1','64','0','0','6205.85','122.933','378.206','4.56227','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+34,'30593','571','1','64','0','0','6139.18','78.8258','370.863','5.76393','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+35,'30593','571','1','64','0','0','6131.04','63.7813','369.324','6.04275','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+36,'30593','571','1','64','0','0','6120.75','75.3424','370.355','6.16056','30','0','0','11379','3725','0','0','0','0'),
(@start_guid+37,'30593','571','1','64','0','0','6130.28','89.7016','371.852','5.80948','30','0','0','11770','3809','0','0','0','0'),
(@start_guid+38,'30672','571','1','64','0','1009','6291.63','93.839','390.65','1.04212','30','0','0','22524','11679','0','0','0','0'),
(@start_guid+39,'30672','571','1','64','0','1009','6297.7','89.2795','390.559','0.897608','30','0','0','23310','11982','0','0','0','0'),
(@start_guid+40,'30672','571','1','64','0','1009','6276.01','106.92','386.415','1.39477','30','0','0','21051','11175','0','0','0','0'),
(@start_guid+41,'30672','571','1','64','0','1009','6264.25','112.06','383.644','1.39477','30','0','0','23310','11982','0','0','0','0'),
(@start_guid+42,'30672','571','1','64','0','1009','6253.09','112.891','381.978','1.42068','30','0','0','22524','11679','0','0','0','0'),
(@start_guid+43,'30672','571','1','64','0','1009','6242.17','113.166','380.783','1.70578','30','0','0','21775','11427','0','0','0','0'),
(@start_guid+44,'30672','571','1','64','0','1009','6228.82','112.778','379.714','1.64452','30','0','0','22524','11679','0','0','0','0'),
(@start_guid+45,'30672','571','1','64','0','1009','6215.1','102.471','377.081','2.20058','30','0','0','21775','11427','0','0','0','0'),
(@start_guid+46,'30672','571','1','64','0','1009','6198.43','93.4409','379.632','1.9202','30','0','0','21051','11175','0','0','0','0'),
(@start_guid+47,'30672','571','1','64','0','1009','6188.12','88.0056','379.178','1.7105','30','0','0','21051','11175','0','0','0','0'),
(@start_guid+48,'30672','571','1','64','0','1009','6171.88','94.8032','374.348','2.16053','30','0','0','23310','11982','0','0','0','0'),
(@start_guid+49,'30672','571','1','64','0','1009','6166.04','88.3361','371.857','2.16053','30','0','0','21775','11427','0','0','0','0'),
(@start_guid+50,'30672','571','1','64','0','1009','6158.94','84.0573','371.021','1.83773','30','0','0','21051','11175','0','0','0','0'),
(@start_guid+51,'30672','571','1','64','0','1009','6149.49','79.5936','370.531','2.15346','30','0','0','21051','11175','0','0','0','0'),
(@start_guid+52,'30672','571','1','64','0','1009','6140.25','73.504','369.86','2.15346','30','0','0','21775','11427','0','0','0','0'),
(@start_guid+53,'30672','571','1','64','0','1009','6136.32','62.6195','369.184','2.87681','30','0','0','23310','11982','0','0','0','0');

UPDATE `creature` SET spawndist = 30 WHERE `id` IN (30593,30575);
UPDATE creature_template SET MovementType = 1 WHERE entry IN (30593,30575);
UPDATE creature_template SET InhabitType = 4 WHERE entry = 30575;
UPDATE `creature_template` SET `minlevel`=80  , `maxlevel`=80  , `exp`=2 WHERE `entry` = 30575;

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` BETWEEN 10082 AND 10087;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` BETWEEN 10082 AND 10087 AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10082,11,0,0,'achievement_i_choose_you'),
(10083,11,0,0,'achievement_i_choose_you'),
(10084,11,0,0,'achievement_i_choose_you'),
(10085,11,0,0,'achievement_i_choose_you'),
(10086,11,0,0,'achievement_i_choose_you'),
(10087,11,0,0,'achievement_i_choose_you'),
(10082,12,0,0,''),
(10083,12,0,0,''),
(10084,12,0,0,''),
(10085,12,1,0,''),
(10086,12,1,0,''),
(10087,12,1,0,'');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10088,10418,10419,10089,10420,10421);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10088,10418,10419,10089,10420,10421) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10088,11,0,0,'achievement_but_i_am_on_your_side'),
(10418,11,0,0,'achievement_but_i_am_on_your_side'),
(10419,11,0,0,'achievement_but_i_am_on_your_side'),
(10088,12,0,0,''),
(10418,12,0,0,''),
(10419,12,0,0,''),
(10089,11,0,0,'achievement_but_i_am_on_your_side'),
(10420,11,0,0,'achievement_but_i_am_on_your_side'),
(10421,11,0,0,'achievement_but_i_am_on_your_side'),
(10089,12,1,0,''),
(10420,12,1,0,''),
(10421,12,1,0,'');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7573,7574) AND `type`=12;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7573,12,0,0,''),
(7574,12,1,0,'');

UPDATE `spell_script_names` SET `ScriptName`='spell_xt002_searing_light_targeting' WHERE `spell_id` IN (63018,65121);
UPDATE `spell_script_names` SET `ScriptName`='spell_xt002_gravity_bomb_targeting' WHERE `spell_id` IN (63024,64234);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (28374,54426);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,28374,18,1,0),
(13,28374,18,1,16360),
(13,54426,18,1,0),
(13,54426,18,1,16360);

DELETE FROM `spell_script_names` WHERE `spell_id`=61900;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61900, 'spell_steelbreaker_electrical_charge');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_meltdown';

UPDATE `creature_template` SET `ScriptName`='npc_generic_oracle_treasure_seeker' WHERE `entry`=28122;

-- reference_loot entries of Epic Items
SET @R10        :=90003;    -- use old reference entry (10)
SET @R25        :=90004;    -- use old reference entry (25)
-- reference_loot entries of some Item Pools
SET @Green1     :=26016;    -- Green Items 1
SET @Green2     :=35080;    -- Green Items 2
SET @DesignMisc1:=10009;    -- Designs + Blue Items + Misc 1    
SET @DesignMisc2:=34110;    -- Designs + Blue Items + Misc 2
SET @DesignMisc3:=35067;    -- Designs + Blue Items + Misc 3
SET @DesignMisc4:=35081;    -- Designs + Blue Items + Misc 4
SET @GreyMisc   :=35063;    -- Grey Items + Misc
SET @Consumable :=35064;    -- Consumables (Eat-Drink/Mana-Heal Pot)
-- single Items
SET @Frost      :=33470;    -- Frostweave Cloth (only Humanoids)
SET @Necklace   :=43297;    -- Damaged Necklace
SET @Book       :=45912;    -- Book of Glyph Mastery
-- Dropchances in %
SET @Epic       :=  3;
SET @Rare       :=  3;
SET @Green      :=  8;
SET @Grey       :=100;
SET @Consume    := 25;
SET @Frostweave := 80;
SET @NeckBook   :=0.1;
-- Gold Loot
SET @Min_Gold_10:=100000;
SET @Max_Gold_10:=@Min_Gold_10*1.5;
SET @Min_Gold_25:=250000;
SET @Max_Gold_25:=@Min_Gold_25*1.5;
-- Reference Ulduar (10)
DELETE FROM `reference_loot_template` WHERE `entry`=@R10;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@R10,46341,0,1,1,1,1), -- Drape of the Spellweaver
(@R10,46351,0,1,1,1,1), -- Bloodcrush Cudgel
(@R10,46347,0,1,1,1,1), -- Cloak of the Dormant Blaze
(@R10,46344,0,1,1,1,1), -- Iceshear Mantle
(@R10,46346,0,1,1,1,1), -- Boots of Unsettled Prey
(@R10,46345,0,1,1,1,1), -- Bracers of Righteous Reformation
(@R10,46340,0,1,1,1,1), -- Adamant Handguards
(@R10,46343,0,1,1,1,1), -- Fervor of the Protectorate
(@R10,46339,0,1,1,1,1), -- Mimiron's Repeater
(@R10,46350,0,1,1,1,1), -- Pillar of Fortitude
(@R10,46342,0,1,1,1,1); -- Golemheart Longbow
-- Reference Ulduar (25)
DELETE FROM `reference_loot_template` WHERE `entry`=@R25;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@R25,45541,0,1,1,1,1), -- Shroud of Alteration
(@R25,45549,0,1,1,1,1), -- Grips of Chaos
(@R25,45547,0,1,1,1,1), -- Relic Hunter's Cord
(@R25,45548,0,1,1,1,1), -- Belt of the Sleeper
(@R25,45543,0,1,1,1,1), -- Shoulders of Misfortune
(@R25,45544,0,1,1,1,1), -- Leggings of the Tortured Earth
(@R25,45542,0,1,1,1,1), -- Greaves of the Stonewarder
(@R25,45540,0,1,1,1,1), -- Bladebearer's Signet
(@R25,45539,0,1,1,1,1), -- Pendant of Focused Energies
(@R25,45538,0,1,1,1,1), -- Titanstone Pendant
(@R25,46138,0,1,1,1,1), -- Idol of the Flourishing Life
(@R25,45605,0,1,1,1,1); -- Daschal's Bite
-- Ulduar Trash (10)
UPDATE `creature_template` SET `lootid`=`entry`,`mingold`=@Min_Gold_10,`maxgold`=@Max_Gold_10 WHERE `entry` IN (33354,33355,33430,33431,33525,33526,33527,33528,33699,33722,33754,33755,33772,33818,33819,33820,33822,33823,33824,34069,34085,34086,34133,34134,34135,34137,34183,34184,34190,34193,34196,34197,34198,34199,34267,34269,34271,34273);
DELETE FROM `creature_loot_template` WHERE `entry` IN (33354,33355,33430,33431,33525,33526,33527,33528,33699,33722,33754,33755,33772,33818,33819,33820,33822,33823,33824,34069,34085,34086,34133,34134,34135,34137,34183,34184,34190,34193,34196,34197,34198,34199,34267,34269,34271,34273);
-- Corrupted Servitor (10)
SET @ENTRY  :=33354;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Misguided Nymph (10)
SET @ENTRY  :=33355;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian Lasher (10)
SET @ENTRY  :=33430;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forest Swarmer (10) 
SET @ENTRY  :=33431;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Mangrove Ent (10) 
SET @ENTRY  :=33525;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Ironroot Lasher (10)
SET @ENTRY  :=33526;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Nature's Blade (10)
SET @ENTRY  :=33527;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian of Life (10)
SET @ENTRY  :=33528;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper (10)
SET @ENTRY  :=33699;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper(10)
SET @ENTRY  :=33722;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Dark Rune Thunderer (10)
SET @ENTRY  :=33754;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Dark Rune Ravager (10)
SET @ENTRY  :=33755;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Faceless Horror (10)
SET @ENTRY  :=33772;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Twilight Adherent (10)
SET @ENTRY  :=33818;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Frost Mage (10)
SET @ENTRY  :=33819;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Pyromancer (10)
SET @ENTRY  :=33820;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Guardian (10)
SET @ENTRY  :=33822;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Slayer (10)
SET @ENTRY  :=33823;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Shadowblade (10)
SET @ENTRY  :=33824;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Molten Colossus (10)
SET @ENTRY  :=34069;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forge Construct (10)
SET @ENTRY  :=34085;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Magma Rager (10)
SET @ENTRY  :=34086;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Champion of Hodir (10)
SET @ENTRY  :=34133;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Winter Revenant (10)
SET @ENTRY  :=34134;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Rumbler (10)
SET @ENTRY  :=34135;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Jormungar (10)
SET @ENTRY  :=34137;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Arachnopod Destroyer (10)
SET @ENTRY  :=34183;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Mechanic (10)
SET @ENTRY  :=34184;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Hardened Iron Golem (10)
SET @ENTRY  :=34190;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Sapper (10)
SET @ENTRY  :=34193;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Rune Etched Sentry (10)
SET @ENTRY  :=34196;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Chamber Overseer (10)
SET @ENTRY  :=34197;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Iron Mender (10)
SET @ENTRY  :=34198;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Lightning Charged Iron Dwarf (10)
SET @ENTRY  :=34199;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Parts Recovery Technician (10)
SET @ENTRY  :=34267;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- XR-949 Salvagebot (10)
SET @ENTRY  :=34269;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XD-175 Compactobot (10) 
SET @ENTRY  :=34271;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XB-488 Disposalbot (10)
SET @ENTRY  :=34273;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Ulduar Trash (25)
UPDATE `creature_template` SET `lootid`=`entry`,`mingold`=@Min_Gold_25,`maxgold`=@Max_Gold_25 WHERE `entry` IN (33729,33737,33732,33731,33735,33734,33741,33733,33700,33723,33757,33758,33773,33827,33829,33830,33828,33832,33831,34185,34186,34201,34139,34141,34142,34140,34214,34219,34229,34220,34245,34226,34236,34237,34268,34270,34272,34274);
DELETE FROM `creature_loot_template` WHERE `entry` IN (33729,33737,33732,33731,33735,33734,33741,33733,33700,33723,33757,33758,33773,33827,33829,33830,33828,33832,33831,34185,34186,34201,34139,34141,34142,34140,34214,34219,34229,34220,34245,34226,34236,34237,34268,34270,34272,34274);
-- Corrupted Servitor (25)
SET @ENTRY  :=33729;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Misguided Nymph (25)
SET @ENTRY  :=33737;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian Lasher (25)
SET @ENTRY  :=33732;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forest Swarmer (25)
SET @ENTRY  :=33731;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Mangrove Ent (25)
SET @ENTRY  :=33735;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Ironroot Lasher (25)
SET @ENTRY  :=33734;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Nature's Blade (25)
SET @ENTRY  :=33741;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian of Life (25)
SET @ENTRY  :=33733;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper (25)
SET @ENTRY  :=33700;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper (25)
SET @ENTRY  :=33723;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Dark Rune Thunderer (25)
SET @ENTRY  :=33757;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Dark Rune Ravager (25)
SET @ENTRY  :=33758;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Faceless Horror (25)
SET @ENTRY  :=33773;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Twilight Adherent (25)
SET @ENTRY  :=33827;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Frost Mage (25)
SET @ENTRY  :=33829;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Pyromancer (25)
SET @ENTRY  :=33830;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Guardian (25)
SET @ENTRY  :=33828;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Slayer (25)
SET @ENTRY  :=33832;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Shadowblade (25)
SET @ENTRY  :=33831;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Molten Colossus (25)
SET @ENTRY  :=34185;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forge Construct (25)
SET @ENTRY  :=34186;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Magma Rager (25)
SET @ENTRY  :=34201;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Champion of Hodir (25)
SET @ENTRY  :=34139;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Winter Revenant (25)
SET @ENTRY  :=34141;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Rumbler (25)
SET @ENTRY  :=34142;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Jormungar (25)
SET @ENTRY  :=34140;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Arachnopod Destroyer (25)
SET @ENTRY  :=34214;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Mechanic (25)
SET @ENTRY  :=34219;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Hardened Iron Golem (25)
SET @ENTRY  :=34229;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Sapper (25)
SET @ENTRY  :=34220;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Rune Etched Sentry (25)
SET @ENTRY  :=34245;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Chamber Overseer (25)
SET @ENTRY  :=34226;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Iron Mender (25)
SET @ENTRY  :=34236;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Lightning Charged Iron Dwarf (25)
SET @ENTRY  :=34237;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Parts Recovery Technician (25)
SET @ENTRY  :=34268;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- XR-949 Salvagebot (25)
SET @ENTRY  :=34270;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XD-175 Compactobot (25)
SET @ENTRY  :=34272;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XB-488 Disposalbot (25)
SET @ENTRY  :=34274;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- cleanup
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126981;
UPDATE `creature_template` SET `dmg_multiplier`=15 WHERE `entry`=31533;

-- update waypoints
UPDATE `waypoint_data` SET `delay`=10000, `action`=1269811 WHERE `id`=1269810 AND `point` IN (5,14);
UPDATE `waypoint_data` SET `action`=1269810 WHERE `id`=1269810 AND `point` IN (2,11);

-- waypoint scripts
DELETE FROM `waypoint_scripts` WHERE `id` IN (1269810,1269811);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`)
VALUES
(1269810,0,14,52092,1,0,0,0,0,0,2500),
(1269811,2,15,52098,1,0,0,0,0,0,2501);

-- bjarngrim's charge up
DELETE FROM `spell_script_names` WHERE `spell_id`=52098;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(52098, 'spell_bjarngrim_charge_up');

-- trigger's charge up
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56458;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,56458,18,1,28586);

-- cast temporary electrical charge on hit
DELETE FROM `spell_scripts` WHERE `id`=56458;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(56458,0,0,15,52092,2,0,0,0,0,0);

-- bjarngrim's stance auras
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (53790,53791,53792);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(53790,41105,2, 'Bjarngrim - Defensive Aura'),
(53791,41107,2, 'Bjarngrim - Berserker Aura'),
(53792,41106,2, 'Bjarngrim - Battle Aura');

-- achievement: lightning struck
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=6835;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6835 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(6835,11,0,0, 'achievement_lightning_struck');

DELETE FROM `creature_loot_template` WHERE `entry` IN (33288,33955);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
-- 10 Man --
(33288,45087,75,1,0,1,1),   -- Runed orb
(33288,1,10,1,1,-34154,1),  -- Recipes
-- 4 - 0 Keeper
(33288,40753,100,1,0,2,2),  -- Emblem of Valor
(33288,2,100,1,0,-34132,2), -- Normal Loot (10)
(33288,3,100,1,0,-70000,1), -- Tier-Token
-- 1 or 0 Keeper (HardMode)
(33288,4,100,2,0,-12021,1), -- Emblem of Conquest
(33288,46068,0,2,1,1,1),    -- Amice of Inconceivable Horror
(33288,46095,0,2,1,1,1),    -- Soul-Devouring Cinch
(33288,46096,0,2,1,1,1),    -- Signet of Soft Lament
(33288,46097,0,2,1,1,1),    -- Caress of Insanity
(33288,46067,0,2,1,1,1),    -- Hammer of Crushing Whispers
-- 0 Keeper
(33288,5,100,4,0,-12022,1), -- Emblem of Conquest
(33288,46312,100,4,0,1,1),  -- Vanquished Clutches of Yogg-Saron

-- 25 Man --
(33955,45087,75,1,0,1,1),   -- Runed Orb
(33955,45038,100,1,0,1,1),  -- Fragment of Val'anyr
(33955,1,10,1,0,-34154,1),  -- Recipes
-- 4 - 0 Keeper
(33955,45624,100,1,0,2,2),  -- Emblem of Conquest
(33955,2,100,1,0,-34165,2), -- Normal Loot (25)
(33955,3,100,1,0,-70001,2), -- Tier-Token
-- 1 or 0 Keeper (HardMode)
(33955,4,100,2,0,-12021,1), -- Emblem of Conquest
(33955,45537,0,2,1,1,1),    -- Treads of the False Oracle
(33955,45536,0,2,1,1,1),    -- Legguards of Cunning Deception
(33955,45534,0,2,1,1,1),    -- Seal of the Betrayed King
(33955,45535,0,2,1,1,1),    -- Show of Faith
(33955,45533,0,2,1,1,1),    -- Dark Edge of Depravity
-- 0 Keeper
(33955,5,100,4,0,-12022,1), -- Emblem of Conquest
(33955,45693,100,4,0,1,1);  -- Mimiron's Head

DELETE FROM `reference_loot_template` WHERE `entry` IN (34132,34165,70000,70001,12021,12022);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Yogg-Saron (10) Normal Loot
(34132,46030,0,1,1,1,1),    -- Treads of the Dragon Council
(34132,46019,0,1,1,1,1),    -- Leggings of the Insatiable
(34132,46028,0,1,1,1,1),    -- Faceguard of the Eyeless Horror
(34132,46022,0,1,1,1,1),    -- Pendant of a Thousand Maws
(34132,46021,0,1,1,1,1),    -- Royal Seal of King Llane
(34132,46024,0,1,1,1,1),    -- Kingsbane
(34132,46016,0,1,1,1,1),    -- Abaddon
(34132,46031,0,1,1,1,1),    -- Touch of Madness
(34132,46025,0,1,1,1,1),    -- Devotion
(34132,46018,0,1,1,1,1),    -- Deliverance
-- Yogg-Saron (25) Normal Loot
(34165,45529,0,1,1,1,1),    -- Shawl of Haunted Memories
(34165,45532,0,1,1,1,1),    -- Cowl of Dark Whispers
(34165,45523,0,1,1,1,1),    -- Garona's Guise
(34165,45524,0,1,1,1,1),    -- Chestguard of Insidious Intent
(34165,45531,0,1,1,1,1),    -- Chestguard of the Fallen God
(34165,45525,0,1,1,1,1),    -- Godbane Signet
(34165,45530,0,1,1,1,1),    -- Sanity's Bond
(34165,45522,0,1,1,1,1),    -- Blood of the Old God
(34165,45527,0,1,1,1,1),    -- Soulscribe
(34165,45521,0,1,1,1,1),    -- Earthshaper
-- Yogg-Saron (10) Tier-Token
(70000,45635,0,1,1,1,1),    -- Chestguard of the Wayward Conqueror
(70000,45636,0,1,1,1,1),    -- Chestguard of the Wayward Protector
(70000,45637,0,1,1,1,1),    -- Chestguard of the Wayward Vanquisher
-- Yogg-Saron (25) Tier-Token
(70001,45656,0,1,1,1,1),    -- Mantle of the Wayward Conqueror
(70001,45657,0,1,1,1,1),    -- Mantle of the Wayward Protector
(70001,45658,0,1,1,1,1),    -- Mantle of the Wayward Vanquisher
-- Emblem of Conquest 
(12021,45624,0,2,1,1,1),
(12022,45624,0,4,1,1,1);

-- TODO: this list of vehicles isn't complete, need to find more vehicles with missing immunities
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` |
0x00000002| -- MECHANIC_DISORIENTED (Blind)
0x00000008| -- MECHANIC_DISTRACT (Distract)
0x00000010| -- MECHANIC_FEAR (Fear, Psychic Scream)
0x00000020| -- MECHANIC_GRIP (Death Grip)
0x00000040| -- MECHANIC_ROOT (Entangling Roots)
0x00000100| -- MECHANIC_SILENCE (Silence)
0x00000200| -- MECHANIC_SLEEP (Wyvern Sting)
0x00000400| -- MECHANIC_SNARE (Crippling Poison, Piercing Howl)
0x00000800| -- MECHANIC_STUN (Hammer of Justice)
0x00001000| -- MECHANIC_FREEZE (Freezing Trap)
0x00002000| -- MECHANIC_KNOUCKOUT (Gouge, Blast Wave)
-- 0x00004000| -- MECHANIC_BLEED (Rend, Deep Wounds) - requires confirmation
0x00010000| -- MECHANIC_POLYMORPH (Polymorph)
0x00040000| -- MECHANIC_SHIELD (Power word: Shield) -- maybe unnecessary, spells shouldn't be even casted on vehicles
-- 0x00200000| -- MECHANIC_INFECTED (Frost Fever, Blood Plague) - requires confirmation
0x00800000| -- MECHANIC_HORROR (warlock's Death Coil)
0x10000000| -- MECHANIC_IMMUNE_SHIELD (Hand of Protection) -- maybe unnecessary, spells shouldn't be even casted on vehicles
0x02000000| -- MECHANIC_INTERRUPT (Kick, Counterspell)
0x04000000 -- MECHANIC_DAZE (Dazed)
where entry IN (
-- Some random quest vehicles
25334, -- Horde Siege Tank
26523, -- Forsaken Blight Spreader
-- Strand of the Ancients vehicles
28781, -- Battleground Demolisher
32796, -- Battleground Demolisher (heroic)
27894, -- Antipersonnel Cannon
32795, -- Antipersonnel Cannon (heroic)
-- Wintergrasp vehicles
27881, -- Wintergrasp Catapult (both)
28094, -- Wintergrasp Demolisher (both)
28312, -- Wintergrasp Siege Engine (alliance)
28319, -- Wintergrasp Siege Turret (alliance)
28366, -- Wintergrasp Tower Cannon (both)
32627, -- Wintergrasp Siege Engine (horde)
32629, -- Wintergrasp Siege Turret (alliance)
-- Ulduar Vehicles
33060, -- Salvaged Siege Engine
33062, -- Salvaged Chopper
33067, -- Salvaged Siege Turret
33109, -- Salvaged Demolisher
-- Isle of Conquest vehicles
34793, -- Catapult (both)
34775, -- Demolisher (both)
34776, -- Siege Engine (alliance)
34777, -- Siege Turret (alliance)
34778, -- Flame Turret (alliance)
34802, -- Glaive Thrower (alliance)
34944, -- Keep Cannon (both)
35069, -- Siege Engine (horde)
35273, -- Glaive Thrower (horde)
36355, -- Siege Turret (horde)
36356); -- Flame Turret (horde)

