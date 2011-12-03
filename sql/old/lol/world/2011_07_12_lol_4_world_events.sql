-- fix achievement #271
UPDATE `spell_dbc` SET `Effect1`=64, `EffectImplicitTargetA1`=1, `Comment`='Ribbon Pole - Trigger Ribbon Pole Channel' WHERE `Id`=29710;

-- Ice Chest - modify loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=28682 AND `item`=54806;

-- Satchel of Chilled Goods - loot
DELETE FROM `item_loot_template` WHERE `entry`=54536;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- Emblems
('54536','40753','100','1','0','2','2'),
-- Ice Chip
('54536','53641','5','1','0','1','1'),
-- Frostscythe of Lord Ahune
('54536','54806','10','1','0','1','1'),
-- Burning Blossom
('54536','23247','100','1','0','5','15');

-- Ice Stone gossip menu
DELETE FROM `gossip_menu` WHERE `entry`=11389;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(11389,15864);

-- root Frozen Core
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|4 WHERE `entry`=25865;

-- cleanup quest relations
DELETE FROM `creature_questrelation` WHERE `quest`=11691;
DELETE FROM `gameobject_involvedrelation` WHERE `quest`=11691;
