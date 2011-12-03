-- Arcane Barrage
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=56397;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(56397,63934,1, 'Arcane Barrage - Arcane Barrage Damage');

-- Heart of Magic (custom)
DELETE FROM `creature_loot_template` WHERE `entry`=32448;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('32448','44650','-100','1','0','1','1'),
('32448','44651','-100','2','0','1','1');

UPDATE `creature_template` SET `lootid`=32448 WHERE `entry`=32448;
