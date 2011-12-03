DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (7376,21178,25780,48263);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(7376,57339,2, 'Defensive Stance Passive - Tank Class Passive Threat'),
(21178,57339,2, 'Bear Form (Passive2) - Tank Class Passive Threat'),
(25780,57339,2, 'Righteous Fury - Tank Class Passive Threat'),
(48263,57340,2, 'Frost Presence - Tank Class Passive Threat');

UPDATE `creature_template` SET `dmg_multiplier`=3.2 WHERE `entry`=32918;
UPDATE `creature_template` SET `dmg_multiplier`=6.4 WHERE `entry`=33399;

UPDATE `instance_encounters` SET `creditType`=0, `creditEntry`=26533 WHERE `entry` IN (296,300);

UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry`=188173;

DELETE FROM `spell_script_names` WHERE `spell_id`=62042;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62042, 'spell_stormhammer_targeting');

UPDATE `gameobject_template` SET `flags`=`flags`|0x10 WHERE `entry`=194265;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=64996;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64996,18,1,34246);

UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry` IN (33104,33070);

DELETE FROM `spell_script_names` WHERE `spell_id`=64445;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64445, 'spell_remove_player_from_phase');

DELETE FROM `conditions` WHERE `SourceEntry` IN (63766,63983) AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,63766,18,1,32933, 'Arm Sweep (10N) Target'),
(13,63983,18,1,32933, 'Arm Sweep (25N) Target');

-- Swap trigger model ids
UPDATE `creature_template` SET `modelid1`=1126, `modelid2`=11686 WHERE `entry` IN (33906,33907);

-- Rubble AI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=33768;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33768;
INSERT INTO `smart_scripts` VALUES 
(33768,0,0,0,0,0,100,0x02,5000,15000,5000,15000,11,63818,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rubble - Cast Rumble (10N)'),
(33768,0,1,0,0,0,100,0x04,5000,15000,5000,15000,11,63978,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rubble - Cast Stone Nova (25N)');

UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=33571;
UPDATE `creature_template` SET `ScriptName`='npc_pool_of_tar' WHERE `entry`=33090;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (65044,65045);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,65044,18,1,33090),
(13,65045,18,1,33090),
(13,65044,18,1,33060),
(13,65045,18,1,33060),
(13,65044,18,1,33062),
(13,65045,18,1,33062),
(13,65044,18,1,33109),
(13,65045,18,1,33109);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (65044,65045);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65044, 'spell_flame_leviathan_flames'),
(65045, 'spell_flame_leviathan_flames');

