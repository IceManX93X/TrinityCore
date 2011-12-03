-- NPC 'Brain' ID=900003
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=30000;
DELETE FROM `gossip_scripts` WHERE `id`=30135;
UPDATE `creature_template` SET `npcflag`=1,`AIName`='SmartAI',`ScriptName`='' WHERE entry=900003;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (900003);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(900003,0,0,1,62,0,100,0,30000,1,0,0,62,571,0,0,0,0,0,7,0,0,0,5439.9785,2840.8079,420.4277,0.0021,'Brain - on Gossip Select - Teleport to Vault of Archavon Entrance'),
(900003,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Brain - close gossip');