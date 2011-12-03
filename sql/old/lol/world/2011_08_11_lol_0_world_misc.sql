DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=4244;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=4244 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(4244,11,0,0,'achievement_hadronox_denied');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (53030,59417);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(53030, 'spell_hadronox_leech_poison'),
(59417, 'spell_hadronox_leech_poison');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29062,29063,29064,29096,29097,29098);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_hadronox_nerubian' WHERE `entry` IN (29062,29063,29064);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29062,29063,29064));
DELETE FROM `linked_respawn` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29062,29063,29064));
DELETE FROM `creature` WHERE `id` IN (29062,29063,29064);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29096,29097,29098));
DELETE FROM `linked_respawn` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29096,29097,29098));
DELETE FROM `creature` WHERE `id` IN (29096,29097,29098);
