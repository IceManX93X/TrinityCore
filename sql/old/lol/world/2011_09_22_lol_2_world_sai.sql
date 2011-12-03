DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29033,29018,29034);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (29033,29018,29034);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Spirit of Atha
(29033,0,0,0,0,0,100,0,2000,4000,5000,7000,11,3391,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Atha - IC - cast Trash'),
(29033,0,1,0,0,0,100,0,6000,8000,9000,11000,11,21790,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Atha - IC - cast Aqua Jet'),
-- Spirit of Ha-Khalan
(29018,0,0,0,4,0,100,0,0,0,0,0,11,50502,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - on Aggro - cast Thick Hide'),
(29018,0,1,0,0,0,100,0,5000,10000,12000,16000,11,34370,2,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - cast Jagged Tooth Snap'),
(29018,0,2,0,0,0,100,0,3000,5000,7000,11000,11,48287,2,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - cast Powerful Bite'),
-- Spirit of Koosu
(29034,0,0,0,0,0,100,0,1000,2000,4000,6000,11,21971,2,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Koosu - IC - cast Poison Bolt');