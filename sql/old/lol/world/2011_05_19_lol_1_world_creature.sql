-- Spawn High Admiral "Shelly" Jorrik at Newman's Landing
SET @guid = 230000;
SET @jelly = 26081;
SET @jelly_spawn = 3600; -- need random spawntimes...
SET @bruis = 4624;
SET @bruis_spawn = 300;

-- set correct faction (taken from Booty Bay Bruiser)
UPDATE `creature_template` SET `faction_A` = 121, `faction_H` = 121 WHERE `entry` = @jelly;

DELETE FROM `creature` WHERE `id` = @jelly;
REPLACE INTO creature (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid+0, @jelly, 0, 1, 1, 0, 0, -6377.893555, 1268.393433, 7.187962, 2.230113, @jelly_spawn, 0, 0, 3072, 0, 0, 0, 0, 0, 0),
(@guid+1, @bruis, 0, 1, 1, 0, 0, -6368.949707, 1270.554443, 7.187644, 2.257602, @bruis_spawn, 0, 0,16960, 0, 0, 0, 0, 0, 0),
(@guid+2, @bruis, 0, 1, 1, 0, 0, -6381.295898, 1259.823486, 7.187644, 2.289018, @bruis_spawn, 0, 0,16960, 0, 0, 0, 0, 0, 0);