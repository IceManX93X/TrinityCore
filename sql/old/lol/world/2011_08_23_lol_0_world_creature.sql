UPDATE `npc_spellclick_spells` SET `spell_id`=62309 WHERE `npc_entry`=33167;
UPDATE `creature` SET `spawntimesecs`=3 WHERE `id` IN (33062,33060,33109);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x10000000 WHERE `entry` IN (33062,33060,33109);

SET @GUID := 302702;

DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+2;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33062','603','2','1','25871','0','-717.889','-147.539','430.22','6.25408','3','0','0','504000','0','0','0','0','0'),
(@GUID+1,'33062','603','2','1','25871','0','-718.058','-136.512','430.017','0.00624','3','0','0','504000','0','0','0','0','0'),
(@GUID+2,'33062','603','2','1','25871','0','-717.993','-126.831','430.008','0.00257','3','0','0','504000','0','0','0','0','0');
