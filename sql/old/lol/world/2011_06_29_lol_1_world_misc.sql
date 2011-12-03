SET @GO_GUID := 400027;

UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry`=188128;
UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=188129;

-- move one loremaster to stormwind
UPDATE `creature` SET `position_x`=-8833.497, `position_y`=864.7697, `position_z`=98.9, `orientation`=5.89 WHERE `guid`=94857;

-- add flame of the exodar
DELETE FROM `gameobject` WHERE `id`=188128;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID,'188128','530','1','1','-3796.45','-11503.7','-134.772','0.350275','0','0','0.174244','0.984703','300','0','1');

DELETE FROM `game_event_gameobject` WHERE `guid`=@GO_GUID;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID);

-- create flame items
DELETE FROM `spell_scripts` WHERE `id` IN (29137,29135,29126,46671,29139,29136,29138,46672);
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(29137,2,0,15,29101,2,0,0,0,0,0), -- flame of stormwind
(29135,2,0,15,29102,2,0,0,0,0,0), -- flame of ironforge
(29126,2,0,15,29099,2,0,0,0,0,0), -- flame of darnassus
(46671,2,0,15,46690,2,0,0,0,0,0), -- flame of the exodar
(29139,2,0,15,29133,2,0,0,0,0,0), -- flame of the undercity
(29136,2,0,15,29130,2,0,0,0,0,0), -- flame of orgrimmar
(29138,2,0,15,29132,2,0,0,0,0,0), -- flame of thunder bluff
(46672,2,0,15,46689,2,0,0,0,0,0); -- flame of silvermoon

-- correct some relations
DELETE FROM `creature_questrelation` WHERE `id`=16817 AND `quest`=11935;
DELETE FROM `creature_questrelation` WHERE `id`=16818 AND `quest`=11933;
UPDATE `creature_questrelation` SET `id`=16818 WHERE `quest`=9339;
UPDATE `creature_involvedrelation` SET `id`=16818 WHERE `quest`=9339;
UPDATE `creature_questrelation` SET `id`=16817 WHERE `quest`=9365;
UPDATE `creature_involvedrelation` SET `id`=16817 WHERE `quest`=9365;
