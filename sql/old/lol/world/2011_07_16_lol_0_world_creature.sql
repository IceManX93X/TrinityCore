/* Reduce Ominous Cloud Amount in Yogg-Saron Encounter */
SET @npc_ominous_cloud = 33292;

/* Delete second "block" of spawns (see GUIDs in backup)

Backup of Original Clouds:
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
 (136048, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1956.64, -8.79929, 327.361, 1.03427, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136049, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1972.02, -65.7261, 329.656, 2.82256, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136050, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 2013.82, -69.3169, 331.424, 3.84924, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136051, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1996.72, -43.7548, 326.169, 0.745018, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136052, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1985.88, -37.8674, 326.211, 3.36129, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (136053, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1994.83, 21.4201, 330.75, 2.85425, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
  -- second block
 (137532, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1939.31, -14.8254, 330.024, 4.55329, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137533, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 2010.12, 2.20614, 329.767, 5.43627, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137534, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1995.04, -22.2426, 326.203, 4.86913, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137535, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1991.56, -57.7423, 328.258, 3.47212, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137536, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 1964.52, -12.9372, 326.334, 4.11093, 180, 5, 0, 12600, 0, 1, 0, 0, 0),
 (137537, @npc_ominous_cloud, 603, 3, 1, 28549, 0, 2028, -50.5019, 331.014, 4.25514, 180, 5, 0, 12600, 0, 1, 0, 0, 0);

Actual Deletion:
*/
DELETE FROM `creature` WHERE (`guid` BETWEEN 137532 AND 137537) AND `id` = @npc_ominous_cloud;

-- Change spawndist for greater moving area as there are now much less clouds and would be too easy now
UPDATE `creature` SET spawndist = 15 WHERE `id` = @npc_ominous_cloud;