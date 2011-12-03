-- -------------------------------------------------------------------------------------
-- SAI for NPC's with Quests 'The Magical Kingdom of Dalaran' Quests #12794#12791#12796
-- -------------------------------------------------------------------------------------
-- Image of Archmage Aethas Sunreaver
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9513, `npcflag` = 3, `ScriptName` = '' WHERE `entry` IN (26471,29155,29159,29160,29162);
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9511, `npcflag` = 3, `ScriptName` = '' WHERE `entry` IN (26673,23729,27158,29158,29161);
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9780, `npcflag` = 3, `ScriptName` = '' WHERE `entry` = 29169;
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9513,9511,9780);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES
(9513,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,''),
(9511,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,''),
(9780,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,'');
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26471,29155,29159,29160,29162,26673,23729,27158,29158,29161,29169) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- HORDE --
-- Image of Archmage Aethas Sunreaver
(26471,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(26471,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
(26471,0,2,0,20,0,100,0,12066,0,0,0,28,47391,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12066 - Remove:Ley Line Information'),
(26471,0,3,0,20,0,100,0,12084,0,0,0,28,47473,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12084 - Remove:Ley Line Information'),
(26471,0,4,0,20,0,100,0,12110,0,0,0,28,47636,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12110 - Remove:Ley Line Information'),
-- Magistrix Kaelana
(29155,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29155,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Varenthas
(29159,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29159,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magistrix Phaelista
(29160,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29160,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Tyr'ganal
(29162,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29162,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- ALLIANCE --
-- Image of Archmage Modera
(26673,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(26673,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
(26673,0,2,0,20,0,100,0,12065,0,0,0,28,47391,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12065 - Remove:Ley Line Information'),
(26673,0,3,0,20,0,100,0,12083,0,0,0,28,47473,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12083 - Remove:Ley Line Information'),
(26673,0,4,0,20,0,100,0,12107,0,0,0,28,47636,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12107 - Remove:Ley Line Information'),
-- Baron Ulrik von Stromhearth
(23729,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(23729,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Vas the Unstable
(27158,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(27158,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Dath'omere
(29158,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29158,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magistrix Haelenai
(29161,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29161,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- NEUTRAL --
-- Magister Teronus III
(29169,0,0,1,62,0,100,0,9780,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29169,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip');
-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (9513,9511,9780);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,9513,0,0,28,12791,0,0,0,'','show Gossip - if Player has Quest 12791 completed'),
(15,9511,0,0,28,12794,0,0,0,'','show Gossip - if Player has Quest 12794 completed'),
(15,9780,0,0,28,12796,0,0,0,'','show Gossip - if Player has Quest 12796 completed'),
(15,9513,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet'),
(15,9511,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet'),
(15,9780,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet');