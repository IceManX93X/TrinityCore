DELETE FROM `trinity_string` WHERE `entry` IN (453, 550, 714, 716);
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES 
(453,'Ban time remaining: %s, Banned by: %s, Reason: %s'),
(550,'Mute time remaining: %s'),
(716,'Map: %s, Area: %s'),
(714,'Map: %s, Area: %s, Zone: %s, Phase: %u');

DELETE FROM `command` WHERE `name` = 'pinfo';
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('pinfo','2','Syntax: .pinfo [$player_name/#GUID]\r\n\r\nOutput account information for selected player or player find by $player_name or #GUID.');

UPDATE `creature_template` SET `ScriptName`='npc_hyldsmeet_protodrake' WHERE `entry`=29625;
UPDATE `creature_loot_template` SET `maxcount`=3 WHERE `entry`=38401 AND `mincountOrRef`=-34248;

UPDATE `vehicle_template_accessory` SET `seat_id`=1, `minion`=1 WHERE `entry`=29625;

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`VehicleId`=165,`spell1`=54420,`AIName`='SmartAI',`InhabitType`=5 WHERE `entry`=29403;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=29403;
INSERT INTO `npc_spellclick_spells` VALUES
(29403,49641,0,0,0,1,0,0,0);

DELETE FROM `spell_scripts` WHERE `id`=54420;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(54420,1,0,18,0,0,0,0,0,0,0);


DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12747,12748,12749) AND `type`=12;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(12747,12,1,0,''),
(12748,12,1,0,''),
(12749,12,1,0,'');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12740,12741,12744,12993) AND `type`=12;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(12740,12,0,0,''),
(12741,12,0,0,''),
(12744,12,0,0,''),
(12993,12,1,0,'');

DELETE FROM `spell_script_names` WHERE `spell_id`=64414;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64414,'spell_load_into_catapult');

-- Update a wrongly entered spell
UPDATE `creature_template` SET `spell6`=64414 WHERE `entry`=33167;

DELETE FROM `spell_script_names` WHERE `spell_id`=58886;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(58886,'spell_magic_eater_food');

DELETE FROM `spell_script_names` WHERE `spell_id`=61889;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(61889,'spell_assembly_meltdown');

DELETE FROM `spell_script_names` WHERE `spell_id`=20577;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(20577,'spell_gen_cannibalize');

