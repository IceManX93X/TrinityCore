DELETE FROM `spell_proc_event` WHERE `entry`=65007;
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(65007,0,0,0,0,0,0x00014000,0x00010000,0,0,0);

SET @NEW_REF_ENTRY  :=70000;    -- use free Reference ID
DELETE FROM `creature_loot_template` WHERE `item` IN (45656,45657,45658);
DELETE FROM `creature_loot_template` WHERE `entry`=33955 AND `mincountOrRef`=-@NEW_REF_ENTRY;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(33955,4,100,1,0,-@NEW_REF_ENTRY,2);
DELETE FROM `reference_loot_template` WHERE `entry`=@NEW_REF_ENTRY;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(@NEW_REF_ENTRY,45656,0,1,1,1,1),
(@NEW_REF_ENTRY,45657,0,1,1,1,1),
(@NEW_REF_ENTRY,45658,0,1,1,1,1);
DELETE FROM `item_template` WHERE `entry` IN (51804,51805,51806,51807,51808);
INSERT INTO `item_template` (`entry`,`class`,`subclass`,`unk0`,`name`,`displayid`,`Quality`,`Flags`,`FlagsExtra`,`BuyCount`,`BuyPrice`,`SellPrice`,`InventoryType`,`AllowableClass`,`AllowableRace`,`ItemLevel`,`RequiredLevel`,`RequiredSkill`,`RequiredSkillRank`,`requiredspell`,`requiredhonorrank`,`RequiredCityRank`,`RequiredReputationFaction`,`RequiredReputationRank`,`maxcount`,`stackable`,`ContainerSlots`,`StatsCount`,`stat_type1`,`stat_value1`,`stat_type2`,`stat_value2`,`stat_type3`,`stat_value3`,`stat_type4`,`stat_value4`,`stat_type5`,`stat_value5`,`stat_type6`,`stat_value6`,`stat_type7`,`stat_value7`,`stat_type8`,`stat_value8`,`stat_type9`,`stat_value9`,`stat_type10`,`stat_value10`,`ScalingStatDistribution`,`ScalingStatValue`,`dmg_min1`,`dmg_max1`,`dmg_type1`,`dmg_min2`,`dmg_max2`,`dmg_type2`,`armor`,`holy_res`,`fire_res`,`nature_res`,`frost_res`,`shadow_res`,`arcane_res`,`delay`,`ammo_type`,`RangedModRange`,`spellid_1`,`spelltrigger_1`,`spellcharges_1`,`spellppmRate_1`,`spellcooldown_1`,`spellcategory_1`,`spellcategorycooldown_1`,`spellid_2`,`spelltrigger_2`,`spellcharges_2`,`spellppmRate_2`,`spellcooldown_2`,`spellcategory_2`,`spellcategorycooldown_2`,`spellid_3`,`spelltrigger_3`,`spellcharges_3`,`spellppmRate_3`,`spellcooldown_3`,`spellcategory_3`,`spellcategorycooldown_3`,`spellid_4`,`spelltrigger_4`,`spellcharges_4`,`spellppmRate_4`,`spellcooldown_4`,`spellcategory_4`,`spellcategorycooldown_4`,`spellid_5`,`spelltrigger_5`,`spellcharges_5`,`spellppmRate_5`,`spellcooldown_5`,`spellcategory_5`,`spellcategorycooldown_5`,`bonding`,`description`,`PageText`,`LanguageID`,`PageMaterial`,`startquest`,`lockid`,`Material`,`sheath`,`RandomProperty`,`RandomSuffix`,`block`,`itemset`,`MaxDurability`,`area`,`Map`,`BagFamily`,`TotemCategory`,`socketColor_1`,`socketContent_1`,`socketColor_2`,`socketContent_2`,`socketColor_3`,`socketContent_3`,`socketBonus`,`GemProperties`,`RequiredDisenchantSkill`,`ArmorDamageModifier`,`Duration`,`ItemLimitCategory`,`HolidayId`,`ScriptName`,`DisenchantID`,`FoodType`,`minMoneyLoot`,`maxMoneyLoot`,`WDBVerified`) VALUES 
(51804,4,0,-1,'Winking Eye of Love',43423,4,0,0,1,320008,80002,2,32767,-1,226,80,0,0,0,0,0,0,0,0,1,0,5,45,74,7,63,5,43,32,41,43,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,375,0,0,0,0,'',68,0,0,0,12340),
(51805,4,0,-1,'Heartbreak Charm',52417,4,0,0,1,320008,80002,2,-1,-1,226,80,0,0,0,0,0,0,0,0,1,0,5,45,74,7,63,5,43,6,41,36,42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,375,0,0,0,0,'',68,0,0,0,12340),
(51806,4,0,-1,'Shard of Pirouetting Happiness',9854,4,0,0,1,320008,80002,2,32767,-1,226,80,0,0,0,0,0,0,0,0,1,0,5,4,42,7,94,12,41,13,43,31,42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,375,0,0,0,0,'',68,0,0,0,12340),
(51807,4,0,-1,'Sweet Perfume Broach',45351,4,0,0,1,320008,80002,2,-1,-1,226,80,0,0,0,0,0,0,0,0,1,0,5,38,84,3,63,7,69,32,36,44,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,375,0,0,0,0,'',68,0,0,0,12340),
(51808,4,0,-1,'Choker of the Pure Heart',54999,4,0,0,1,320008,80002,2,-1,-1,226,80,0,0,0,0,0,0,0,0,1,0,4,4,65,7,93,32,36,31,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,-1,0,-1,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,375,0,0,0,0,'',68,0,0,0,12340);
-- Fix Spell 56684 for Quest 13045

DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17 AND SourceEntry = 56684;

INSERT INTO conditions VALUES
(17,0,56684,0,30,192522,10,0,0,'',''),
(17,0,56684,0,29,30407,10,0,0,'','');

SET @GO_GUID := 400030;

-- unify money reward
UPDATE `quest_template` SET `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry` IN (11750,11775,11801);

#################################
## Desecration of the Alliance ##
#################################
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (11581,11732) OR `entry` BETWEEN 11734 AND 11763;
UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry` IN (187564,187914,187916,187917) OR `entry` BETWEEN 187919 AND 187946;

-- questrelations
DELETE FROM `gameobject_questrelation` WHERE `quest` IN (11581,11732) OR `quest` BETWEEN 11734 AND 11763;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
## outland
(187919,11736), -- blades edge
(187933,11750), -- nagrand
(187935,11752), -- shadowmoon
(187941,11758), -- nagrand
(187930,11747), -- hellfire
(187942,11759), -- netherstorm
(187937,11754), -- terokkar
## kalimdor
(187916,11734), -- ashenvale
(187921,11738), -- bloodmyst
(187924,11741), -- desolace
(187929,11746), -- feralas
(187936,11753), -- teldrassil
(187917,11735), -- azuremyst
(187923,11740), -- darkshore
(187927,11744), -- dustwallow marsh
(187943,11760), -- silithus
(187945,11762), -- tanaris
(187946,11763), -- winterspring
## eastern kingdoms
(187914,11732), -- arathi highlands
(187922,11739), -- burning steppes
(187926,11743), -- duskwood
(187931,11748), -- hillsbrad foothills
(187934,11751), -- redridge mountains
(187938,11755), -- hinterlands
(187939,11756), -- western plaguelands
(187920,11737), -- blasted lands
(187925,11742), -- dun morogh
(187928,11745), -- elwynn forest
(187932,11749), -- loch modan
(187944,11761), -- stranglethorn vale
(187940,11757), -- wetlands
(187564,11581); -- westfall

-- involvedrelations
DELETE FROM `gameobject_involvedrelation` WHERE `quest` IN (11581,11732) OR `quest` BETWEEN 11734 AND 11763;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
## outland
(187919,11736), -- blades edge
(187933,11750), -- nagrand
(187935,11752), -- shadowmoon
(187941,11758), -- nagrand
(187930,11747), -- hellfire
(187942,11759), -- netherstorm
(187937,11754), -- terokkar
## kalimdor
(187916,11734), -- ashenvale
(187921,11738), -- bloodmyst
(187924,11741), -- desolace
(187929,11746), -- feralas
(187936,11753), -- teldrassil
(187917,11735), -- azuremyst
(187923,11740), -- darkshore
(187927,11744), -- dustwallow marsh
(187943,11760), -- silithus
(187945,11762), -- tanaris
(187946,11763), -- winterspring
## eastern kingdoms
(187914,11732), -- arathi highlands
(187922,11739), -- burning steppes
(187926,11743), -- duskwood
(187931,11748), -- hillsbrad foothills
(187934,11751), -- redridge mountains
(187938,11755), -- hinterlands
(187939,11756), -- western plaguelands
(187920,11737), -- blasted lands
(187925,11742), -- dun morogh
(187928,11745), -- elwynn forest
(187932,11749), -- loch modan
(187944,11761), -- stranglethorn vale
(187940,11757), -- wetlands
(187564,11581); -- westfall

-- spawn missing bonfires
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+10;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID,'187917','530','1','1','-4198.8','-12342.4','1.06331','3.02457','0','0','0.998289','0.0584759','300','0','1'),
(@GO_GUID+1,'187919','530','1','1','2018.58','6595.76','135.845','0.275927','0','0','0.137526','0.990498','300','0','1'),
(@GO_GUID+2,'187921','530','1','1','-2175.9','-11893.9','31.9622','2.47871','0','0','0.945575','0.325405','300','0','1'),
(@GO_GUID+3,'187922','0','1','1','-8242.57','-2614.57','133.156','1.50279','0','0','0.682657','0.730739','300','0','1'),
(@GO_GUID+4,'187929','1','1','1','-4388.91','3472.16','9.49197','5.45912','0','0','0.400472','-0.916309','300','0','1'),
(@GO_GUID+5,'187933','530','1','1','-2479.67','7545.61','-2.24268','2.5887','0','0','0.962032','0.272938','300','0','1'),
(@GO_GUID+6,'187935','530','1','1','-3891.67','2024.15','95.4382','2.44804','0','0','0.940473','0.339868','300','0','1'),
(@GO_GUID+7,'187937','530','1','1','-2992.52','4154.9','5.83402','2.25743','0','0','0.903863','0.427822','300','0','1'),
(@GO_GUID+8,'187939','0','1','1','995.013','-1447.26','62.0325','5.03694','0','0','0.583575','-0.812059','300','0','1'),
(@GO_GUID+9,'187941','530','1','1','187.533','6029.76','21.9231','0.934652','0','0','0.450501','0.892776','300','0','1'),
(@GO_GUID+10,'187942','530','1','1','3113.01','3706.52','144.327','5.96213','0','0','0.159837','-0.987143','300','0','1');

-- bonfire event relation
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+10;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID),
(1,@GO_GUID+1),
(1,@GO_GUID+2),
(1,@GO_GUID+3),
(1,@GO_GUID+4),
(1,@GO_GUID+5),
(1,@GO_GUID+6),
(1,@GO_GUID+7),
(1,@GO_GUID+8),
(1,@GO_GUID+9),
(1,@GO_GUID+10);

##############################
## Desecration of the Horde ##
##############################
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry`=11580 OR `entry` BETWEEN 11764 AND 11787 OR `entry` BETWEEN 11799 AND 11803;
UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=187559 OR `entry` BETWEEN 187947 AND 187975;

-- questrelations
DELETE FROM `gameobject_questrelation` WHERE `quest`=11580 OR `quest` BETWEEN 11764 AND 11787 OR `quest` BETWEEN 11799 AND 11803;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
## outland
(187955,11767), -- blades edge
(187966,11778), -- nagrand
(187967,11779), -- shadowmoon
(187975,11787), -- zangarmarsh
(187963,11775), -- hellfire
(187949,11799), -- netherstorm
(187970,11782), -- terokkar
## kalimdor
(187948,11765), -- ashenvale
(187958,11770), -- durotar
(187957,11769), -- desolace
(187961,11773), -- feralas
(187971,11783), -- the barrens
(187968,11780), -- stonetalon mountains
(187965,11777), -- mulgore
(187959,11771), -- dustwallow marsh
(187950,11800), -- silithus
(187952,11802), -- tanaris
(187953,11803), -- winterspring
(187973,11785), -- thousand needles
## eastern kingdoms
(187954,11766), -- badlands
(187960,11772), -- eversong woods
(187964,11776), -- hillsbrad foothills
(187951,11801), -- stranglethorn vale
(187972,11784), -- hinterlands
(187947,11764), -- arathi highlands
(187956,11768), -- burning steppes
(187962,11774), -- ghostlands
(187559,11580), -- silverpine forest
(187969,11781), -- swamp of sorrows
(187974,11786); -- tirisfal glades

-- involvedrelations
DELETE FROM `gameobject_involvedrelation` WHERE `quest`=11580 OR `quest` BETWEEN 11764 AND 11787 OR `quest` BETWEEN 11799 AND 11803;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
## outland
(187955,11767), -- blades edge
(187966,11778), -- nagrand
(187967,11779), -- shadowmoon
(187975,11787), -- zangarmarsh
(187963,11775), -- hellfire
(187949,11799), -- netherstorm
(187970,11782), -- terokkar
## kalimdor
(187948,11765), -- ashenvale
(187958,11770), -- durotar
(187957,11769), -- desolace
(187961,11773), -- feralas
(187971,11783), -- the barrens
(187968,11780), -- stonetalon mountains
(187965,11777), -- mulgore
(187959,11771), -- dustwallow marsh
(187950,11800), -- silithus
(187952,11802), -- tanaris
(187953,11803), -- winterspring
(187973,11785), -- thousand needles
## eastern kingdoms
(187954,11766), -- badlands
(187960,11772), -- eversong woods
(187964,11776), -- hillsbrad foothills
(187951,11801), -- stranglethorn vale
(187972,11784), -- hinterlands
(187947,11764), -- arathi highlands
(187956,11768), -- burning steppes
(187962,11774), -- ghostlands
(187559,11580), -- silverpine forest
(187969,11781), -- swamp of sorrows
(187974,11786); -- tirisfal glades

-- spawn missing bonfires
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID+11 AND @GO_GUID+14;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID+11,'187949','530','1','1','2934.58','3702.37','143.256','2.53231','0','0','0.953954','0.299953','300','0','1'),
(@GO_GUID+12,'187955','530','1','1','2293.19','6130.84','135.623','2.1334','0','0','0.875611','0.483017','300','0','1'),
(@GO_GUID+13,'187965','1','1','1','-2333.04','-621.359','-7.8616','6.19349','0','0','0.0448345','-0.998994','300','0','1'),
(@GO_GUID+14,'187967','530','1','1','-3088.93','2433.26','62.9845','5.67602','0','0','0.298941','-0.954272','300','0','1');

-- bonfire event relation
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID+11 AND @GO_GUID+14;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID+11),
(1,@GO_GUID+12),
(1,@GO_GUID+13),
(1,@GO_GUID+14);

-- fix achievement #271
UPDATE `spell_dbc` SET `Effect1`=64, `EffectImplicitTargetA1`=1, `Comment`='Ribbon Pole - Trigger Ribbon Pole Channel' WHERE `Id`=29710;

-- Ice Chest - modify loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=28682 AND `item`=54806;

-- Satchel of Chilled Goods - loot
DELETE FROM `item_loot_template` WHERE `entry`=54536;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- Emblems
('54536','40753','100','1','0','2','2'),
-- Ice Chip
('54536','53641','5','1','0','1','1'),
-- Frostscythe of Lord Ahune
('54536','54806','10','1','0','1','1'),
-- Burning Blossom
('54536','23247','100','1','0','5','15');

-- Ice Stone gossip menu
DELETE FROM `gossip_menu` WHERE `entry`=11389;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(11389,15864);

-- root Frozen Core
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|4 WHERE `entry`=25865;

-- cleanup quest relations
DELETE FROM `creature_questrelation` WHERE `quest`=11691;
DELETE FROM `gameobject_involvedrelation` WHERE `quest`=11691;

-- Ulduar Proc Trinket's
DELETE FROM `spell_proc_event` WHERE `entry` IN (65002,64738,64742,64714,65005,64792,65013,65025,64786,65020,64764);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(65002,0,0,0,0,0,0x00055400,0,0,0,45),          -- Sif's Remembrance
(64738,0,0,0,0,0,0x00055400,0,0,0,45),          -- Show of Faith
(64742,0,0,0,0,0,0x00055400,0,0,0,45),          -- Pandora's Plea
(64714,0,0,0,0,0,0x00010000,0x0040000,0,0,45),  -- Flare of the Heavens
(65005,0,0,0,0,0,0x00010000,0x0040000,0,0,45),  -- Elemental Focus Stone
(64792,0,0,0,0,0,0x00000154,0x0000002,0,0,45),  -- Blood of the old God
(65013,0,0,0,0,0,0x00000154,0x0000002,0,0,45),  -- Pyrite Infuser
(65025,0,0,0,0,0,0x00000154,0,0,0,45),          -- Dark Matter
(64786,0,0,0,0,0,0x00000154,0,0,0,45),          -- Comet's Trail
(65020,0,0,0,0,0,0x00000154,0,0,0,45),          -- Mjolnir Runestone 
(64764,0,0,0,0,0,0x00100000,0,0,0,45);          -- The General's Heart

UPDATE `creature_template` SET `ScriptName`='npc_rhonin' WHERE `entry`=16128;

-- Arcane Barrage
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=56397;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(56397,63934,1, 'Arcane Barrage - Arcane Barrage Damage');

-- Heart of Magic (custom)
DELETE FROM `creature_loot_template` WHERE `entry`=32448;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('32448','44650','-100','1','0','1','1'),
('32448','44651','-100','2','0','1','1');

UPDATE `creature_template` SET `lootid`=32448 WHERE `entry`=32448;

UPDATE `spell_script_names` SET `ScriptName`='spell_elder_ironbranchs_essence_targeting' WHERE `spell_id`=62713;
UPDATE `spell_script_names` SET `ScriptName`='spell_elder_brightleafs_essence_targeting' WHERE `spell_id` IN (62968,65761);

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask` &~ 16384 WHERE `entry` IN (33890,33954);
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
SET @Rare       :=  5;
SET @Green      := 10;
SET @Grey       :=100;
SET @Consume    := 25;
SET @Frostweave :=100;
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

UPDATE `creature_template` SET `ScriptName`='npc_generic_oracle_treasure_seeker' WHERE `entry`=28120;

/* Reduce Ominous Cloud Amount in Yogg-Saron Encounter */
SET @npc_ominous_cloud = 33292;

/* Delete second "block" of spawns (see GUIDs in backup)

Backup of Original Clouds:
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
 (136048, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1956.64, -8.79929, 327.361, 1.03427, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136049, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1972.02, -65.7261, 329.656, 2.82256, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136050, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 2013.82, -69.3169, 331.424, 3.84924, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136051, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1996.72, -43.7548, 326.169, 0.745018, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136052, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1985.88, -37.8674, 326.211, 3.36129, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136053, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1994.83, 21.4201, 330.75, 2.85425, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
  -- second block
 (137532, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1939.31, -14.8254, 330.024, 4.55329, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137533, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 2010.12, 2.20614, 329.767, 5.43627, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137534, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1995.04, -22.2426, 326.203, 4.86913, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137535, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1991.56, -57.7423, 328.258, 3.47212, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137536, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1964.52, -12.9372, 326.334, 4.11093, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137537, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 2028, -50.5019, 331.014, 4.25514, 180, 5, 0, 12600, 0, 1, 0, 0, 0);

Actual Deletion:
*/
DELETE FROM `creature` WHERE (`guid` BETWEEN 137532 AND 137537) AND `id` = @npc_ominous_cloud;

-- Change spawndist for greater moving area as there are now much less clouds and would be too easy now
UPDATE `creature` SET spawndist = 15 WHERE `id` = @npc_ominous_cloud;
-- fix purchasing Dual Spec for 0g
UPDATE `gossip_menu_option` SET
    `option_text`   = "Purchase a Dual Talent Specialization",
    `box_money`     = 10000000,
    `box_text`      = "Are you sure you wish to purchase a Dual Talent Specialization?"
WHERE option_id = 18;
