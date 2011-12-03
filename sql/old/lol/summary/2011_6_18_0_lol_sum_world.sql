-- Add passive Flag to various Ulduar triggers
UPDATE creature_template SET unit_flags = unit_flags|512 WHERE entry IN (
33054, -- Thorim Trap Bunny
33500, -- Vezax Bunny
33575, -- Channel Stalker Freya
33661, -- Armsweep Stalker Kologarn
34188, -- Razorscale Devouring Flame Stalker
34189, -- Razorscale Devouring Flame Stalker (heroic)
34098, -- Auriaya Seeping Essence Stalker
34174  -- Auriaya Seeping Essence Stalker (heroic)
);

-- Remove NON_SELECTABLE from Clockwork Mechanic
UPDATE creature_template SET unit_flags = unit_flags &~ 33554432 WHERE entry = 34184;
-- Add Reputation gain/loss to High Admiral "Shelly" Jorrik
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
  (26081, 87, 21, 7, 0, 5, 7, 127, -125, 0);
-- Flame Leviathan (10) (0 Tower)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33113 AND `item`=47241;
-- Flame Leviathan (25) (0 Tower)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=34003 AND `item`=47241;

-- Ignis (10)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33118 AND `item`=47241;
-- Ignis (25)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33190 AND `item`=47241;

-- Razorscale (10)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33186 AND `item`=47241;
-- Razorscale (25)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33724 AND `item`=47241;

-- XT-002 (10)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33293 AND `item`=47241;
DELETE FROM `reference_loot_template` WHERE `entry`=34121 AND `lootmode`=2;
DELETE FROM `creature_loot_template` WHERE `entry`=33293 AND `lootmode`=2;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33293','45624','100','2','0','1','1'),
('33293','45867','0','2','1','1','1'),
('33293','45868','0','2','1','1','1'),
('33293','45869','0','2','1','1','1'),
('33293','45870','0','2','1','1','1'),
('33293','45871','0','2','1','1','1');
-- XT-002 (25)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33885 AND `item`=47241;

-- Stormcaller Brundir (10)
UPDATE `creature_loot_template` SET `item`=40753, `mincountOrRef`=2, `maxcount`=2 WHERE `entry`=32857 AND `item`=47241;
-- Stormcaller Brundir (25)
UPDATE `creature_loot_template` SET `item`=45624, `mincountOrRef`=2, `maxcount`=2 WHERE `entry`=33694 AND `item`=47241;

-- Runemaster Molgeim (10)
UPDATE `creature_loot_template` SET `item`=40753, `mincountOrRef`=2, `maxcount`=2 WHERE `entry`=32927 AND `item`=47241;
DELETE FROM `creature_loot_template` WHERE `entry`=32927 AND `item`=45624;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('32927','45624','100','1','0','1','1');
-- Runemaster Molgeim (25)
UPDATE `creature_loot_template` SET `item`=45624, `mincountOrRef`=3, `maxcount`=3 WHERE `entry`=33692 AND `item`=47241;

-- Steelbreaker (10)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=32867 AND `item`=47241;
DELETE FROM `creature_loot_template` WHERE `entry`=32867 AND `item`=45624;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('32867','45624','100','1','0','2','2');
-- Steelbreaker (25)
UPDATE `creature_loot_template` SET `item`=45624, `mincountOrRef`=3, `maxcount`=3 WHERE `entry`=33693 AND `item`=47241;

-- Auriaya (10)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33515 AND `item`=47241;
-- Auriaya (25)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=34175 AND `item`=47241;

-- Kologarn (10)
UPDATE `gameobject_loot_template` SET `item`=40753 WHERE `entry`=27061 AND `item`=47241;
-- Kologarn (25)
UPDATE `gameobject_loot_template` SET `item`=45624 WHERE `entry`=26929 AND `item`=47241;

-- Freya (25)
DELETE FROM `reference_loot_template` WHERE `entry` IN (12020,12021,12022);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- t8.5
('12020','45653','0','1','1','1','1'),
('12020','45654','0','1','1','1','1'),
('12020','45655','0','1','1','1','1'),
-- 1 elder alive emblems
('12021','45624','100','2','0','1','1'),
-- 2 elder alive emblems
('12022','45624','100','4','0','1','1'),
('12022','45087','100','4','0','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27079,26962);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- Freya (25) normal
('27079','1','100','1','0','1','1'),
('27079','2','100','1','0','-34154','1'),
('27079','3','100','1','0','-12020','2'),
('27079','4','100','2','0','-12021','1'),
('27079','5','100','4','0','-12022','1'),
('27079','45038','18','1','0','1','1'),
('27079','45087','100','1','0','1','1'),
('27079','45479','0','1','1','1','1'),
('27079','45480','0','1','1','1','1'),
('27079','45481','0','1','1','1','1'),
('27079','45482','0','1','1','1','1'),
('27079','45483','0','1','1','1','1'),
('27079','45624','100','1','0','1','1'),
('27079','46110','100','1','0','1','1'),
-- Freya (25) hard
('26962','1','100','1','0','-34154','1'),
('26962','2','100','1','0','-12020','2'),
('26962','45038','18','1','0','1','1'),
('26962','45087','100','1','0','3','3'),
('26962','45479','0','1','1','1','1'),
('26962','45480','0','1','1','1','1'),
('26962','45481','0','1','1','1','1'),
('26962','45482','0','1','1','1','1'),
('26962','45483','0','1','1','1','1'),
('26962','45484','0','2','2','1','1'),
('26962','45485','0','2','2','1','1'),
('26962','45486','0','2','2','1','1'),
('26962','45487','0','2','2','1','1'),
('26962','45488','0','2','2','1','1'),
('26962','45613','0','2','2','1','1'),
('26962','45624','100','1','0','5','5'),
('26962','45814','-100','1','0','1','1'),
('26962','46110','100','1','0','1','1');

-- Mimiron (10) normal
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=194956;
DELETE FROM `reference_loot_template` WHERE `entry`=34129 AND `lootmode`=2;
DELETE FROM `gameobject_loot_template` WHERE `entry`=27085 AND `lootmode`=2;
UPDATE `gameobject_loot_template` SET `item`=40753 WHERE `entry`=27085 AND `item`=47241;
-- Mimiron (10) hard
DELETE FROM `gameobject_loot_template` WHERE `entry`=27086;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27086','1','100','1','0','-34129','1'),
('27086','45982','0','1','2','1','1'),
('27086','45988','0','1','2','1','1'),
('27086','45989','0','1','2','1','1'),
('27086','45990','0','1','2','1','1'),
('27086','45993','0','1','2','1','1'),
('27086','45647','0','1','1','1','1'),
('27086','45648','0','1','1','1','1'),
('27086','45649','0','1','1','1','1'),
('27086','45787','-100','1','0','1','1'),
('27086','40753','100','1','0','1','1'),
('27086','45624','100','1','0','1','1');

-- Mimiron (25) normal
DELETE FROM `gameobject_loot_template` WHERE `entry`=26963 AND (`lootmode`=2 OR `groupid`=3);
UPDATE `gameobject_loot_template` SET `item`=45624 WHERE `entry`=26963 AND `item`=47241;

DELETE FROM `reference_loot_template` WHERE `entry`=34180;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34180','45641','0','1','1','1','1'),
('34180','45642','0','1','1','1','1'),
('34180','45643','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry`=26963 AND `mincountOrRef`=-34180;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26963','2','100','1','0','-34180','2');

-- Mimiron (25) hard
DELETE FROM `gameobject_loot_template` WHERE `entry`=26967;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26967','1','10','1','0','-34154','1'),
('26967','2','100','1','0','-34180','2'),
('26967','45038','18','1','0','1','1'),
('26967','45087','75','1','0','1','1'),
('26967','45489','0','1','1','1','1'),
('26967','45490','0','1','1','1','1'),
('26967','45491','0','1','1','1','1'),
('26967','45492','0','1','1','1','1'),
('26967','45493','0','1','1','1','1'),
('26967','45494','0','1','2','1','1'),
('26967','45495','0','1','2','1','1'),
('26967','45496','0','1','2','1','1'),
('26967','45497','0','1','2','1','1'),
('26967','45620','0','1','2','1','1'),
('26967','45624','100','1','0','2','2'),
('26967','45663','0','1','2','1','1'),
('26967','45816','-100','1','0','1','1');

-- Thorim (10) normal
UPDATE `gameobject_template` SET `faction`=0, `flags`=0 WHERE `entry`=194312;
UPDATE `gameobject_template` SET `size`=3, `data1`=40000 WHERE `entry`=194315;
DELETE FROM `reference_loot_template` WHERE `entry`=34130 AND `lootmode`=2;
DELETE FROM `gameobject_loot_template` WHERE `entry`=27073 AND `lootmode`=2;
UPDATE `gameobject_loot_template` SET `item`=40753 WHERE `entry`=27073 AND `item`=47241;
-- Thorim (10) hard
DELETE FROM `gameobject_loot_template` WHERE `entry`=27074;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27074','1','100','1','0','-34130','1'),
('27074','45928','0','1','2','1','1'),
('27074','45929','0','1','2','1','1'),
('27074','45930','0','1','2','1','1'),
('27074','45931','0','1','2','1','1'),
('27074','45933','0','1','2','1','1'),
('27074','45659','0','1','1','1','1'),
('27074','45660','0','1','1','1','1'),
('27074','45661','0','1','1','1','1'),
('27074','45784','-100','1','0','1','1'),
('27074','40753','100','1','0','1','1'),
('27074','45624','100','1','0','1','1');

-- Thorim (25) normal
DELETE FROM `reference_loot_template` WHERE `entry`=34181;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34181','45638','0','1','1','1','1'),
('34181','45639','0','1','1','1','1'),
('34181','45640','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry`=40000;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('40000','1','10','1','0','-34154','1'),
('40000','2','100','1','0','-34181','2'),
('40000','45038','18','1','0','1','1'),
('40000','45087','75','1','0','1','1'),
('40000','45463','0','1','1','1','1'),
('40000','45466','0','1','1','1','1'),
('40000','45467','0','1','1','1','1'),
('40000','45468','0','1','1','1','1'),
('40000','45469','0','1','1','1','1'),
('40000','45624','100','1','0','1','1');

-- Thorim (25) hard
DELETE FROM `gameobject_loot_template` WHERE `entry`=26955;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26955','1','10','1','0','-34154','1'),
('26955','2','100','1','0','-34181','2'),
('26955','45038','18','1','0','1','1'),
('26955','45087','75','1','0','1','1'),
('26955','45463','0','1','1','1','1'),
('26955','45466','0','1','1','1','1'),
('26955','45467','0','1','1','1','1'),
('26955','45468','0','1','1','1','1'),
('26955','45469','0','1','1','1','1'),
('26955','45470','0','1','2','1','1'),
('26955','45471','0','1','2','1','1'),
('26955','45472','0','1','2','1','1'),
('26955','45473','0','1','2','1','1'),
('26955','45474','0','1','2','1','1'),
('26955','45570','0','1','2','1','1'),
('26955','45624','100','1','0','2','2'),
('26955','45817','-100','1','0','1','1');

-- Hodir (10) normal
UPDATE `gameobject_template` SET `flags`=16 WHERE `entry`=194201;
UPDATE `gameobject_loot_template` SET `item`=40753 WHERE `entry`=27068 AND `item`=47241;
-- Hodir (10) hard
UPDATE `gameobject_loot_template` SET `lootmode`=1 WHERE `entry`=27069 AND `lootmode`=2;
UPDATE `gameobject_loot_template` SET `item`=45624 WHERE `entry`=27069 AND `item`=47241;

-- Hodir (25) normal
DELETE FROM `reference_loot_template` WHERE `entry`=34182;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34182','45632','0','1','1','1','1'),
('34182','45633','0','1','1','1','1'),
('34182','45634','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry`=26946;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26946','1','10','1','0','-34154','1'),
('26946','2','100','1','0','-34182','2'),
('26946','45038','8','1','0','1','1'),
('26946','45087','75','1','0','1','1'),
('26946','45450','0','1','1','1','1'),
('26946','45451','0','1','1','1','1'),
('26946','45452','0','1','1','1','1'),
('26946','45453','0','1','1','1','1'),
('26946','45454','0','1','1','1','1'),
('26946','45624','100','1','0','1','1');

-- Hodir (25) hard
UPDATE `gameobject_loot_template` SET `lootmode`=1 WHERE `entry`=26950 AND `lootmode`=2;
UPDATE `gameobject_loot_template` SET `item`=45624 WHERE `entry`=26950 AND `item`=47241;

-- Vezax (10)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33271 AND `item`=47241;
DELETE FROM `reference_loot_template` WHERE `entry`=34131 AND `lootmode`=2;
DELETE FROM `creature_loot_template` WHERE `entry`=33271 AND `lootmode`=2;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33271','45624','100','2','0','1','1'),
('33271','46032','0','2','1','1','1'),
('33271','46033','0','2','1','1','1'),
('33271','46034','0','2','1','1','1'),
('33271','46035','0','2','1','1','1'),
('33271','46036','0','2','1','1','1');
-- Vezax (25)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33449 AND `item`=47241;

-- Yogg-Saron (10) (4 Keeper)
UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33288 AND `item`=47241;
-- Yogg-Saron (25) (4 Keeper)
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33955 AND `item`=47241;

UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry` IN (33113,34003, 33118,33190, 33293,33885, 32867,33693, 32927,33692, 32930,33909, 32933,33910, 32934,33911, 34014,34166, 32906,33360, 33203,33376, 33228,33385, 32915,33391, 32913,33392, 32914,33393, 33524,34152, 33288,33955, 32871,33070, 33121,33191);
UPDATE `creature_template` SET `mechanic_immune_mask`=617299803 WHERE `entry` IN (33515,34175, 33271,33449);
UPDATE `creature_template` SET `mechanic_immune_mask`=617297755, `flags_extra`=`flags_extra`|0x100000 WHERE `entry` IN (34035,34171, 32857,33694);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|1 WHERE `entry` IN (33909,33391,33392,33393,33449,33955);

-- Flame Leviathan
UPDATE `creature_model_info` SET `bounding_radius`=0.93, `combat_reach`=10 WHERE `modelid`=28875;
-- Molgeim
UPDATE `creature_model_info` SET `bounding_radius`=0.45, `combat_reach`=4 WHERE `modelid`=28381;
-- Steelbreaker
UPDATE `creature_model_info` SET `bounding_radius`=0.45, `combat_reach`=8 WHERE `modelid`=28344;
-- Auriaya
UPDATE `creature_model_info` SET `bounding_radius`=0.775, `combat_reach`=5 WHERE `modelid`=28651;
-- Vezax
UPDATE `creature_model_info` SET `bounding_radius`=0.62, `combat_reach`=12 WHERE `modelid`=28548;
UPDATE `creature_model_info` SET `bounding_radius`=0.62, `combat_reach`=10 WHERE `modelid`=28992;

-- Sartharion
UPDATE `creature_model_info` SET `bounding_radius`=1.8, `combat_reach`=17 WHERE `modelid`=27035;
-- Cyanigosa
UPDATE `creature_model_info` SET `bounding_radius`=1.2, `combat_reach`=12 WHERE `modelid`=27508;


UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33121;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33191;

UPDATE `creature_template` SET `dmg_multiplier`=17 WHERE `entry`=33388;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=33850;

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=33453;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33851;

UPDATE `creature_template` SET `dmg_multiplier`=7.5 WHERE `entry`=34035;
UPDATE `creature_template` SET `dmg_multiplier`=13 WHERE `entry`=34171;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32916;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33400;

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=33202;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33398;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33203;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33376;

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=32876;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33158;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32872;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33149;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32873;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33148;

DELETE FROM `spell_script_names` WHERE `spell_id`=64218;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64218, 'spell_overcharge_targeting');

DELETE FROM `conditions` WHERE `SourceEntry`=64218 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,64218,18,1,33998, 'Emalon - Overcharge');

-- instance oculus
UPDATE creature_template SET unit_flags=0 WHERE entry=30879;
UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=188715;
UPDATE creature_template SET AIName="SmartAI" WHERE entry IN(27636, 27633, 27635, 27638, 27639, 27640, 28276, 27642, 27644, 27645, 27647, 27648, 27650, 27651, 27653, 28239);
UPDATE creature_template SET ScriptName="npc_oculus_drakes" WHERE entry IN(27692, 27755, 27756);
UPDATE creature_template SET ScriptName="npc_arcane_beam" WHERE entry=28239;

UPDATE creature_template SET mingold=7666, maxgold=12776 WHERE entry IN(30901, 30904, 30915, 30916, 31558, 31559, 31560);
UPDATE creature_template SET mingold=3866, maxgold=6433 WHERE entry IN(27654, 27447);

UPDATE creature_template SET speed_walk=2.8 WHERE entry IN(27755, 27756, 27692);

DELETE FROM spell_script_names WHERE spell_id IN(50341, 49838, 49840, 50240, 49592);
INSERT INTO spell_script_names VALUES
(50341, "spell_emerald_drake_touch_the_nightmare"),
(49840, "spell_amber_drake_schock_lance"),
(49838, "spell_amber_drake_time_stop"),
(50240, "spell_ruby_drake_evasive_maneuvers"),
(49592, "spell_amber_drake_temporal_rift");

DELETE FROM spell_proc_event WHERE entry=50240;
INSERT INTO spell_proc_event VALUES
(50240, 0, 0, 0, 0, 0, 0, 0x0000004, 0, 100, 0);

DELETE FROM smart_scripts WHERE entryorguid IN (27636, 27633, 27635, 27638, 27639, 27640, 28276, 27642, 27644, 27645, 27647, 27648,27650, 27651, 27653, 188715);
INSERT INTO smart_scripts VALUES
-- trash
(27636, 0, 0, 0, 0, 0, 100, 0x02, 2000, 4000, 2000, 4000, 11, 50705, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Ley-Whelp - Arcane Bolt normal"),
(27636, 0, 1, 0, 0, 0, 100, 0x04, 2000, 4000, 2000, 4000, 11, 59210, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Ley-Whelp - Arcane Bolt heroic"),
(27633, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 6000, 8000, 11, 50573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Inquisitor - Arcane Cleave"),
(27633, 0, 1, 0, 0, 0, 100, 0, 9000, 10000, 15000, 20000, 11, 50690, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Inquisitor - immobilizing field"),
(27633, 0, 2, 0, 9, 0, 100, 0x02, 5, 30, 3000, 5000, 11, 51454, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Inquisitor - Throw normal"),
(27633, 0, 3, 0, 9, 0, 100, 0x04, 5, 30, 3000, 5000, 11, 59209, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Inquisitor - Throw heroic"),
(27635, 0, 0, 0, 0, 0, 100, 0x02, 3000, 5000, 7000, 10000, 11, 50702, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Spellbinder - Arcane Volley normal"),
(27635, 0, 1, 0, 0, 0, 100, 0x04, 3000, 5000, 7000, 10000, 11, 59212, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Spellbinder - Arcane Volley heroic"),
(27635, 0, 2, 0, 0, 0, 100, 0x02, 7000, 9000, 15000, 20000, 11, 50566, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Azure Spellbinder - Mind Warp normal"),
(27635, 0, 3, 0, 0, 0, 100, 0x04, 7000, 9000, 15000, 20000, 11, 38047, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Azure Spellbinder - Mind Warp heroic"),
(27635, 0, 4, 0, 0, 0, 100, 0, 10000, 13000, 20000, 25000, 11, 50572, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Azure Spellbinder - Power Sap"),
(27638, 0, 0, 0, 0, 0, 100, 0x02, 3000, 6000, 14000, 18000, 11, 49549, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Ring Guardian - Ice Beam normal"),
(27638, 0, 1, 0, 0, 0, 100, 0x04, 3000, 6000, 14000, 18000, 11, 59211, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Azure Ring Guardian - Ice Beam heroic"),
(27639, 0, 0, 0, 0, 0, 100, 0x02, 4000, 5000, 12000, 15000, 11, 50715, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Ring-Lord Sorceress - Blizzard normal"),
(27639, 0, 1, 0, 0, 0, 100, 0x04, 4000, 5000, 12000, 15000, 11, 59278, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Ring-Lord Sorceress - Blizzard heroic"),
(27639, 0, 2, 0, 0, 0, 100, 0x02, 10000, 12000, 19000, 22000, 11, 16102, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Ring-Lord Sorceress - Flamestrike normal"),
(27639, 0, 3, 0, 0, 0, 100, 0x04, 10000, 12000, 19000, 22000, 11, 61402, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Ring-Lord Sorceress - Flamestrike heroic"),
(27640, 0, 0, 0, 4, 0, 100, 0x02, 0, 0, 0, 0, 11, 50717, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Ring-Lord Conjurer - Charged Skin normal"),
(27640, 0, 1, 0, 4, 0, 100, 0x04, 0, 0, 0, 0, 11, 59276, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Ring-Lord Conjurer - Charged Skin normal"),
(28276, 0, 0, 0, 0, 0, 100, 0x02, 2000, 4000, 4000, 7000, 11, 62249, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Ley-Whelp - Arcane Bolt normal"),
(28276, 0, 1, 0, 0, 0, 100, 0x04, 2000, 4000, 4000, 7000, 11, 62250, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Ley-Whelp - Arcane Bolt heroic"),

-- Mage-Lord adds
(27642, 0, 0, 0, 9, 0, 100, 0, 8, 25, 6000, 8000, 11, 32323, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Mammoth - Charge"),
(27642, 0, 1, 0, 0, 0, 100, 0, 4000, 6000, 10000, 12000, 11, 51253, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Mammoth - Trample"),
(27644, 0, 0, 0, 0, 0, 100, 0x02, 3000, 6000, 12000, 14000, 11, 50728, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Wolf - Furious Howl normal"),
(27644, 0, 1, 0, 0, 0, 100, 0x04, 3000, 6000, 12000, 14000, 11, 59274, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Wolf - Furious Howl heroic"),
(27644, 0, 2, 0, 0, 0, 100, 0x02, 5000, 8000, 14000, 17000, 11, 50729, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Wolf - Carnivorous Bite normal"),
(27644, 0, 3, 0, 0, 0, 100, 0x04, 5000, 8000, 14000, 17000, 11, 59269, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Wolf - Carnivorous Bite normal"),
(27645, 0, 0, 0, 0, 0, 100, 0x02, 6000, 8000, 8000, 10000, 11, 59220, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Cloudscraper - Chain Lightning normal"),
(27645, 0, 1, 0, 0, 0, 100, 0x04, 6000, 8000, 8000, 10000, 11, 15588, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Cloudscraper - Chain Lightning heroic"),
(27645, 0, 2, 0, 0, 0, 100, 0x02, 2000, 4000, 10000, 12000, 11, 15588, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Cloudscraper - Thunderclap normal"),
(27645, 0, 3, 0, 0, 0, 100, 0x04, 2000, 4000, 10000, 12000, 11, 59217, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Cloudscraper - Thunderclap heroic"),
(27647, 0, 0, 0, 0, 0, 100, 0, 2000, 5000, 7000, 9000, 11, 50731, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Ogre - Mace Smash"),
(27647, 0, 1, 0, 0, 0, 100, 0, 8000, 12000, 25000, 35000, 11, 50730, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Ogre - Bloodlust"),
(27648, 0, 0, 0, 0, 0, 100, 0x02, 3000, 5000, 12000, 14000, 11, 50732, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Naga - Water Tomb normal"),
(27648, 0, 1, 0, 0, 0, 100, 0x04, 3000, 5000, 12000, 14000, 11, 59261, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Naga - Water Tomb heroic"),
(27650, 0, 0, 0, 0, 0, 100, 0x02, 1000, 3000, 15000, 2000, 75, 25020, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Air - Lightning Shield normal"),
(27650, 0, 1, 0, 0, 0, 100, 0x04, 1000, 3000, 15000, 2000, 75, 20545, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Air - Lightning Shield heroic"),
(27651, 0, 0, 0, 0, 0, 100, 0x02, 3000, 5000, 5000, 8000, 11, 50744, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Fire - Blaze normal"),
(27651, 0, 1, 0, 0, 0, 100, 0x04, 3000, 5000, 5000, 8000, 11, 59225, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Fire - Blaze heroic"),
(27653, 0, 0, 0, 0, 0, 100, 0x02, 5000, 8000, 7000, 9000, 11, 37924, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Water - Water Bolt Volley normal"),
(27653, 0, 1, 0, 0, 0, 100, 0x04, 5000, 8000, 7000, 9000, 11, 59266, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Phantasmal Water - Water Bolt Volley heroic"),

-- misc
(188715, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3872.2, 6984.4, 108.2, 0, "Teleport on Orb use");

DELETE FROM creature_loot_template WHERE entry IN(30901, 30902, 30904, 30905, 30906, 30907, 30908, 30909, 30910, 30911, 30912, 30913, 30914, 30915, 30916);
INSERT INTO creature_loot_template VALUES
(30902, 33631, 73, 1, 0, 1, 1),
(30902, 33632, 17, 1, 0, 1, 1),
(30902, 37366, 1, 1, 0, 1, 1),
(30902, 37365, 1, 1, 0, 1, 1),
(30902, 37364, 1, 1, 0, 1, 1),
(30902, 43297, 0.1, 1, 0, 1, 1),
(30902, 45912, 0.1, 1, 0, 1, 1),
(30901, 33470, 33, 1, 0, 1, 7),
(30901, 43852, 19, 1, 0, 1, 1),
(30901, 33454, 8, 1, 0, 1, 1),
(30901, 33445, 4, 1, 0, 1, 1),
(30901, 33447, 2, 1, 0, 1, 1),
(30901, 33448, 2, 1, 0, 1, 1),
(30901, 37364, 1.2, 1, 0, 1, 1),
(30901, 37366, 1, 1, 0, 1, 1),
(30901, 37365, 1, 1, 0, 1, 1),
(30901, 43297, 0.1, 1, 0, 1, 1),
(30901, 45912, 0.1, 1, 0, 1, 1),
(30904, 33470, 31, 1, 0, 1, 7),
(30904, 43852, 19, 1, 0, 1, 1),
(30904, 33454, 7, 1, 0, 1, 1),
(30904, 33445, 4, 1, 0, 1, 1),
(30904, 33447, 2, 1, 0, 1, 1),
(30904, 37366, 1, 1, 0, 1, 1),
(30904, 37365, 1, 1, 0, 1, 1),
(30904, 37364, 1, 1, 0, 1, 1),
(30904, 43297, 0.1, 1, 0, 1, 1),
(30904, 45912, 0.1, 1, 0, 1, 1),
(30916, 33470, 32, 1, 0, 1, 7),
(30916, 43852, 18, 1, 0, 1, 1),
(30916, 33454, 8, 1, 0, 1, 1),
(30916, 33445, 4, 1, 0, 1, 1),
(30916, 33447, 2, 1, 0, 1, 1),
(30916, 37366, 1, 1, 0, 1, 1),
(30916, 37365, 1, 1, 0, 1, 1),
(30916, 37364, 1, 1, 0, 1, 1),
(30916, 43297, 0.1, 1, 0, 1, 1),
(30916, 45912, 0.1, 1, 0, 1, 1),
(30915, 33470, 33, 1, 0, 1, 7),
(30915, 43852, 19, 1, 0, 1, 1),
(30915, 33454, 8, 1, 0, 1, 1),
(30915, 33445, 4, 1, 0, 1, 1),
(30915, 33447, 2, 1, 0, 1, 1),
(30915, 33478, 2, 1, 0, 1, 1),
(30915, 37366, 1, 1, 0, 1, 1),
(30915, 37365, 1, 1, 0, 1, 1),
(30915, 37364, 1, 1, 0, 1, 1),
(30915, 43297, 0.1, 1, 0, 1, 1),
(30915, 45912, 0.1, 1, 0, 1, 1),
(30905, 39209, 72, 1, 0, 1, 1),
(30905, 39210, 17, 1, 0, 1, 1),
(30905, 37366, 1, 1, 0, 1, 1),
(30905, 37365, 1, 1, 0, 1, 1),
(30905, 37364, 1, 1, 0, 1, 1),
(30905, 43297, 0.1, 1, 0, 1, 1),
(30905, 45912, 0.1, 1, 0, 1, 1),
(30906, 39512, 72, 1, 0, 1, 4),
(30906, 37700, 28, 1, 0, 1, 4),
(30906, 39513, 17, 1, 0, 1, 4),
(30906, 37366, 1, 1, 0, 1, 1),
(30906, 37365, 1, 1, 0, 1, 1),
(30906, 37364, 1, 1, 0, 1, 1),
(30908, 39512, 69, 1, 0, 1, 4),
(30908, 37702, 30, 1, 0, 1, 4),
(30908, 39513, 18, 1, 0, 1, 4),
(30908, 37366, 1.7, 1, 0, 1, 1),
(30908, 37365, 1, 1, 0, 1, 1),
(30908, 37364, 1, 1, 0, 1, 1),
(30913, 39512, 72, 1, 0, 1, 4),
(30913, 37705, 30, 1, 0, 1, 4),
(30913, 39513, 18, 1, 0, 1, 4),
(30913, 37366, 1, 1, 0, 1, 1),
(30913, 37365, 1, 1, 0, 1, 1),
(30913, 37364, 1, 1, 0, 1, 1),
(30912, 33470, 33, 1, 0, 1, 4),
(30912, 43852, 18, 1, 0, 1, 1),
(30912, 33454, 7, 1, 0, 1, 1),
(30912, 33445, 6, 1, 0, 1, 1),
(30912, 33447, 2, 1, 0, 1, 1),
(30912, 33764, 1.8, 1, 0, 1, 1),
(30912, 36047, 1.1, 1, 0, 1, 1),
(30912, 36148, 1.1, 1, 0, 1, 1),
(30912, 37097, 1, 1, 0, 1, 1),
(30912, 33448, 2, 1, 0, 1, 1),
(30912, 36371, 1.3, 1, 0, 1, 1),
(30912, 37366, 1, 1, 0, 1, 1),
(30912, 37365, 1, 1, 0, 1, 1),
(30912, 37364, 1, 1, 0, 1, 1),
(30910, 17057, 27, 1, 0, 1, 1),
(30910, 17058, 25, 1, 0, 1, 1),
(30910, 33470, 19, 1, 0, 1, 1),
(30910, 36781, 16, 1, 0, 1, 1),
(30910, 43852, 12, 1, 0, 1, 1),
(30910, 37365, 1.2, 1, 0, 1, 1),
(30910, 33447, 2, 1, 0, 1, 1),
(30910, 37366, 1, 1, 0, 1, 1),
(30910, 37364, 1, 1, 0, 1, 1),
(30911, 17057, 26, 1, 0, 1, 1),
(30911, 17058, 25, 1, 0, 1, 1),
(30911, 33470, 17, 1, 0, 1, 7),
(30911, 36781, 14, 1, 0, 1, 1),
(30911, 43853, 10, 1, 0, 1, 1),
(30911, 37366, 1, 1, 0, 1, 1),
(30911, 37365, 1, 1, 0, 1, 1),
(30911, 37364, 1, 1, 0, 1, 1),
(30914, 39211, 71, 1, 0, 1, 5),
(30914, 43011, 46, 1, 0, 1, 1),
(30914, 39212, 17, 1, 0, 1, 4),
(30914, 43013, 13, 1, 0, 1, 1),
(30914, 37366, 1, 1, 0, 1, 1),
(30914, 37365, 1, 1, 0, 1, 1),
(30914, 37364, 1, 1, 0, 1, 1),
(30907, 39567, 73, 1, 0, 1, 5),
(30907, 39568, 16, 1, 0, 1, 4),
(30907, 37366, 1, 1, 0, 1, 1),
(30907, 37365, 1, 1, 0, 1, 1),
(30907, 37364, 1, 1, 0, 1, 1),
(30909, 39562, 72, 1, 0, 1, 4),
(30909, 34736, 49, 1, 0, 1, 1),
(30909, 39563, 18, 1, 0, 1, 3),
(30909, 43013, 11, 1, 0, 1, 1),
(30909, 33422, 1, 1, 0, 1, 1),
(30909, 37366, 1, 1, 0, 1, 1),
(30909, 37365, 1, 1, 0, 1, 1),
(30909, 37364, 1, 1, 0, 1, 1);

DELETE FROM script_texts WHERE Entry IN(-1578005,-1578006, -1578007, -1578008, -1578009, -1578010, -1578011, -1578012, -1578013, -1578014, -1578015, -1578016, -1578017, -1578018, -1578019, -1578020, -1578021, -1578022, -1578023, -1578024);
INSERT INTO script_texts VALUES
(27654, -1578005, "The prisoners shall not go free. The word of Malygos is law!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578006, "A fitting punishment!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578007, "Sentence: executed!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578008, "Another casualty of war!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578009, "The war... goes on.", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578010, "Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protect this conduit. I will see to it personally that the Oculus does not fall into your hands!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578011, "It is too late to run!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578012, "Gather 'round...", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578013, "None shall escape!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578014, "I condemn you to death!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578015, "Tremble, worms!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578016, "I will crush you!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578017, "Can you fly?", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578018, "Everything I've done... has been for Azeroth...", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578019, "If only you understood!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578020, "Now do you see? Do you?!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578021, "Unfortunate, but necessary.", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27656, -1578022, "It's a long way down...", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27656, -1578023, "Back to the earth with you!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27656, -1578024, "Enjoy the fall!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, "");

DELETE FROM creature_onkill_reputation WHERE creature_id IN(30902, 30901, 30904, 30915, 30916, 30905, 30903, 31558, 31559, 31560, 31561);
INSERT INTO creature_onkill_reputation VALUES
(30902, 1037, 1052, 7, 0, 2, 7, 0, 2, 1),
(30901, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30904, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30915, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30916, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30905, 1037, 1052, 7, 0, 30, 7, 0, 30, 1),
(30903, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(31558, 1037, 1052, 7, 0, 250, 7, 0, 250, 1),
(31559, 1037, 1052, 7, 0, 250, 7, 0, 250, 1),
(31560, 1037, 1052, 7, 0, 250, 7, 0, 250, 1),
(31561, 1037, 1052, 7, 0, 250, 7, 0, 250, 1);
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask` &~ 1024 WHERE `entry` IN (33113,34003);

DELETE FROM `spell_script_names` WHERE `spell_id`=63278;
INSERT INTO `spell_script_names` VALUE (63278, 'spell_general_vezax_mark_of_the_faceless_drain');

UPDATE `creature_template` SET `ScriptName`='npc_runic_smash' WHERE `entry`=33140;

UPDATE `creature_template` SET `unit_flags`=`unit_flags`|2, `flags_extra`=`flags_extra`|2 WHERE `entry`=33774;

UPDATE `creature_template` SET `dmg_multiplier`=18 WHERE `entry`=33158;

UPDATE `creature_template` SET `dmg_multiplier`=25 WHERE `entry`=33346;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=33886;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=34057;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=34115;

-- Restore old Values of 'Love is in the Air' Necklaces - don't forget to delete WDB folder!
UPDATE `item_template` SET `ItemLevel`=226,`stat_type1`=45,`stat_value1`=74,`stat_type2`=7,`stat_value2`=63,`stat_type3`=5,`stat_value3`=43,`stat_type4`=32,`stat_value4`=41,`stat_type5`=43,`stat_value5`=21 WHERE `entry`=51804;
UPDATE `item_template` SET `ItemLevel`=226,`stat_type1`=45,`stat_value1`=74,`stat_type2`=7,`stat_value2`=63,`stat_type3`=5,`stat_value3`=43,`stat_type4`=6,`stat_value4`=41,`stat_type5`=36,`stat_value5`=42 WHERE `entry`=51805;
UPDATE `item_template` SET `ItemLevel`=226,`stat_type1`=4,`stat_value1`=42,`stat_type2`=7,`stat_value2`=94,`stat_type3`=12,`stat_value3`=41,`stat_type4`=13,`stat_value4`=43,`stat_type5`=31,`stat_value5`=42 WHERE `entry`=51806;
UPDATE `item_template` SET `ItemLevel`=226,`stat_type1`=38,`stat_value1`=84,`stat_type2`=3,`stat_value2`=63,`stat_type3`=7,`stat_value3`=69,`stat_type4`=32,`stat_value4`=36,`stat_type5`=44,`stat_value5`=46 WHERE `entry`=51807;
UPDATE `item_template` SET `ItemLevel`=226,`stat_type1`=4,`stat_value1`=65,`stat_type2`=7,`stat_value2`=93,`stat_type3`=32,`stat_value3`=36,`stat_type4`=31,`stat_value4`=45 WHERE `entry`=51808;
UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry`=33214;
UPDATE `creature` SET `modelid`=28830, `curhealth`=6000, `spawntimesecs`=150 WHERE `id`=33214;

SET @GUID := 302618;

DELETE FROM `creature` WHERE `id`=33214 AND `spawnMask`=2;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+64;
INSERT INTO `creature` VALUES

(@GUID,33214,603,3,1,28830,0,278.447,-37.0855,493.119,4.88278,150,50,0,6000,0,0,1,0,0,0),
(@GUID+1,33214,603,3,1,28830,0,278.935,48.7189,480.907,1.02569,150,50,0,6000,0,0,1,0,0,0),
(@GUID+2,33214,603,3,1,28830,0,254.262,8.02975,492.596,1.02569,150,50,0,6000,0,0,1,0,0,0),
(@GUID+3,33214,603,3,1,28830,0,247.109,-3.76575,481.68,1.02569,150,50,0,6000,0,0,1,0,0,0),
(@GUID+4,33214,603,3,1,28830,0,242.736,-11.7488,483.917,1.51107,150,50,0,6000,0,0,1,0,0,0),
(@GUID+5,33214,603,3,1,28830,0,241.389,-34.2777,489.461,1.51107,150,50,0,6000,0,0,1,0,0,0),
(@GUID+6,33214,603,3,1,28830,0,240.89,-54.6403,494.47,1.87628,150,50,0,6000,0,0,1,0,0,0),
(@GUID+7,33214,603,3,1,28830,0,247.584,-99.4169,505.59,1.7192,150,50,0,6000,0,0,1,0,0,0),
(@GUID+8,33214,603,3,1,28830,0,247.584,-99.4169,505.59,1.7192,150,50,0,6000,0,0,1,0,0,0),
(@GUID+9,33214,603,3,1,28830,0,301.55,-57.969,483.79,1.78596,150,50,0,6000,0,0,1,0,0,0),
(@GUID+10,33214,603,3,1,28830,0,306.495,-80.5966,483.264,1.4718,150,50,0,6000,0,0,1,0,0,0),
(@GUID+11,33214,603,3,1,28830,0,304.458,-101.109,475.529,1.4718,150,50,0,6000,0,0,1,0,0,0),
(@GUID+12,33214,603,3,1,28830,0,270.451,-104.592,499.689,0.102063,150,50,0,6000,0,0,1,0,0,0),
(@GUID+13,33214,603,3,1,28830,0,251.8,-105.335,478.027,5.88809,150,50,0,6000,0,0,1,0,0,0),
(@GUID+14,33214,603,3,1,28830,0,224.617,-81.7132,503.64,5.4844,150,50,0,6000,0,0,1,0,0,0),
(@GUID+15,33214,603,3,1,28830,0,213.795,-54.9709,504.995,4.03141,150,50,0,6000,0,0,1,0,0,0),
(@GUID+16,33214,603,3,1,28830,0,215.664,-26.3504,501.716,4.64716,150,50,0,6000,0,0,1,0,0,0),
(@GUID+17,33214,603,3,1,28830,0,225.759,5.35536,485.904,4.29373,150,50,0,6000,0,0,1,0,0,0),
(@GUID+18,33214,603,3,1,28830,0,249.131,41.0152,496.479,3.08343,150,50,0,6000,0,0,1,0,0,0),
(@GUID+19,33214,603,3,1,28830,0,275.488,37.3128,515.305,1.36812,150,50,0,6000,0,0,1,0,0,0),
(@GUID+20,33214,603,3,1,28830,0,267.019,7.84005,520.192,0.844262,150,50,0,6000,0,0,1,0,0,0),
(@GUID+21,33214,603,3,1,28830,0,249.233,-12.4071,490.774,1.71291,150,50,0,6000,0,0,1,0,0,0),
(@GUID+22,33214,603,3,1,28830,0,263.001,-52.8104,502.854,2.99547,150,50,0,6000,0,0,1,0,0,0),
(@GUID+23,33214,603,3,1,28830,0,281.722,-52.1936,493.548,4.59847,150,50,0,6000,0,0,1,0,0,0),
(@GUID+24,33214,603,3,1,28830,0,293.089,-7.94317,526.191,4.24739,150,50,0,6000,0,0,1,0,0,0),
(@GUID+25,33214,603,3,1,28830,0,297.864,8.30275,512.314,4.09188,150,50,0,6000,0,0,1,0,0,0),
(@GUID+26,33214,603,3,1,28830,0,216.331,-13.3252,518.529,1.72783,150,50,0,6000,0,0,1,0,0,0),
(@GUID+27,33214,603,3,1,28830,0,216.235,-58.6133,499.739,1.24324,150,50,0,6000,0,0,1,0,0,0),
(@GUID+28,33214,603,3,1,28830,0,208.362,-81.7844,497.082,1.03275,150,50,0,6000,0,0,1,0,0,0),
(@GUID+29,33214,603,3,1,28830,0,208.04,-82.3793,504.421,4.30629,150,50,0,6000,0,0,1,0,0,0),
(@GUID+30,33214,603,3,1,28830,0,219.582,-55.5374,518.925,4.30629,150,50,0,6000,0,0,1,0,0,0),
(@GUID+31,33214,603,3,1,28830,0,251.518,-11.8081,489.351,3.967,150,50,0,6000,0,0,1,0,0,0),
(@GUID+32,33214,603,3,1,28830,0,284.764,24.211,484.056,3.967,150,50,0,6000,0,0,1,0,0,0),
(@GUID+33,33214,603,3,1,28830,0,297.267,37.7566,493.207,3.43293,150,50,0,6000,0,0,1,0,0,0),
(@GUID+34,33214,603,3,1,28830,0,327.535,46.8332,489.191,1.64851,150,50,0,6000,0,0,1,0,0,0),
(@GUID+35,33214,603,3,1,28830,0,329.676,19.342,483.714,1.33435,150,50,0,6000,0,0,1,0,0,0),
(@GUID+36,33214,603,3,1,28830,0,321.882,-13.0024,487.786,1.33435,150,50,0,6000,0,0,1,0,0,0),
(@GUID+37,33214,603,3,1,28830,0,314.911,-41.9326,470.413,1.33435,150,50,0,6000,0,0,1,0,0,0),
(@GUID+38,33214,603,3,1,28830,0,309.555,-68.1847,483.734,1.79302,150,50,0,6000,0,0,1,0,0,0),
(@GUID+39,33214,603,3,1,28830,0,315.657,-95.1902,480.442,5.51266,150,50,0,6000,0,0,1,0,0,0),
(@GUID+40,33214,603,3,1,28830,0,278.184,-92.9812,502.851,5.22992,150,50,0,6000,0,0,1,0,0,0),
(@GUID+41,33214,603,3,1,28830,0,267.19,-57.6797,506.398,5.0053,150,50,0,6000,0,0,1,0,0,0),
(@GUID+42,33214,603,3,1,28830,0,261.269,-25.9536,505.211,4.70606,150,50,0,6000,0,0,1,0,0,0),
(@GUID+43,33214,603,3,1,28830,0,256.682,2.12704,507.823,5.01708,150,50,0,6000,0,0,1,0,0,0),
(@GUID+44,33214,603,3,1,28830,0,242.466,31.8077,493.654,6.13941,150,50,0,6000,0,0,1,0,0,0),
(@GUID+45,33214,603,3,1,28830,0,212.067,36.2086,491.848,1.2668,150,50,0,6000,0,0,1,0,0,0),
(@GUID+46,33214,603,3,1,28830,0,203.205,7.95895,494.388,1.2668,150,50,0,6000,0,0,1,0,0,0),
(@GUID+47,33214,603,3,1,28830,0,195.024,-18.1174,471.059,1.2668,150,50,0,6000,0,0,1,0,0,0),
(@GUID+48,33214,603,3,1,28830,0,182.525,-57.9608,491.788,1.2668,150,50,0,6000,0,0,1,0,0,0),
(@GUID+49,33214,603,3,1,28830,0,182.525,-57.9608,470.788,1.52756,150,50,0,6000,0,0,1,0,0,0),
(@GUID+50,33214,603,3,1,28830,0,181.154,-89.6438,471.985,1.52756,150,50,0,6000,0,0,1,0,0,0),
(@GUID+51,33214,603,3,1,28830,0,189.521,-115.227,485.493,4.3385,150,50,0,6000,0,0,1,0,0,0),
(@GUID+52,33214,603,3,1,28830,0,204.773,-76.3535,506.222,4.3385,150,50,0,6000,0,0,1,0,0,0),
(@GUID+53,33214,603,3,1,28830,0,217.066,-45.0197,500.71,4.3385,150,50,0,6000,0,0,1,0,0,0),
(@GUID+54,33214,603,3,1,28830,0,233.844,-2.25781,511.069,4.3385,150,50,0,6000,0,0,1,0,0,0),
(@GUID+55,33214,603,3,1,28830,0,238.768,10.2939,499.838,5.27155,150,50,0,6000,0,0,1,0,0,0),
(@GUID+56,33214,603,3,1,28830,0,226.158,28.0768,493.037,2.10954,150,50,0,6000,0,0,1,0,0,0),
(@GUID+57,33214,603,3,1,28830,0,241.149,2.99724,507.541,2.10954,150,50,0,6000,0,0,1,0,0,0),
(@GUID+58,33214,603,3,1,28830,0,250.151,-32.0961,504.084,1.53148,150,50,0,6000,0,0,1,0,0,0),
(@GUID+59,33214,603,3,1,28830,0,250.151,-32.0961,490.084,1.53148,150,50,0,6000,0,0,1,0,0,0),
(@GUID+60,33214,603,3,1,28830,0,255.478,-64.6037,502.022,1.96267,150,50,0,6000,0,0,1,0,0,0),
(@GUID+61,33214,603,3,1,28830,0,264.752,-78.7968,500.556,3.62614,150,50,0,6000,0,0,1,0,0,0),
(@GUID+62,33214,603,3,1,28830,0,283.89,-68.7223,496.885,4.88278,150,50,0,6000,0,0,1,0,0,0),
(@GUID+63,33214,603,3,1,28830,0,270.921,6.65616,500.337,4.88278,150,50,0,6000,0,0,1,0,0,0),
(@GUID+64,33214,603,3,1,28830,0,266.205,34.0651,492.053,4.67229,150,50,0,6000,0,0,1,0,0,0);

UPDATE `creature_template` SET `ScriptName`='mob_rune_of_power' WHERE `entry`=33705;

-- Heart of Magic
UPDATE `gameobject_template` SET `data15`=1 WHERE `entry` IN (194158,194159);

SET @GUID := 302683;

DELETE FROM `creature` WHERE `id` IN (33956,33957);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33956','603','1','1','0','0','1444.86','112.472','423.641','2.71061','300','0','0','75600','0','0','0','0','0','0'),
(@GUID+1,'33957','603','2','1','0','0','1443.35','123.526','423.641','3.67446','300','0','0','75600','0','0','0','0','0','0');

UPDATE `quest_template` SET `PrevQuestId`=13604 WHERE `entry`=13607;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `entry`=13606;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `entry`=13609;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `entry`=13610;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `entry`=13611;

UPDATE `quest_template` SET `PrevQuestId`=13817 WHERE `entry`=13816;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `entry`=13821;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `entry`=13822;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `entry`=13823;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `entry`=13824;

SET @GUID := 302685;

DELETE FROM `creature` WHERE `id`=33089;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33089','603','3','16','0','0','1607.99','-289.992','417.321','5.89086','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+1,'33089','603','3','16','0','0','1620.23','-280.533','417.321','5.6097','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+2,'33089','603','3','16','0','0','1638.33','-278.895','417.321','4.49364','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+3,'33089','603','3','16','0','0','1654.22','-288.583','417.321','4.0656','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+4,'33089','603','3','16','0','0','1661.51','-309.099','417.321','4.28944','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+5,'33089','603','3','16','0','0','1653.98','-327.001','417.321','3.5598','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+6,'33089','603','3','16','0','0','1640.12','-336.194','417.321','1.68663','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+7,'33089','603','3','16','0','0','1621.68','-333.91','417.321','2.40134','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+8,'33089','603','3','16','0','0','1605.45','-320.182','417.321','0.444129','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+9,'33089','603','3','16','0','0','1602.23','-303.377','417.321','6.13041','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+10,'33089','603','3','16','0','0','1617.7','-309.616','417.321','0.204581','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+11,'33089','603','3','16','0','0','1623.68','-295.429','417.321','5.30967','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+12,'33089','603','3','16','0','0','1641.17','-296.46','417.321','4.12137','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+13,'33089','603','3','16','0','0','1644.9','-313.288','417.321','2.7587','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+14,'33089','603','3','16','0','0','1630.54','-319.732','417.321','1.53034','10','10','0','37800','0','0','1','0','0','0'),
(@GUID+15,'33089','603','3','16','0','0','1633.07','-306.294','417.321','1.53505','10','10','0','37800','0','0','1','0','0','0');

UPDATE `creature_template` SET `dmg_multiplier`=4 WHERE `entry`=33089;
UPDATE `creature_template` SET `dmg_multiplier`=7 WHERE `entry`=34221;
UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=34097;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=34222;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62168,64417);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62168, 'spell_algalon_phased'),
(64417, 'spell_algalon_phased');

-- condition for Glyph of Shadow triggered (only in Shadowform)
DELETE FROM `conditions` WHERE `SourceEntry` IN (61792);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `Comment`) VALUES
  (17,61792,1,15473,'Glyph of Shadow triggered - Shadowform');
