-- Shadow Crash
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=63277;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(63277,65269,2, 'Shadow Crash - Haste and reduced Mana cost');

-- remove npc 33838, should be spawned by spell 63774
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=33838);
DELETE FROM `creature` WHERE `id`=33838;
