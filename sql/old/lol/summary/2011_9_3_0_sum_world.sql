UPDATE `creature_template` SET `difficulty_entry_1`=35529 WHERE `entry`=35049; -- Memory of Heigan
UPDATE `creature_template` SET `unit_class`=2 WHERE `entry`=35310; -- Argent Lightwielder
UPDATE `creature_template` SET `unit_class`=2 WHERE `entry`=35308; -- Argent Priestess (1)

UPDATE `version` SET `db_version`='TDB 335.11.42' LIMIT 1;

UPDATE `spell_script_names` SET `ScriptName`='spell_marrowgar_coldflame_bonestorm' WHERE `spell_id`=72705 AND `ScriptName`='spell_marrowgar_coldflame';

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (70346,72456,72868,72869);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,70346,0,18,1,37672,0,0, '', 'Slime Puddle - target Mutated Abomination'),
(13,0,72456,0,18,1,38285,0,0, '', 'Slime Puddle - target Mutated Abomination'),
(13,0,72868,0,18,1,37672,0,0, '', 'Slime Puddle - target Mutated Abomination'),
(13,0,72869,0,18,1,38285,0,0, '', 'Slime Puddle - target Mutated Abomination');

UPDATE `creature_template` SET `exp`=2,`spell1`=70360,`spell2`=70539 WHERE `entry`=37672;
UPDATE `creature_template` SET `exp`=2,`spell1`=72527,`spell2`=72457 WHERE `entry`=38605;
UPDATE `creature_template` SET `exp`=2,`spell1`=70360,`spell2`=72875 WHERE `entry`=38786;
UPDATE `creature_template` SET `exp`=2,`spell1`=72527,`spell2`=72876 WHERE `entry`=38787;

UPDATE `creature_template` SET `exp`=2,`spell1`=70360,`spell2`=70539 WHERE `entry`=38285;
UPDATE `creature_template` SET `exp`=2,`spell1`=72527,`spell2`=72457 WHERE `entry`=38788;
UPDATE `creature_template` SET `exp`=2,`spell1`=70360,`spell2`=72875 WHERE `entry`=38789;
UPDATE `creature_template` SET `exp`=2,`spell1`=72527,`spell2`=72876 WHERE `entry`=38790;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_putricide_expunged_gas';
DELETE FROM `spell_proc_event` WHERE `entry` IN (70215,72858,72859,72860,70672,72455,72832,72833);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(70672,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(72455,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(72832,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(72833,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0);

DELETE FROM `spell_script_names` WHERE `spell_id`=13161;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(13161, 'spell_hun_aspect_of_the_beast');

DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=23789;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES
(0, 23789, 8, 'Stoneclaw Totem TEST - can crash client by spawning too many totems');

-- Add spell Magma Totem TEST to disables table
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=61904;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES
(0, 61904, 8, 'Magma Totem TEST - can crash client by spawning too many totems');

-- Move a high guid to a lower one (Vyragosa)
SET @oldguid = 250006;
SET @newguid = 202602;
UPDATE `creature` SET `guid`=@newguid WHERE `guid`=@oldguid;
UPDATE `creature_addon` SET `guid`=@newguid, `path_id`=@newguid*100 WHERE `guid`=@oldguid;
UPDATE `waypoint_data` SET `id`=@newguid*100 WHERE `id`=@oldguid*100;

-- By Aokromes:
-- Orientation fix for portal from ghostlands to eastern plagelands.
UPDATE `areatrigger_teleport` SET `target_orientation`=2.255664 WHERE `id`=4386;
-- Spawn Arcane Container also on heroic mode SLab
UPDATE `gameobject` SET `spawnMask`=3 WHERE `guid`=22674;

