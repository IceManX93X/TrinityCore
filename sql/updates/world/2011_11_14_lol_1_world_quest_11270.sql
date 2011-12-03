-- Item only usable at creature 24009 and 24010
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=33278;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 0, 33278, 0, 24, 1, 24009, 0, 0, '', NULL), -- creature 24009
(18, 0, 33278, 0, 24, 1, 24010, 0, 0, '', NULL); -- creature 24010 

-- restore original trinity values which were overwritten by last commit of this sql
DELETE FROM `spell_scripts` WHERE `id`=42793;
UPDATE `creature_template` SET `KillCredit1`=24008 WHERE `entry`=24009;
UPDATE `creature_template` SET `KillCredit1`=24008 WHERE `entry`=24010;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`=24008 WHERE `entry`=11270;
-- restore end

UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (24009,24010);
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (24009,24010);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (24009,24010);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24009,0,0,1,8,0,100,0,42793,0,30000,30000,33,24008,0,0,0,0,0,0,7,0,0,0,0,0,0, 'Alliance Corpse - On Burn Body Hit - Give Kill Credit'),
(24009,0,1,0,61,0,100,0,0,0,0,0,41,30000,0,0,0,0,0,0,1,0,0,0,0,0,0, 'Alliance Corpse - On Burn Body Hit - Despawn after 30 secs'),
(24010,0,0,1,8,0,100,0,42793,0,30000,30000,33,24008,0,0,0,0,0,0,7,0,0,0,0,0,0, 'Forsaken Corpse - On Burn Body Hit - Give Kill Credit'),
(24010,0,1,0,61,0,100,0,0,0,0,0,41,30000,0,0,0,0,0,0,1,0,0,0,0,0,0, 'Forsaken Corpse - On Burn Body Hit - Despawn after 30 secs');