UPDATE `creature_template_addon` SET `auras`='28305' WHERE `entry`=19668; -- Shadowfiend: Mana Leech Aura
SET @guid := 303108;
SET @event := 85;

UPDATE `creature_template` SET `ScriptName`='npc_dark_iron_herald' WHERE `entry`=24536;
UPDATE `creature_template` SET `ScriptName`='npc_dark_iron_guzzler' WHERE `entry`=23709;
UPDATE `gameobject_questrelation` SET `id`=189989 WHERE `quest`=12020;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12020;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (3557,3558);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
('3557','0','0','0',''),
('3558','0','0','0','');

DELETE FROM `creature` WHERE `id`=24536;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid,'24536','1','1','1','0','0','1199.34','-4293.03','21.2255','2.15038','420','0','0','16026','0','0','0','0','0'),
(@guid+1,'24536','0','1','1','0','0','-5158.79','-604.12','398.199','5.00486','420','0','0','16026','0','0','0','0','0');

DELETE FROM `game_event_creature` WHERE `eventEntry`=@event;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(@event,@guid),
(@event,@guid+1);

DELETE FROM `game_event` WHERE `eventEntry`=@event;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`) VALUES
(@event,'2010-09-20 00:00:00','2020-12-31 06:00:00','30','8','0','Braufest - Angriff der Dunkeleisenzwerge','0');

UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216,`unit_flags`=`unit_flags`|16777216,`spell1`=50978,`spell2`=50980,`spell3`=50985,`spell4`=50983,`spell5`=54166,`VehicleId`=111,`Health_mod`=18,`Mana_mod`=12,`questItem1`=0,`AIName`='',`ScriptName`='' WHERE `entry`=28222;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=28222;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(28222,52082,12546,1,12546,1,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=16 AND `SourceEntry`=28222;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(16,0,28222,0,23,4282,0,0,0,'','Ride vehicle only in Area');
UPDATE `creature_template` SET `AIName`='PassiveAI' WHERE `entry`=16400;

