DELETE FROM `spell_area` WHERE `spell`=64169;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES 
(64169,4273,0,0,0,0,0,2,0);
-- Quest 12860, 12927 "Data Mining"
UPDATE `creature_template` SET `AIName`='SmartAI',`InhabitType`=3 WHERE `entry`=29746;
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id`=29746;

DELETE FROM `smart_scripts` WHERE `entryorguid`=29746;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29746,0,0,0,8,0,100,0,59728,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit - Despawn');

DELETE FROM `spell_scripts` WHERE `id`=59728;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(59728,0,0,8,29752,0,0,0,0,0,0); -- Give quest credit

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=51161;    -- delete wrong existing condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=55161;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,55161,0,29,29746,20,0,0,'','Spell Retrieve Data will only be cast near Databank'); 
-- Ignis - Hot Pocket
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10430,10431) AND `type`=18;

UPDATE `creature_template` SET `ScriptName`='npc_hyldsmeet_protodrake_transport' WHERE `entry`=29679;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62496,67390,64414);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,62496,18,1,33167),
(13,67390,18,1,33167),
(13,64414,18,1,33109);

-- Broggok Poison Cloud
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x4|0x20000, `flags_extra`=`flags_extra`|128, `ScriptName`='' WHERE `entry` IN (17662,18602);

-- Cosmetic Drakkari Bat [PH]
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2, `flags_extra`=`flags_extra`|0x2 WHERE `entry`=27490;

-- Harbinger Skyriss (heroic)
UPDATE `creature_template` SET `Health_mod`=33 WHERE `entry`=21601;

