DELETE FROM `npc_vendor` WHERE `item` = 36902;

DELETE FROM `disables` WHERE `entry` = 7703 AND `sourceType` = 4;

DELETE FROM `achievement_criteria_data` WHERE criteria_id = 7703;
INSERT INTO `achievement_criteria_data` VALUES
(7703, 6, 4197, 0, ''),
(7703, 11, 0, 0, 'achievement_wg_didnt_stand_a_chance');

INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES 
(283,'You have disabled %s\'s chat for %u minutes, effective at the player\'s next login. Reason: %s.');
UPDATE `gameobject_template` SET `flags`=32,`faction`=114 WHERE `entry`=192642; -- Doodad_Dalaran_SewerDoor_01
UPDATE `gameobject_template` SET `flags`=32,`faction`=114 WHERE `entry`=192643; -- Doodad_Dalaran_SewerDoor_02

