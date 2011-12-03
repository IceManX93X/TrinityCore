UPDATE `creature` SET `spawntimesecs`=7200 WHERE `id`=33236;

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (33365,33370,33212,33367);
UPDATE `creature_template` SET `ScriptName`='npc_thorims_hammer' WHERE `entry`=33364;
UPDATE `creature_template` SET `ScriptName`='npc_mimirons_inferno' WHERE `entry`=33369;
UPDATE `creature_template` SET `ScriptName`='npc_hodirs_fury' WHERE `entry`=33108;
UPDATE `creature_template` SET `ScriptName`='npc_freyas_ward' WHERE `entry`=33366;

UPDATE `creature_template` SET `difficulty_entry_1`=34277, `AIName`='', `ScriptName`='npc_freyas_ward_summon' WHERE `entry`=33387;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=34277;

UPDATE `creature_template` SET `difficulty_entry_1`=34276, `AIName`='', `ScriptName`='npc_freyas_ward_summon' WHERE `entry`=34275;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=34276;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33387,34275);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62911,62909,62533,62906);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,0,62533,0,18,1,33108,0,0,'','Hodir\'s Fury'),
(13,0,62906,0,18,1,33366,0,0,'','Freya\'s Ward'),
(13,0,62909,0,18,1,33369,0,0,'','Mimiron\'s Inferno'),
(13,0,62911,0,18,1,33364,0,0,'','Thorim\'s Hammer');

DELETE FROM `spell_script_names` WHERE `spell_id`=62907;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62907, 'spell_freyas_ward_summon');
