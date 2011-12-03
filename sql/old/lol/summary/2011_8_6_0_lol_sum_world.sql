DELETE FROM `spell_script_names` WHERE `spell_id`=62207;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62207, 'spell_elder_brightleaf_unstable_sun_beam');

-- Quest 12860, 12927 "Data Mining"
UPDATE `creature_template` SET `AIName`='SmartAI',`InhabitType`=3 WHERE `entry`=29746;
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id`=29746;

DELETE FROM `smart_scripts` WHERE `entryorguid`=29746;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29746,0,0,0,8,0,100,0,59728,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit - Despawn');

DELETE FROM `spell_scripts` WHERE `id`=59728;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(59728,0,0,8,29752,0,0,0,0,0,0); -- Give quest credit

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=51161;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,51161,0,29,29746,20,0,0,'','Spell Retrieve Data will only be cast near Databank'); 
DELETE FROM `spell_script_names` WHERE `spell_id` IN (54849,59453);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(54849, 'spell_mojo_volley_trigger'),
(59453, 'spell_mojo_volley_trigger');

