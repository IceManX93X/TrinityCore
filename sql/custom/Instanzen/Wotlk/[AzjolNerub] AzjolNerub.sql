-- boss melee dmg
UPDATE `creature_template` SET `dmg_multiplier` = 20, `flags_extra` = `flags_extra`|1 WHERE `entry` IN (31612,31611,31610);

-- immunitys
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (28684,28921,29120,31612,31611,31610);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|512|1024|4096|8192|65536|131072|524288|4194304|8388608|67108864|536870912 WHERE `entry` IN (28729,28730,28731,31615,31616,31617);

-- emblems
UPDATE `creature_loot_template` SET `item` = 40752 WHERE `entry` IN (31612,31611,31610) AND `item` = 47241;

-- scriptnames
UPDATE `creature_template` SET `ScriptName` = 'npc_web_wrap' WHERE `entry` = 28619;
UPDATE `creature_template` SET `ScriptName` = 'npc_krikthir_watcher' WHERE `entry` IN (28729,28730,28731);
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_anubar_crusher' WHERE `entry` = 28922;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_hadronox_nerubian' WHERE `entry` IN (29062,29063,29064);

-- update positions to prevent chain-aggro (custom)
UPDATE `creature` SET `position_x` = 506.178, `position_y` = 669.927, `position_z` = 776.306, `orientation` = 0.855211 WHERE `guid` = 127225;
UPDATE `creature` SET `position_x` = 500.963, `position_y` = 667.828, `position_z` = 776.306, `orientation` = 0.83428 WHERE `guid` = 127233;

-- set swarm target entry
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (52438, 52449);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 52438, 18, 1, 28684),
(13, 52449, 18, 1, 28684);

-- remove some db spawns (should be spawned by script)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29062,29063,29064,29096,29097,29098);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29062,29063,29064));
DELETE FROM `linked_respawn` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29062,29063,29064));
DELETE FROM `creature` WHERE `id` IN (29062,29063,29064);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29096,29097,29098));
DELETE FROM `linked_respawn` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29096,29097,29098));
DELETE FROM `creature` WHERE `id` IN (29096,29097,29098);

-- anubarak add scripts
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (29213, 29216, 29217);

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29213, 29216, 29217);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
('2921301','29213','4','0','100','3','0','0','0','0','11','53602','1','0','0','0','0','0','0','0','0','0','Anubar Darter - Cast Dart (Normal)'),
('2921302','29213','4','0','100','5','0','0','0','0','11','59349','1','0','0','0','0','0','0','0','0','0','Anubar Darter - Cast Dart (Heroic)'),

('2921601','29216','0','0','100','7','5000','10000','7000','15000','11','52532','1','0','0','0','0','0','0','0','0','0','Anubar Guardian - Cast Strike'),
('2921602','29216','0','0','100','3','10000','10000','10000','15000','11','53618','1','0','0','0','0','0','0','0','0','0','Anubar Guardian - Cast Sunder Armor (Normal)'),
('2921603','29216','0','0','100','5','10000','10000','10000','15000','11','59350','1','0','0','0','0','0','0','0','0','0','Anubar Guardian - Cast Sunder Armor (Heroic)'),

('2921701','29217','0','0','100','3','5000','7000','4000','6000','11','53617','1','0','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt (Normal)'),
('2921702','29217','0','0','100','5','5000','7000','4000','6000','11','59359','1','0','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt (Heroic)'),
('2921703','29217','0','0','100','3','7000','10000','10000','12000','11','53616','1','2','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt Volley (Normal)'),
('2921704','29217','0','0','100','5','7000','10000','10000','12000','11','59360','1','2','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt Volley (Heroic)');

-- achievements
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=4244;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=4244 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(4244,11,0,0,'achievement_hadronox_denied');

-- spell scriptnames
DELETE FROM `spell_script_names` WHERE `spell_id` IN (53030,59417);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(53030, 'spell_hadronox_leech_poison'),
(59417, 'spell_hadronox_leech_poison');
