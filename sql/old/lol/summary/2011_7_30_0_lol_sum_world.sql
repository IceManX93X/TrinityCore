UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_captured_crusader' WHERE `entry`=30407;

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10290,10133);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10290,10133) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10290,11,0,0, 'achievement_rubble_and_roll'),
(10133,11,0,0, 'achievement_rubble_and_roll'),
(10290,12,0,0, ''),
(10133,12,1,0, '');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10284,10722);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10284,10722) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10284,11,0,0, 'achievement_disarmed'),
(10722,11,0,0, 'achievement_disarmed'),
(10284,12,0,0, ''),
(10722,12,1,0, '');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10285,10095);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10285,10095) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10285,11,0,0, 'achievement_with_open_arms'),
(10095,11,0,0, 'achievement_with_open_arms'),
(10285,12,0,0, ''),
(10095,12,1,0, '');

UPDATE `creature_template` SET `ScriptName`='mob_saronit_vapor' WHERE `entry`=33488;

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10451,10462);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10451,10462) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10451,11,0,0, 'achievement_i_love_the_smell_of_saronite_in_the_morning'),
(10462,11,0,0, 'achievement_i_love_the_smell_of_saronite_in_the_morning'),
(10451,12,0,0, ''),
(10462,12,1,0, '');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10173,10306);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10173,10306) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10173,11,0,0, 'achievement_shadowdodger'),
(10306,11,0,0, 'achievement_shadowdodger'),
(10173,12,0,0, ''),
(10306,12,1,0, '');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_freya_sunbeam';

-- Quest 12860, 12927 "Data Mining"
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29746;

DELETE FROM `smart_scripts` WHERE `entryorguid`=29746;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29746,0,0,0,8,0,100,0,59728,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit - Despawn');

DELETE FROM `spell_scripts` WHERE `id`=59728;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(59728,0,0,8,29752,0,0,0,0,0,0); -- Give quest credit

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=51161;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,51161,0,29,29746,20,0,0,'','Spell Retrieve Data will only be cast near Databank'); 
UPDATE `gameobject_loot_template` SET `item`=45624 WHERE `entry` IN (27030,26974) AND `item`=47241;
UPDATE `gameobject_loot_template` SET `item`=46053 WHERE `entry`=26974 AND `item`=46052;

-- add missing Quest Mark & Quest Accept Conditions
/*
SELECT *FROM `conditions` WHERE `SourceTypeOrReferenceId`=20 AND `SourceEntry` NOT IN (SELECT `SourceEntry` FROM `conditions` WHERE `SourceTypeOrReferenceId`=19);
SELECT *FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` NOT IN (SELECT `SourceEntry` FROM `conditions` WHERE `SourceTypeOrReferenceId`=20);
*/
INSERT IGNORE INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19,0,13044,0,8,13008,0,0,0,'',''),
(19,0,13044,0,8,13039,0,0,0,'',''),
(19,0,13044,0,8,13040,0,0,0,'',''),
(19,0,13068,0,8,13139,0,0,0,'',''),
(19,0,13086,0,8,13070,0,0,0,'',''),
(19,0,13104,0,8,13086,0,0,0,'',''),
(19,0,13104,1,15,11,0,0,0,'',''),
(19,0,13104,1,15,9,0,0,0,'',''),
(19,0,13104,1,15,8,0,0,0,'',''),
(19,0,13104,1,15,7,0,0,0,'',''),
(19,0,13104,1,15,5,0,0,0,'',''),
(19,0,13104,1,15,4,0,0,0,'',''),
(19,0,13104,1,15,3,0,0,0,'',''),
(19,0,13104,1,15,2,0,0,0,'',''),
(19,0,13104,1,15,1,0,0,0,'',''),
(19,0,13105,0,15,6,0,0,0,'',''),
(19,0,13105,0,8,13086,0,0,0,'',''),
(19,0,13120,1,8,13104,0,0,0,'',''),
(19,0,13120,1,8,13105,0,0,0,'',''),
(19,0,13224,0,8,13157,0,0,0,'',''),
(19,0,13225,0,8,13157,0,0,0,'',''),
(19,0,13118,1,8,13122,0,0,0,'',''),
(19,0,13122,1,8,13104,0,0,0,'',''),
(19,0,13122,1,8,13105,0,0,0,'',''),
(19,0,13125,0,8,13110,0,0,0,'',''),
(19,0,13125,0,8,13118,0,0,0,'',''),
(19,0,13130,0,8,13110,0,0,0,'',''),
(19,0,13130,0,8,13118,0,0,0,'',''),
(19,0,13135,0,8,13110,0,0,0,'',''),
(19,0,13135,0,8,13118,0,0,0,'',''),
(19,0,13139,0,8,13125,0,0,0,'',''),
(19,0,13139,0,8,13130,0,0,0,'',''),
(19,0,13139,0,8,13135,0,0,0,'',''),
(20,0,8870,0,4,1537,0,0,0,'','The Lunar Festival: Ironforge'),
(20,0,8871,0,4,1519,0,0,0,'','The Lunar Festival: Stormwind'),
(20,0,8872,0,4,1657,0,0,0,'','The Lunar Festival: Darnassus'),
(20,0,8873,0,4,1637,0,0,0,'','The Lunar Festival: Orgrimmar'),
(20,0,8874,0,4,1497,0,0,0,'','The Lunar Festival: Undercity'),
(20,0,8875,0,4,1638,0,0,0,'','The Lunar Festival: Thunder Bluff'),
(20,0,11360,0,23,87,0,0,0,'',''),
(20,0,11361,0,23,362,0,0,0,'',''),
(20,0,11439,0,23,131,0,0,0,'',''),
(20,0,11440,0,23,3576,0,0,0,'',''),
(20,0,11449,0,23,159,0,0,0,'',''),
(20,0,11450,0,23,3665,0,0,0,'','');
-- cleanup
DELETE FROM `creature` WHERE `guid` IN (137490,137491);
DELETE FROM `creature_addon` WHERE `guid` IN (137490,137491);
DELETE FROM `creature_formations` WHERE `leaderguid`=137496;

UPDATE `spell_script_names` SET `ScriptName`='spell_auriaya_strenght_of_the_pack' WHERE `spell_id`=64381;

-- not-so-friendly fire + rocket strike targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (63041,65040,65346);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63041,18,1,33836),
(13,63041,18,1,34362),
(13,63041,18,1,33855),
(13,63041,18,1,34057),
(13,63041,18,1,34147),
(13,63041,18,1,0),
-- only players
(13,65040,18,1,0),
(13,65346,18,1,0);

-- not-so-friendly fire
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10405,10406) AND `type`=18;

-- firefighter
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10450,10463);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10450,10463) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10450,11,0,0, 'achievement_firefighter'),
(10463,11,0,0, 'achievement_firefighter');

UPDATE `reference_loot_template` SET `item`=40809 WHERE `entry`=34252 AND `item`=41809;
UPDATE `reference_loot_template` SET `item`=40848 WHERE `entry`=34252 AND `item`=41848;

DELETE FROM `spell_script_names` WHERE `spell_id`=56153;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(56153, 'spell_elder_nadox_guardian_aura');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=7317;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7317 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7317,11,0,0, 'achievement_respect_your_elders');

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100, `maxcount`=1 WHERE `entry` IN (30449,30451,30452,31535) AND `item` IN (40752,40753);

