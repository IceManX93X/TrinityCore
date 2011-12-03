DELETE FROM `spell_script_names` WHERE `spell_id` IN (67590,67602,67603,67604,65684,67176,67177,67178,65686,67222,67223,67224);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(67590, 'spell_powering_up'),
(67602, 'spell_powering_up'),
(67603, 'spell_powering_up'),
(67604, 'spell_powering_up'),
(65684, 'spell_valkyr_essences'),
(67176, 'spell_valkyr_essences'),
(67177, 'spell_valkyr_essences'),
(67178, 'spell_valkyr_essences'),
(67222, 'spell_valkyr_essences'),
(65686, 'spell_valkyr_essences'),
(67223, 'spell_valkyr_essences'),
(67224, 'spell_valkyr_essences');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `ConditionTypeOrReference` = 18 AND `SourceEntry` IN (65875,67303,67304,67305,65876,67306,67307,67308) ;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 65875, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 67303, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 67304, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 67305, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 65876, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light'),
(13, 0, 67306, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light'),
(13, 0, 67307, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light'),
(13, 0, 67308, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (65879,65916,67244,67245,67246,67248,67249,67250);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65879, 'spell_power_of_the_twins'),
(65916, 'spell_power_of_the_twins'),
(67244, 'spell_power_of_the_twins'),
(67245, 'spell_power_of_the_twins'),
(67246, 'spell_power_of_the_twins'),
(67248, 'spell_power_of_the_twins'),
(67249, 'spell_power_of_the_twins'),
(67250, 'spell_power_of_the_twins');

UPDATE `creature_template` SET `ScriptName`='npc_vereth_the_cunning' WHERE `entry`=30944;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry` in(31770,31736);
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`npcflag`=`npcflag`|0x1000000,`VehicleId`=282,`spell1`=59643,`spell2`=4342,`spell3`=4336 WHERE `entry`=31785;
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`npcflag`=`npcflag`|0x1000000,`VehicleId`=282,`spell1`=4338,`spell2`=4342,`spell3`=4336 WHERE `entry`=31784;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` in (31785,31770,31736,31784);
INSERT INTO `npc_spellclick_spells` VALUES
(31785,59656,13283,1,13283,1,0,0,0),
(31770,59654,0,0,0,1,0,0,0),
(31736,59592,13280,1,13280,1,0,0,0),
(31784,59593,0,0,0,1,0,0,0);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (59643,4338);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(59643, 'spell_q13280_13283_plant_battle_standard'),
(4338, 'spell_q13280_13283_plant_battle_standard');
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1293 AND `id`=1; 
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1293 AND `id`=2;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1293,1,0, 'Make this inn my home!',8,66179,0,0,0,0,NULL),
(1293,2,1, 'I want to browse your goods!',3,66179,0,0,0,0,NULL);
-- ----------
-- Tank Class Passive Threat
-- ----------
DELETE FROM spell_linked_spell WHERE spell_effect IN (57340, 57339);
INSERT INTO spell_linked_spell VALUES
    (7376,  57339, 2, 'Defensive Stance Passive - Tank Class Passive Threat'),
    (21178, 57339, 2, 'Bear Form (Passive2) - Tank Class Passive Threat'),
    (25780, 57340, 2, 'Righteous Fury - Tank Class Passive Threat'),
    (48263, 57340, 2, 'Frost Presence - Tank Class Passive Threat');

-- ----------
-- restructure spell_threat
-- ----------
TRUNCATE TABLE `spell_threat`;
ALTER    TABLE `spell_threat` CHANGE `Threat` `flatMod` int(6);
ALTER    TABLE `spell_threat` ADD COLUMN `pctMod`   FLOAT NOT NULL DEFAULT 1.0 COMMENT 'threat multiplier for damage/healing' AFTER `flatMod`;
ALTER    TABLE `spell_threat` ADD COLUMN `apPctMod` FLOAT NOT NULL DEFAULT 0.0 COMMENT 'additional threat bonus from attack power' AFTER `pctMod`;
INSERT INTO `spell_threat` VALUES
-- Other
-- Src: SELECT id, SpellNameEN, RankEN FROM `Spell` WHERE `DescriptionEN` LIKE '%threat%' AND `SpellFamilyName` <> '0' AND NOT (Attributes & 0x40) GROUP BY SpellNameEN ORDER BY RankEN DESC;
    (5676,  0,   2.00, 0.0),  -- Searing Pain (Rank 1) (Warlock)
    (28176, 0,   0.00, 0.0),  -- Fel Armor - Heal (Rank 1) (Warlock) [Assumption]
    (8056,  0,   2.00, 0.0),  -- Frost Shock (Rank 1) (Shaman) [Assumption]
    (26688, 0,   0.00, 0.0),  -- Anesthetic Poison - Proc (Rank 1) (Rogue)
    (15237, 0,   0.00, 0.0),  -- Holy Nova - Heal (Rank 1) (Priest)
    (23455, 0,   0.00, 0.0),  -- Holy Nova - Damage (Rank 1) (Priest)
    (32546, 0,   0.50, 0.0),  -- Binding Heal (Rank 1) (Priest) [Assumption]
    (33619, 0,   0.00, 0.0),  -- Reflective Shield - Proc (Priest)
    (2139,  180, 1.00, 0.0),  -- Counterspell (Mage) [Assumption]
-- Death Knight
-- Src: http://www.tankspot.com/showthread.php?40485-Death-Knight-threat-values&p=113584#post113584
    (63611, 0,   0.00, 0.0),  -- Blood Presence - Heal
    (45524, 240, 1.00, 0.0),  -- Chains of Ice
    (43265, 0,   1.90, 0.0),  -- Death and Decay
    (49576, 110, 1.00, 0.0),  -- Death Grip
    (48743, 0,   0.00, 0.0),  -- Death Pact
    (65142, 0,   0.00, 0.0),  -- Ebon Plague
    (47568, 0,   0.00, 0.0),  -- Empower Rune Weapon
    (51209, 112, 1.00, 0.0),  -- Hungering Cold
    (49039, 110, 1.00, 0.0),  -- Lichborn
    (56815, 0,   1.75, 0.0),  -- Rune Strike
    (50422, 0,   0.00, 0.0),  -- Scent of Blood - Proc
    (55090, 51,  1.00, 0.0),  -- Scourge Strike (Rank 1)
    (55265, 63,  1.00, 0.0),  -- Scourge Strike (Rank 2)
    (55270, 98,  1.00, 0.0),  -- Scourge Strike (Rank 3)
    (55271, 120, 1.00, 0.0),  -- Scourge Strike (Rank 4)
    (49916, 138, 1.00, 0.0),  -- Strangulate
    (50181, 0,   0.00, 0.0),  -- Vendetta - Proc
-- Druid
-- Src: http://www.tankspot.com/showthread.php?47813-WOTLK-Bear-Threat-Values&p=200948#post200948
    (17057, 0,   0.00, 0.0),  -- Furor - Proc 
    (5211,  53,  1.00, 0.0),  -- Bash (Rank 3)
    (6798,  105, 1.00, 0.0),  -- Bash (Rank 2)
    (8983,  158, 1.00, 0.0),  -- Bash (Rank 1)
    (45334, 40,  1.00, 0.0),  -- Feral Charge (Bear) - Root
    (19675, 80,  1.00, 0.0),  -- Feral Charge (Bear) - Interrupt
    (34299, 0,   0.00, 0.0),  -- Improved Leader of the Pack - Heal
    (6807,  13,  1.00, 0.0),  -- Maul (Rank 1)
    (6808,  20,  1.00, 0.0),  -- Maul (Rank 2)
    (6809,  27,  1.00, 0.0),  -- Maul (Rank 3)
    (8972,  47,  1.00, 0.0),  -- Maul (Rank 4)
    (9745,  75,  1.00, 0.0),  -- Maul (Rank 5)
    (9880,  106, 1.00, 0.0),  -- Maul (Rank 6)
    (9881,  140, 1.00, 0.0),  -- Maul (Rank 7)
    (26996, 212, 1.00, 0.0),  -- Maul (Rank 8)
    (48479, 345, 1.00, 0.0),  -- Maul (Rank 9)
    (48480, 422, 1.00, 0.0),  -- Maul (Rank 10)
    (60089, 638, 1.00, 0.0),  -- Faerie Fire (Feral) - Proc
    (33745, 182, 0.50, 0.0),  -- Lacerate (Rank 1)
    (48567, 409, 0.50, 0.0),  -- Lacerate (Rank 2)
    (48568, 515, 0.50, 0.0),  -- Lacerate (Rank 3)
    (779,   0,   1.50, 0.0),  -- Swipe (Bear) (Rank 1)
    (5209,  98,  1.00, 0.0),  -- Challenging Roar
    (29166, 0,   10.0, 0.0),  -- Innervate [base is 5 per 1 mana]
-- Paladin
-- Src: http://www.tankspot.com/showthread.php?39761-Paladin-Threat-Values-(Updated-for-3.2.2)&p=103813#post103813
    (7294,  0,   2.00, 0.0),  -- Retribution Aura
    (20185, 0,   0.00, 0.0),  -- Judgement of Light
    (19742, 0,   0.00, 0.0),  -- Blessing of Wisdom (Rank 1)
    (25894, 0,   0.00, 0.0),  -- Greater Blessing of Wisdom (Rank 1)
    (20470, 0,   0.00, 0.0),  -- Righteous Fury
    (498,   0,   0.00, 0.0),  -- Divine Protection
-- Warrior
-- Src: http://www.tankspot.com/showthread.php?39775-WoW-3.0-Threat-Values-(Warrior)&p=103972#post103972
    (845,   8,   1.00, 0.0),  -- Cleave (Rank 1)
    (7369,  15,  1.00, 0.0),  -- Cleave (Rank 2)
    (11608, 25,  1.00, 0.0),  -- Cleave (Rank 3)
    (11609, 35,  1.00, 0.0),  -- Cleave (Rank 4)
    (20569, 48,  1.00, 0.0),  -- Cleave (Rank 5)
    (25231, 68,  1.00, 0.0),  -- Cleave (Rank 6)
    (47519, 95,  1.00, 0.0),  -- Cleave (Rank 7)
    (47520, 112, 1.00, 0.0),  -- Cleave (Rank 8)
    (78,    5,   1.00, 0.0),  -- Heroic Strike (Rank 1)
    (284,   10,  1.00, 0.0),  -- Heroic Strike (Rank 2)
    (285,   16,  1.00, 0.0),  -- Heroic Strike (Rank 3)
    (1608,  22,  1.00, 0.0),  -- Heroic Strike (Rank 4)
    (11564, 31,  1.00, 0.0),  -- Heroic Strike (Rank 5)
    (11565, 48,  1.00, 0.0),  -- Heroic Strike (Rank 6)
    (11566, 70,  1.00, 0.0),  -- Heroic Strike (Rank 7)
    (11567, 92,  1.00, 0.0),  -- Heroic Strike (Rank 8)
    (25286, 104, 1.00, 0.0),  -- Heroic Strike (Rank 9)
    (29707, 121, 1.00, 0.0),  -- Heroic Strike (Rank 10)
    (30324, 164, 1.00, 0.0),  -- Heroic Strike (Rank 11)
    (47449, 224, 1.00, 0.0),  -- Heroic Strike (Rank 12)
    (47450, 259, 1.00, 0.0),  -- Heroic Strike (Rank 13)
    (57755, 0,   1.50, 0.0),  -- Heroic Throw
    (6572,  7,   1.00, 0.0),  -- Revenge (Rank 1)
    (6574,  11,  1.00, 0.0),  -- Revenge (Rank 2)
    (7379,  15,  1.00, 0.0),  -- Revenge (Rank 3)
    (11600, 27,  1.00, 0.0),  -- Revenge (Rank 4)
    (11601, 41,  1.00, 0.0),  -- Revenge (Rank 5)
    (25288, 53,  1.00, 0.0),  -- Revenge (Rank 6)
    (25269, 58,  1.00, 0.0),  -- Revenge (Rank 7)
    (30357, 71,  1.00, 0.0),  -- Revenge (Rank 8)
    (57823, 121, 1.00, 0.0),  -- Revenge (Rank 9)
    (23922, 228, 1.00, 0.0),  -- Shield Slam (Rank 1)
    (23923, 268, 1.00, 0.0),  -- Shield Slam (Rank 2)
    (23924, 307, 1.00, 0.0),  -- Shield Slam (Rank 3)
    (23925, 347, 1.00, 0.0),  -- Shield Slam (Rank 4)
    (25258, 387, 1.00, 0.0),  -- Shield Slam (Rank 5)
    (30356, 426, 1.00, 0.0),  -- Shield Slam (Rank 6)
    (47487, 650, 1.00, 0.0),  -- Shield Slam (Rank 7)
    (47488, 770, 1.00, 0.0),  -- Shield Slam (Rank 8)
    (1464,  18,  1.00, 0.0),  -- Slam (Rank 1)
    (8820,  24,  1.00, 0.0),  -- Slam (Rank 2)
    (11604, 38,  1.00, 0.0),  -- Slam (Rank 3)
    (11605, 49,  1.00, 0.0),  -- Slam (Rank 4)
    (25241, 59,  1.00, 0.0),  -- Slam (Rank 5)
    (25242, 78,  1.00, 0.0),  -- Slam (Rank 6)
    (47474, 123, 1.00, 0.0),  -- Slam (Rank 7)
    (47475, 140, 1.00, 0.0),  -- Slam (Rank 8)
    (7386,  345, 1.00, 0.05), -- Sunder Armor
    (20243, 0,   1.00, 0.05), -- Devastate (Rank 1)
    (6343,  0,   1.85, 0.0);  -- Thunder Clap (Rank 1)

DELETE FROM `disables` WHERE `entry` IN (1242, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1825, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1826, 3386, 3387, 3388, 3389) AND `sourceType` = 4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (1242, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1825, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1826, 3386, 3387, 3388, 3389);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(1242, 11, 0, 0, 'achievement_bg_av_perfection'),
(1803, 11, 0, 0, 'achievement_bg_av_perfection'),
(1804, 11, 0, 0, 'achievement_bg_av_perfection'),
(1805, 11, 0, 0, 'achievement_bg_av_perfection'),
(1806, 11, 0, 0, 'achievement_bg_av_perfection'),
(1807, 11, 0, 0, 'achievement_bg_av_perfection'),
(1808, 11, 0, 0, 'achievement_bg_av_perfection'),
(1809, 11, 0, 0, 'achievement_bg_av_perfection'),
(1810, 11, 0, 0, 'achievement_bg_av_perfection'),
(1825, 11, 0, 0, 'achievement_bg_av_perfection'),
(1811, 11, 0, 0, 'achievement_bg_av_perfection'),
(1812, 11, 0, 0, 'achievement_bg_av_perfection'),
(1813, 11, 0, 0, 'achievement_bg_av_perfection'),
(1814, 11, 0, 0, 'achievement_bg_av_perfection'),
(1815, 11, 0, 0, 'achievement_bg_av_perfection'),
(1816, 11, 0, 0, 'achievement_bg_av_perfection'),
(1817, 11, 0, 0, 'achievement_bg_av_perfection'),
(1818, 11, 0, 0, 'achievement_bg_av_perfection'),
(1819, 11, 0, 0, 'achievement_bg_av_perfection'),
(1826, 11, 0, 0, 'achievement_bg_av_perfection'),
(3386, 11, 0, 0, 'achievement_everything_counts'),
(3387, 11, 0, 0, 'achievement_everything_counts'),
(3388, 11, 0, 0, 'achievement_everything_counts'),
(3389, 11, 0, 0, 'achievement_everything_counts');
ALTER TABLE `spell_dbc` ADD COLUMN `AttributesEx6` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `AttributesEx5`;
ALTER TABLE `spell_dbc` ADD COLUMN `AttributesEx7` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `AttributesEx6`;

-- Dummy effect with caster as target
DELETE FROM `spell_dbc` WHERE `id` IN (68308);
INSERT INTO `spell_dbc` (`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`Effect1`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`comment`)
VALUES
(68308, 0x09800100, 0x00000420, 0x00004005, 0x10040000, 0x00000080, 0x00000008, 0x00001000, 3, 1, 0, 'Vault of Archavon - Earth, Wind & Fire - Achievement Check');

DELETE FROM `spell_dbc` WHERE `Id`=63975;
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
(63975,0,0,384,0,0,262144,128,0,0,0,0,1,0,0,0,0,0,0,0,0,13,0,-1,0,0,77,0,0,0,1,1,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'Glyph of Blackstab - 3.2.2');

UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (4362,4363); -- The Fate of the Kingdom & The Princess's Surprise
UPDATE `quest_template` SET `NextQuestId`=4342 WHERE `entry`=4341; -- Kharan Mighthammer
UPDATE `quest_template` SET `PrevQuestId`=4341 WHERE `entry`=4342; -- Kharan's Tale
UPDATE `quest_template` SET `PrevQuestId`=4342 WHERE `entry`=4361; -- The Bearer of Bad News
UPDATE `quest_template` SET `PrevQuestId`=4361 WHERE `entry`=4362; -- The Fate of the Kingdom
UPDATE `quest_template` SET `PrevQuestId`=4362 WHERE `entry`=4363; -- The Princess's Surprise

DELETE FROM `trinity_string` WHERE `entry`=5030;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(5030, '%s attempts to run away in fear!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE `trinity_string` SET `content_default`='Faction %s (%u) can''t have reputation.' WHERE `entry`=326; -- can'nt -> can't

DELETE FROM `spell_target_position` WHERE `id` IN (17278,49097,55431);
INSERT INTO `spell_target_position` (`id` ,`target_map` ,`target_position_x` ,`target_position_y` ,`target_position_z` ,`target_orientation`) VALUES
(17278, 329, 3534.3, -2966.74, 125.001, 0.279253), -- Cannon Fire cast by a trap GO Cannonball
(49097, 0, -466.4, 1496.36, 17.43, 2.1), -- Out of Body Experience, quest with the same name (Grizzly Hills -> Silverpine)
(55431, 571, 5787.781250, -1582.446045, 234.830414, 2.14); -- Summon Gymer
-- 53821 Teach:Death Gate - couldn't find enough info

-- Fixing Lord Thorval, Lady Alistra and Amal'thazad in map 609
UPDATE `creature_template` SET `gossip_menu_id`=9691 WHERE `entry`=28471; -- Lady Alistra
UPDATE `creature_template` SET `gossip_menu_id`=9692 WHERE `entry`=28472; -- Lord Thorval
UPDATE `creature_template` SET `gossip_menu_id`=9693 WHERE `entry`=28474; -- Amal'thazad

DELETE FROM `gossip_menu` WHERE `entry`=9791 AND `text_id`=13475;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9791,13475);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9691,9692,9693,9791,10371);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9691,0,3,'I seek training, Lady Alistra.',5,16,0,0,0,0,''),
(9691,1,0,'I wish to unlearn my talents.',1,1,9791,0,0,0,''),
(9691,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,''),
(9692,0,3,'I seek training, Lord Thorval.',5,16,0,0,0,0,''),
(9692,1,0,'I wish to unlearn my talents.',1,1,9791,0,0,0,''),
(9692,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,''),
(9693,0,3,'I seek training, Amal''thazad.',5,16,0,0,0,0,''),
(9693,1,0,'I wish to unlearn my talents.',1,1,9791,0,0,0,''),
(9693,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,''),
(9791,0,0,'Yes. I do.',16,16,0,0,0,0,''),
(10371,0,0,'Purchase a Dual Talent Specialization.',18,16,0,0,0,10000000,'Are you sure you wish to purchase a Dual Talent Specialization?'); -- Fixing this entry because Dual Talent Specialization needs confirmation by players.

-- Darion Mograine DK trainer (Since the quest 'Taking back Acherus' until go to Stormwind/Orgrimmar)
-- The gossip_menu (`entry` and `text_id`) are already in TDB UP41. Only needs this changes:
UPDATE `creature_template` SET `gossip_menu_id`=10027, `trainer_class`=6 WHERE `entry`=31084;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=10027;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(10027,0,3,'I require training, Highlord.',5,16,0,0,0,0,'');

UPDATE `smart_scripts` SET `action_param1`=1,`event_flags`=1 WHERE `action_type`=25;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND ((`entryorguid`=11360 AND `id`=1) OR (`entryorguid`=27225 AND `id`=20) OR (`entryorguid`=27615 AND `id`=15));
UPDATE `smart_scripts` SET `id`=20 WHERE `entryorguid`=27225 AND `id`=21;
UPDATE `smart_scripts` SET `id`=21 WHERE `entryorguid`=27225 AND `id`=22;
DELETE FROM `creature_text` WHERE `text`='%s attempts to run away in fear!';

DELETE FROM `spell_dbc` WHERE `Id`=24677;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(24677,0,0,256,0,4,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,6,0,-1,0,0,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'GY Mid Trigger - 2.0.12 spell - AV Snowfall Graveyard');

UPDATE `gameobject_template` SET `data16`=1 WHERE `entry`=180418 AND `WDBVerified`=11723;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=44572;
INSERT INTO `spell_linked_spell` VALUES
(44572,71757,0, 'Deep Freeze - Damage Proc');

DELETE FROM `spell_bonus_data` WHERE `entry`=71757;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
(71757,2.143,0,0,0, 'Mage - Deep Freeze');

DELETE FROM `gossip_menu` WHERE `entry`=2211 AND `text_id`=2850;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2211, 2850);

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=160445;

DELETE FROM `smart_scripts` WHERE `entryorguid`=160445 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(160445, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 12, 9136, 1, 60*1000, 0, 0, 0, 8, 0, 0, 0, -7917.378906, -2610.533936, 221.123123, 5.040257, 'Sha''ni Proudtusk''s Remains - On gossip hello summon Sha''ni Proudtusk');
-- Need a way to prevent spamming this action.

DELETE FROM `conditions` WHERE `sourceEntry` IN (62584,64185);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(13,0,62584,0,18,1,33202,0,0,'','target for Lifebinder\'s Gift'),
(13,0,62584,0,18,1,32919,0,0,'','target for Lifebinder\'s Gift'),
(13,0,62584,0,18,1,32916,0,0,'','target for Lifebinder\'s Gift'),
(13,0,62584,0,18,1,32906,0,0,'','target for Lifebinder\'s Gift'),
(13,0,62584,0,18,1,33203,0,0,'','target for Lifebinder\'s Gift'),
(13,0,62584,0,18,1,32918,0,0,'','target for Lifebinder\'s Gift'),
(13,0,62584,0,18,1,33215,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,33202,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,32919,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,32916,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,32906,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,33203,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,32918,0,0,'','target for Lifebinder\'s Gift'),
(13,0,64185,0,18,1,33215,0,0,'','target for Lifebinder\'s Gift');

DELETE FROM `spell_target_position` WHERE `id` IN (46233,52462,54963);
INSERT INTO `spell_target_position` (`id` ,`target_map` ,`target_position_x` ,`target_position_y` ,`target_position_z` ,`target_orientation`) VALUES
(46233,571,3202.959961,5274.073730,46.887897,0.015704), -- Call Mammoth Orphan
(52462,609,2387.738525,-5898.617676,108.353539,4.354776), -- Hide In Mine Car
(54963,571,6153.721191,-1075.270142,403.517365,2.232988); -- Teleporter Power Cell

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_baltharus_enervating_brand';

UPDATE `item_template` SET `BuyPrice` = 40000, `delay` = 0, `spellcharges_1` = -1, `spellcooldown_1` = 0, `spellcooldown_2` = 0, `spellcooldown_3` = 0, `spellcooldown_4` = 0, `spellcooldown_5` = 0, `spellcategory_1` = 79, `spellcategorycooldown_1` = 3000, `spellcategorycooldown_2` = 0, `spellcategorycooldown_3` = 0, `spellcategorycooldown_4` = 0, `spellcategorycooldown_5` = 0, `WDBVerified`=12340 WHERE `entry` = 45006; -- Jillian's Tonic of Endless Rage
UPDATE `item_template` SET `BuyPrice` = 40000, `delay` = 0, `spellcharges_1` = -1, `spellcooldown_1` = 0, `spellcooldown_2` = 0, `spellcooldown_3` = 0, `spellcooldown_4` = 0, `spellcooldown_5` = 0, `spellcategory_1` = 79, `spellcategorycooldown_1` = 3000, `spellcategorycooldown_2` = 0, `spellcategorycooldown_3` = 0, `spellcategorycooldown_4` = 0, `spellcategorycooldown_5` = 0, `WDBVerified`=12340 WHERE `entry` = 45007; -- Jillian's Tonic of Pure Mojo
UPDATE `item_template` SET `delay` = 0, `spellcooldown_1` = 0, `spellcooldown_2` = 0, `spellcooldown_3` = 0, `spellcooldown_4` = 0, `spellcooldown_5` = 0, `spellcategorycooldown_2` = 0, `spellcategorycooldown_3` = 0, `spellcategorycooldown_4` = 0, `spellcategorycooldown_5` = 0, `WDBVerified`=12340 WHERE `entry` = 45008; -- Jillian's Tonic of Stoneblood
UPDATE `item_template` SET `BuyPrice` = 40000, `delay` = 0, `spellcharges_1` = -1, `spellcooldown_1` = 0, `spellcooldown_2` = 0, `spellcooldown_3` = 0, `spellcooldown_4` = 0, `spellcooldown_5` = 0, `spellcategory_1` = 79, `spellcategorycooldown_1` = 3000, `spellcategorycooldown_2` = 0, `spellcategorycooldown_3` = 0, `spellcategorycooldown_4` = 0, `spellcategorycooldown_5` = 0, `WDBVerified`=12340 WHERE `entry` = 45009; -- Jillian's Tonic of the Frost Wyrm
UPDATE `item_template` SET `BuyPrice` = 200, `stackable` = 20, `delay` = 0, `spellcharges_1` = -1, `spellcooldown_1` = 0, `spellcooldown_2` = 0, `spellcooldown_3` = 0, `spellcooldown_4` = 0, `spellcooldown_5` = 0, `spellcategory_1` = 4, `spellcategorycooldown_1` = 60000, `spellcategorycooldown_2` = 0, `spellcategorycooldown_3` = 0, `spellcategorycooldown_4` = 0, `spellcategorycooldown_5` = 0, `WDBVerified`=12340 WHERE `entry` = 45276; -- Jillian's Genius Juice
UPDATE `item_template` SET `BuyPrice` = 200, `stackable` = 20, `delay` = 0, `spellcharges_1` = -1, `spellcooldown_1` = 0, `spellcooldown_2` = 0, `spellcooldown_3` = 0, `spellcooldown_4` = 0, `spellcooldown_5` = 0, `spellcategory_1` = 4, `spellcategorycooldown_1` = 60000, `spellcategorycooldown_2` = 0, `spellcategorycooldown_3` = 0, `spellcategorycooldown_4` = 0, `spellcategorycooldown_5` = 0, `WDBVerified`=12340 WHERE `entry` = 45277; -- Jillian's Savior Sauce
UPDATE `item_template` SET `BuyPrice` = 6, `delay` = 0, `spellcharges_1` = -1, `spellcooldown_1` = 0, `spellcategory_1` = 11, `spellcategorycooldown_1` = 1000, `WDBVerified`=12340 WHERE `entry` = 45279; -- Jillian's Gourmet Fish Feast
UPDATE `item_template` SET `WDBVerified`=12340 WHERE `entry` =46766; -- Red War Fuel
UPDATE `item_template` SET `Quality`=0,`Flags`=65538,`WDBVerified`=12340 WHERE `entry`=10791; -- Goblin Engineer Membership Card

