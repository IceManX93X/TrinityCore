-- Thorim Spawn
UPDATE `creature` SET `position_z`=440.331 WHERE `id`=32865;

-- Rare Cache of Winter
DELETE FROM `gameobject` WHERE `id` IN (194200,194201);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('400007','194200','603','1','1','1966.07','-220.64','432.687','0.465871','0','0','0.230835','0.972993','604800','0','1'),
('400008','194201','603','2','1','1966.07','-220.64','432.687','0.465871','0','0','0.230835','0.972993','604800','0','1');
