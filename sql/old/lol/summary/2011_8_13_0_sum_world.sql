-- Fix ICC 25 man loot:
UPDATE `creature_template` SET `lootid`=100002 WHERE `entry` IN (37655,38031,38057,38058,38059,38062,38063,38072,38073,38074,38075,38076,38098,38099,38100,38101,38102,38108,38110,38139,38197,38198,38258,38418,38445,38446,38479,38480,38481);
-- Fix itemid in the grey reference
UPDATE `reference_loot_template` SET `item`=33364 WHERE `entry`=35063 AND `item`=33346;

/* NPC entries:
14902 - Jin'rokh the Breaker 	- 6321			- Warriors and paladins
14903 - Al'tabim the All-Seeing - 6322			- Mages, warlocks and priests
14904 - Maywiki of Zuldazar 	- 6341			- Shamans and druids
14905 - Falthir the Sightless 	- @GOSSIP		- Rogues and hunters
 */
 
/* TO DO:
 * There is one missing condition. When you get an upgrade of one of the necklaces, you lose the necklace of the previous quest. (the quest always takes it) But that also makes the conditions meet and it will show the gossip that you lost a necklace.
 * There is currently no way to do this through conditions, so whenever you read this and think it's possible, feel free to!
 */
 
-- Vars
SET @GOSSIP = 21262; -- gossip_menu.entry - need 10
SET @SUB_PALADIN := @GOSSIP+1; -- Menu id for Paladins
SET @SUB_WARRIOR := @GOSSIP+2; -- Menu id for Warriors
SET @SUB_PRIEST := @GOSSIP+3; -- Menu id for Priests
SET @SUB_WARLOCK := @GOSSIP+4; -- Menu id for Warlocks
SET @SUB_MAGE := @GOSSIP+5; -- Menu id for Mages
SET @SUB_SHAMAN := @GOSSIP+6; -- Menu id for Shamans
SET @SUB_DRUID := @GOSSIP+7; -- Menu id for Druids
SET @SUB_ROGUE := @GOSSIP+8; -- Menu id for Rogues
SET @SUB_HUNTER := @GOSSIP+9; -- Menu id for Hunters
 
-- Insert gossip options itself
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+0 AND `text_id`=7556;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GOSSIP+0,7556);

-- Set the gossip_menu for Falthir the Sightless
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP+0 WHERE `entry`=14905; -- Falthir the Sightless

-- Actual menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6321,6322,6341,@GOSSIP,@SUB_PALADIN,@SUB_WARRIOR,@SUB_PRIEST,@SUB_WARLOCK,@SUB_MAGE,@SUB_SHAMAN,@SUB_DRUID,@SUB_ROGUE,@SUB_HUNTER);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
-- Main menu for Jin'rokh
(6321,0,0,"Jin\'rokh, I need assistance in recovering a piece of my Freethinker's outfit.",1,3,@SUB_PALADIN,0,0,0,''), -- Main menu option for Paladins
(6321,1,0,"Jin\'rokh, I need assistance in recovering a piece of my Vindicator's outfit.",1,3,@SUB_WARRIOR,0,0,0,''), -- Main menu option for Warriors
-- PALADIN
(@SUB_PALADIN,0,0,"I seem to have misplaced my Zandalar Freethinker's Armguards. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,1,0,"I seem to have misplaced my Zandalar Freethinker's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,2,0,"I seem to have misplaced my Zandalar Freethinker's Breastplate. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,3,0,"I seem to have misplaced my Hero's Brand. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,4,0,"I seem to have misplaced my Heathen's Brand. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_PALADIN,5,0,"I seem to have misplaced my Heathen's Brand. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_PALADIN,6,0,"I seem to have misplaced my Heathen's Brand. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- WARRIOR
(@SUB_WARRIOR,0,0,"I seem to have misplaced my Zandalar Vindicator's Armguards. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,1,0,"I seem to have misplaced my Zandalar Vindicator's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,2,0,"I seem to have misplaced my Zandalar Vindicator's Breastplate. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,3,0,"I seem to have misplaced my Rage of Mugamba. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,4,0,"I seem to have misplaced my Strength of Mugamba. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_WARRIOR,5,0,"I seem to have misplaced my Strength of Mugamba. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_WARRIOR,6,0,"I seem to have misplaced my Strength of Mugamba. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- Main menu for Al'tabim
(6322,0,0,"Al\'tabim, I need assistance in recovering a piece of my Confessor's outfit.",1,3,@SUB_PRIEST,0,0,0,''), -- Main menu option for Priests
(6322,1,0,"Al\'tabim, I need assistance in recovering a piece of my Demoniac's outfit.",1,3,@SUB_WARLOCK,0,0,0,''), -- Main menu option for Warlocks
(6322,2,0,"Al\'tabim, I need assistance in recovering a piece of my Illusionist's outfit.",1,3,@SUB_MAGE,0,0,0,''), -- Main menu option for Mages
-- PRIEST
(@SUB_PRIEST,0,0,"I seem to have misplaced my Zandalar Confessor's Bindings. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,1,0,"I seem to have misplaced my Zandalar Confessor's Mantle. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,2,0,"I seem to have misplaced my Zandalar Confessor's Wraps. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,3,0,"I seem to have misplaced my All-Seeing Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,4,0,"I seem to have misplaced my Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_PRIEST,5,0,"I seem to have misplaced my Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_PRIEST,6,0,"I seem to have misplaced my Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- WARLOCK
(@SUB_WARLOCK,0,0,"I seem to have misplaced my Zandalar Demoniac's Robe. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,1,0,"I seem to have misplaced my Zandalar Demoniac's Mantle. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,2,0,"I seem to have misplaced my Zandalar Demoniac's Wraps. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,3,0,"I seem to have misplaced my Kezan's Unstoppable Taint. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,4,0,"I seem to have misplaced my Kezan's Taint. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_WARLOCK,5,0,"I seem to have misplaced my Kezan's Taint. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_WARLOCK,6,0,"I seem to have misplaced my Kezan's Taint. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- MAGE
(@SUB_MAGE,0,0,"I seem to have misplaced my Zandalar Illusionist's Robe. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,1,0,"I seem to have misplaced my Zandalar Illusionist's Mantle. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,2,0,"I seem to have misplaced my Zandalar Illusionist's Wraps. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,3,0,"I seem to have misplaced my Jewel of Kajaro. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,4,0,"I seem to have misplaced my Pebble of Kajaro. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_MAGE,5,0,"I seem to have misplaced my Pebble of Kajaro. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_MAGE,6,0,"I seem to have misplaced my Pebble of Kajaro. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- Main menu for Maywiki
(6341,0,0,"Maywiki, I need assistance in recovering a piece of my Augur's outfit.",1,3,@SUB_SHAMAN,0,0,0,''), -- Main menu option for Shamans
(6341,1,0,"Maywiki, I need assistance in recovering a piece of my Haruspex's outfit.",1,3,@SUB_DRUID,0,0,0,''), -- Main menu option for Druids
-- SHAMAN
(@SUB_SHAMAN,0,0,"I seem to have misplaced my Zandalar Augur's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,1,0,"I seem to have misplaced my Zandalar Augur's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,2,0,"I seem to have misplaced my Zandalar Augur's Hauberk. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,3,0,"I seem to have misplaced my Unmarred Vision of Voodress. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,4,0,"I seem to have misplaced my Vision of Voodress. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_SHAMAN,5,0,"I seem to have misplaced my Vision of Voodress. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_SHAMAN,6,0,"I seem to have misplaced my Vision of Voodress. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- DRUID
(@SUB_DRUID,0,0,"I seem to have misplaced my Zandalar Haruspex's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,1,0,"I seem to have misplaced my Zandalar Haruspex's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,2,0,"I seem to have misplaced my Zandalar Haruspex's Tunic. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,3,0,"I seem to have misplaced my Pristine Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,4,0,"I seem to have misplaced my Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_DRUID,5,0,"I seem to have misplaced my Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_DRUID,6,0,"I seem to have misplaced my Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- Main menu for Falthir
(@GOSSIP,0,0,"Falthir, I need assistance in recovering a piece of my Madcap's outfit.",1,3,@SUB_ROGUE,0,0,0,''), -- Main menu option for Rogues
(@GOSSIP,1,0,"Falthir, I need assistance in recovering a piece of my Predator's outfit.",1,3,@SUB_HUNTER,0,0,0,''), -- Main menu option for Hunters
-- ROGUE
(@SUB_ROGUE,0,0,"I seem to have misplaced my Zandalar Madcap's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,1,0,"I seem to have misplaced my Zandalar Madcap's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,2,0,"I seem to have misplaced my Zandalar Madcap's Tunic. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,3,0,"I seem to have misplaced my Zandalarian Shadow Mastery Talisman. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,4,0,"I seem to have misplaced my Zandalarian Shadow Talisman. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_ROGUE,5,0,"I seem to have misplaced my Zandalarian Shadow Talisman. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_ROGUE,6,0,"I seem to have misplaced my Zandalarian Shadow Talisman. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- HUNTER
(@SUB_HUNTER,0,0,"I seem to have misplaced my Zandalar Predator's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,1,0,"I seem to have misplaced my Zandalar Predator's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,2,0,"I seem to have misplaced my Zandalar Predator's Tunic. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,3,0,"I seem to have misplaced my Maelstrom's Wrath. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,4,0,"I seem to have misplaced my Malestrom's Tendril. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_HUNTER,5,0,"I seem to have misplaced my Malestrom's Tendril. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_HUNTER,6,0,"I seem to have misplaced my Malestrom's Tendril. Can you help?",1,3,0,0,0,0,''); -- Blue (2) necklace

-- Jin'rokh the Breaker SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14902;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14902;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Paladin
(14902,0,0,0,62,0,100,0,@SUB_PALADIN,0,0,0,56,19827,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 0 give item Zandalar Freethinker''s Armguards'),
(14902,0,1,0,62,0,100,0,@SUB_PALADIN,1,0,0,56,19826,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 1 give item Zandalar Freethinker''s Belt'),
(14902,0,2,0,62,0,100,0,@SUB_PALADIN,2,0,0,56,19825,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 2 give item Zandalar Freethinker''s Breastplate'),
(14902,0,3,0,62,0,100,0,@SUB_PALADIN,3,0,0,56,19588,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 3 give item Hero''s Brand'),
(14902,0,4,0,62,0,100,0,@SUB_PALADIN,4,0,0,56,19579,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 4 give item Heathen''s Brand (green)'),
(14902,0,5,0,62,0,100,0,@SUB_PALADIN,5,0,0,56,19585,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 5 give item Heathen''s Brand (blue (1))'),
(14902,0,6,0,62,0,100,0,@SUB_PALADIN,6,0,0,56,19586,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 6 give item Heathen''s Brand (blue (2))'),
-- Closing gossips
(14902,0,7,0,62,0,100,0,@SUB_PALADIN,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,8,0,62,0,100,0,@SUB_PALADIN,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,9,0,62,0,100,0,@SUB_PALADIN,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,10,0,62,0,100,0,@SUB_PALADIN,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,11,0,62,0,100,0,@SUB_PALADIN,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,12,0,62,0,100,0,@SUB_PALADIN,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,13,0,62,0,100,0,@SUB_PALADIN,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
-- Warrior
(14902,0,14,0,62,0,100,0,@SUB_WARRIOR,0,0,0,56,19824,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 0 give item Zandalar Vindicator''s Armguards'),
(14902,0,15,0,62,0,100,0,@SUB_WARRIOR,1,0,0,56,19823,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 1 give item Zandalar Vindicator''s Belt'),
(14902,0,16,0,62,0,100,0,@SUB_WARRIOR,2,0,0,56,19822,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 2 give item Zandalar Vindicator''s Breastplate'),
(14902,0,17,0,62,0,100,0,@SUB_WARRIOR,3,0,0,56,19577,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 3 give item Rage of Mugamba'),
(14902,0,18,0,62,0,100,0,@SUB_WARRIOR,4,0,0,56,19574,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 4 give item Strength of Mugamba (green)'),
(14902,0,19,0,62,0,100,0,@SUB_WARRIOR,5,0,0,56,19575,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 5 give item Strength of Mugamba (blue (1))'),
(14902,0,20,0,62,0,100,0,@SUB_WARRIOR,6,0,0,56,19576,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 6 give item Strength of Mugamba (blue (2))'),
-- Closing gossips
(14902,0,21,0,62,0,100,0,@SUB_WARRIOR,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,22,0,62,0,100,0,@SUB_WARRIOR,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,23,0,62,0,100,0,@SUB_WARRIOR,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,24,0,62,0,100,0,@SUB_WARRIOR,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,25,0,62,0,100,0,@SUB_WARRIOR,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,26,0,62,0,100,0,@SUB_WARRIOR,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,27,0,62,0,100,0,@SUB_WARRIOR,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip');

-- Al''tabim the All-Seeing SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14903;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14903;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Priest
(14903,0,0,0,62,0,100,0,@SUB_PRIEST,0,0,0,56,19842,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 0 give item Zandalar Confessor''s Bindings'),
(14903,0,1,0,62,0,100,0,@SUB_PRIEST,1,0,0,56,19841,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 1 give item Zandalar Confessor''s Mantle'),
(14903,0,2,0,62,0,100,0,@SUB_PRIEST,2,0,0,56,19843,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 2 give item Zandalar Confessor''s Wraps'),
(14903,0,3,0,62,0,100,0,@SUB_PRIEST,3,0,0,56,19594,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 3 give item The All-Seeing Eye of Zuldazar'),
(14903,0,4,0,62,0,100,0,@SUB_PRIEST,4,0,0,56,19591,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 4 give item The Eye of Zuldazar (green)'),
(14903,0,5,0,62,0,100,0,@SUB_PRIEST,5,0,0,56,19592,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 5 give item The Eye of Zuldazar (blue (1))'),
(14903,0,6,0,62,0,100,0,@SUB_PRIEST,6,0,0,56,19593,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 6 give item The Eye of Zuldazar (blue (2))'),
-- Closing gossips
(14903,0,7,0,62,0,100,0,@SUB_PRIEST,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,8,0,62,0,100,0,@SUB_PRIEST,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,9,0,62,0,100,0,@SUB_PRIEST,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,10,0,62,0,100,0,@SUB_PRIEST,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,11,0,62,0,100,0,@SUB_PRIEST,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,12,0,62,0,100,0,@SUB_PRIEST,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,13,0,62,0,100,0,@SUB_PRIEST,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
-- Warlock
(14903,0,14,0,62,0,100,0,@SUB_WARLOCK,0,0,0,56,19849,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 0 give item Zandalar Demoniac''s Bindings'),
(14903,0,15,0,62,0,100,0,@SUB_WARLOCK,1,0,0,56,20033,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 1 give item Zandalar Demoniac''s Mantle'),
(14903,0,16,0,62,0,100,0,@SUB_WARLOCK,2,0,0,56,19848,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 2 give item Zandalar Demoniac''s Wraps'),
(14903,0,17,0,62,0,100,0,@SUB_WARLOCK,3,0,0,56,19605,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 3 give item The All-Seeing Eye of Zuldazar'),
(14903,0,18,0,62,0,100,0,@SUB_WARLOCK,4,0,0,56,19602,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 4 give item Kezan''s Taint (green)'),
(14903,0,19,0,62,0,100,0,@SUB_WARLOCK,5,0,0,56,19603,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 5 give item Kezan''s Taint (blue (1))'),
(14903,0,20,0,62,0,100,0,@SUB_WARLOCK,6,0,0,56,19604,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 6 give item Kezan''s Taint (blue (2))'),
-- Closing gossips
(14903,0,21,0,62,0,100,0,@SUB_WARLOCK,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,22,0,62,0,100,0,@SUB_WARLOCK,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,23,0,62,0,100,0,@SUB_WARLOCK,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,24,0,62,0,100,0,@SUB_WARLOCK,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,25,0,62,0,100,0,@SUB_WARLOCK,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,26,0,62,0,100,0,@SUB_WARLOCK,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,27,0,62,0,100,0,@SUB_WARLOCK,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
-- Mage
(14903,0,28,0,62,0,100,0,@SUB_MAGE,0,0,0,56,19845,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 0 give item Zandalar Illusionist''s Mantle'),
(14903,0,29,0,62,0,100,0,@SUB_MAGE,1,0,0,56,20034,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 1 give item Zandalar Illusionist''s Robes'),
(14903,0,30,0,62,0,100,0,@SUB_MAGE,2,0,0,56,19846,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 2 give item Zandalar Illusionist''s Wraps'),
(14903,0,31,0,62,0,100,0,@SUB_MAGE,3,0,0,56,19601,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 3 give item Jewel of Kajaro'),
(14903,0,32,0,62,0,100,0,@SUB_MAGE,4,0,0,56,19598,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 4 give item Pebble of Kajaro (green)'),
(14903,0,33,0,62,0,100,0,@SUB_MAGE,5,0,0,56,19599,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 5 give item Pebble of Kajaro (blue (1))'),
(14903,0,34,0,62,0,100,0,@SUB_MAGE,6,0,0,56,19600,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 6 give item Pebble of Kajaro (blue (2))'),
-- Closing gossips
(14903,0,35,0,62,0,100,0,@SUB_MAGE,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,36,0,62,0,100,0,@SUB_MAGE,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,37,0,62,0,100,0,@SUB_MAGE,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,38,0,62,0,100,0,@SUB_MAGE,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,39,0,62,0,100,0,@SUB_MAGE,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,40,0,62,0,100,0,@SUB_MAGE,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,41,0,62,0,100,0,@SUB_MAGE,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip');

-- Maywiki of Zuldazar SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14904;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14904;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Shaman
(14904,0,0,0,62,0,100,0,@SUB_SHAMAN,0,0,0,56,19829,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 0 give item Zandalar Augur''s Belt'),
(14904,0,1,0,62,0,100,0,@SUB_SHAMAN,1,0,0,56,19830,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 1 give item Zandalar Augur''s Bracers'),
(14904,0,2,0,62,0,100,0,@SUB_SHAMAN,2,0,0,56,19828,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 2 give item Zandalar Augur''s Hauberk'),
(14904,0,3,0,62,0,100,0,@SUB_SHAMAN,3,0,0,56,19609,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 3 give item Unmarred Vision of Voodress'),
(14904,0,4,0,62,0,100,0,@SUB_SHAMAN,4,0,0,56,19606,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 4 give item Vision of Voodress (green)'),
(14904,0,5,0,62,0,100,0,@SUB_SHAMAN,5,0,0,56,19607,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 5 give item Vision of Voodress (blue (1))'),
(14904,0,6,0,62,0,100,0,@SUB_SHAMAN,6,0,0,56,19608,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 6 give item Vision of Voodress (blue (2))'),
-- Closing gossips
(14904,0,7,0,62,0,100,0,@SUB_SHAMAN,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,8,0,62,0,100,0,@SUB_SHAMAN,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,9,0,62,0,100,0,@SUB_SHAMAN,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,10,0,62,0,100,0,@SUB_SHAMAN,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,11,0,62,0,100,0,@SUB_SHAMAN,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,12,0,62,0,100,0,@SUB_SHAMAN,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,13,0,62,0,100,0,@SUB_SHAMAN,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
-- Druid
(14904,0,14,0,62,0,100,0,@SUB_DRUID,0,0,0,56,19839,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 0 give item Zandalar Haruspex''s Belt'),
(14904,0,15,0,62,0,100,0,@SUB_DRUID,1,0,0,56,19840,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 1 give item Zandalar Haruspex''s Bracers'),
(14904,0,16,0,62,0,100,0,@SUB_DRUID,2,0,0,56,19838,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 2 give item Zandalar Haruspex''s Tunic'),
(14904,0,17,0,62,0,100,0,@SUB_DRUID,3,0,0,56,19613,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 3 give item Pristine Enchanted South Seas Kelp'),
(14904,0,18,0,62,0,100,0,@SUB_DRUID,4,0,0,56,19610,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 4 give item Enchanted South Seas Kelp (green)'),
(14904,0,19,0,62,0,100,0,@SUB_DRUID,5,0,0,56,19611,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 5 give item Enchanted South Seas Kelp (blue (1))'),
(14904,0,20,0,62,0,100,0,@SUB_DRUID,6,0,0,56,19612,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 6 give item Enchanted South Seas Kelp (blue (2))'),
-- Closing gossips
(14904,0,21,0,62,0,100,0,@SUB_DRUID,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,22,0,62,0,100,0,@SUB_DRUID,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,23,0,62,0,100,0,@SUB_DRUID,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,24,0,62,0,100,0,@SUB_DRUID,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,25,0,62,0,100,0,@SUB_DRUID,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,26,0,62,0,100,0,@SUB_DRUID,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,27,0,62,0,100,0,@SUB_DRUID,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip');

-- Falthir the Sightless SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14905;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14905;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Rogue
(14905,0,0,0,62,0,100,0,@SUB_ROGUE,0,0,0,56,19836,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 0 give item Zandalar Madcap''s Bracers'),
(14905,0,1,0,62,0,100,0,@SUB_ROGUE,1,0,0,56,19835,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 1 give item Zandalar Madcap''s Tunic'),
(14905,0,2,0,62,0,100,0,@SUB_ROGUE,2,0,0,56,19834,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 2 give item Zandalar Augur''s Belt'),
(14905,0,3,0,62,0,100,0,@SUB_ROGUE,3,0,0,56,19617,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 3 give item Zandalarian Shadow Mastery Talisman'),
(14905,0,4,0,62,0,100,0,@SUB_ROGUE,4,0,0,56,19614,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 4 give item Zandalarian Shadow Talisman (green)'),
(14905,0,5,0,62,0,100,0,@SUB_ROGUE,5,0,0,56,19615,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 5 give item Zandalarian Shadow Talisman (blue (1))'),
(14905,0,6,0,62,0,100,0,@SUB_ROGUE,6,0,0,56,19616,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 6 give item Zandalarian Shadow Talisman (blue (2))'),
-- Closing gossips
(14905,0,7,0,62,0,100,0,@SUB_ROGUE,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,8,0,62,0,100,0,@SUB_ROGUE,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,9,0,62,0,100,0,@SUB_ROGUE,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,10,0,62,0,100,0,@SUB_ROGUE,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,11,0,62,0,100,0,@SUB_ROGUE,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,12,0,62,0,100,0,@SUB_ROGUE,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,13,0,62,0,100,0,@SUB_ROGUE,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
-- Hunter
(14905,0,14,0,62,0,100,0,@SUB_HUNTER,0,0,0,56,19832,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 0 give item Zandalar Predator''s Belt'),
(14905,0,15,0,62,0,100,0,@SUB_HUNTER,1,0,0,56,19833,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 1 give item Zandalar Predator''s Bracers'),
(14905,0,16,0,62,0,100,0,@SUB_HUNTER,2,0,0,56,19831,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 2 give item Zandalar Predator''s Mantle'),
(14905,0,17,0,62,0,100,0,@SUB_HUNTER,3,0,0,56,19621,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 3 give item Maelstrom''s Wrath'),
(14905,0,18,0,62,0,100,0,@SUB_HUNTER,4,0,0,56,19618,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 4 give item Maelstrom''s Tendril (green)'),
(14905,0,19,0,62,0,100,0,@SUB_HUNTER,5,0,0,56,19619,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 5 give item Maelstrom''s Tendril (blue (1))'),
(14905,0,20,0,62,0,100,0,@SUB_HUNTER,6,0,0,56,19620,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 6 give item Maelstrom''s Tendril (blue (2))'),
-- Closing gossips
(14905,0,21,0,62,0,100,0,@SUB_HUNTER,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,22,0,62,0,100,0,@SUB_HUNTER,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,23,0,62,0,100,0,@SUB_HUNTER,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,24,0,62,0,100,0,@SUB_HUNTER,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,25,0,62,0,100,0,@SUB_HUNTER,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,26,0,62,0,100,0,@SUB_HUNTER,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,27,0,62,0,100,0,@SUB_HUNTER,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip');

-- Conditions for gossip menu options
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (6321,6322,6341,@GOSSIP,@SUB_PALADIN,@SUB_WARRIOR,@SUB_PRIEST,@SUB_WARLOCK,@SUB_MAGE,@SUB_SHAMAN,@SUB_DRUID,@SUB_ROGUE,@SUB_HUNTER);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
-- PALADIN CONDITIONS
-- Zandalar Freethinker's Armguards
(15,@SUB_PALADIN,0,0,8,8053,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Freethinker's Armguards is rewarded"),
(15,@SUB_PALADIN,0,0,26,19827,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Freethinker's Armguards"),
-- Zandalar Freethinker's Belt
(15,@SUB_PALADIN,1,0,8,8054,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Freethinker's Belt is rewarded"),
(15,@SUB_PALADIN,1,0,26,19826,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Freethinker's Belt"),
-- Zandalar Freethinker's Breastplate
(15,@SUB_PALADIN,2,0,8,8055,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Freethinker's Breastplate is rewarded"),
(15,@SUB_PALADIN,2,0,26,19825,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Freethinker's Breastplate"),
-- Hero's Brand
(15,@SUB_PALADIN,3,0,8,8048,0,0,0,"Only allow gossip option to be visible if quest The Hero's Brand is rewarded"),
(15,@SUB_PALADIN,3,0,26,19588,1,0,0,"Only allow gossip option to be visible if player does not have item Hero's Brand"),
-- Heathen's Band (green)
(15,@SUB_PALADIN,4,0,8,8045,0,0,0,"Only allow gossip option to be visible if quest The Heathen's Brand is rewarded"),
(15,@SUB_PALADIN,4,0,26,19579,1,0,0,"Only allow gossip option to be visible if player does not have item Heathen's Brand"),
-- Heathen's Band (blue - one)
(15,@SUB_PALADIN,5,0,8,8046,0,0,0,"Only allow gossip option to be visible if quest The Heathen's Brand is rewarded"),
(15,@SUB_PALADIN,5,0,26,19585,1,0,0,"Only allow gossip option to be visible if player does not have item Heathen's Brand"),
-- Heathen's Band (blue - two)
(15,@SUB_PALADIN,6,0,8,8047,0,0,0,"Only allow gossip option to be visible if quest The Heathen's Brand is rewarded"),
(15,@SUB_PALADIN,6,0,26,19586,1,0,0,"Only allow gossip option to be visible if player does not have item Heathen's Brand"),
-- WARRIOR CONDITIONS
-- Zandalar Vindicator's Armguards
(15,@SUB_WARRIOR,0,0,8,8058,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Armguards is rewarded"),
(15,@SUB_WARRIOR,0,0,26,19824,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Armguards"),
-- Zandalar Vindicator's Belt
(15,@SUB_WARRIOR,1,0,8,8078,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Belt is rewarded"),
(15,@SUB_WARRIOR,1,0,26,19823,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Belt"),
-- Zandalar Vindicator's Breastplate
(15,@SUB_WARRIOR,2,0,8,8079,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Breastplate is rewarded"),
(15,@SUB_WARRIOR,2,0,26,19822,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Breastplate"),
-- Rage of Mugamba
(15,@SUB_WARRIOR,3,0,8,8044,0,0,0,"Only allow gossip option to be visible if quest The Rage of Mugamba is rewarded"),
(15,@SUB_WARRIOR,3,0,26,19577,1,0,0,"Only allow gossip option to be visible if player does not have item Rage of Mugamba"),
-- Strength of Mugamba (green)
(15,@SUB_WARRIOR,4,0,8,8041,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,@SUB_WARRIOR,4,0,26,19574,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- Strength of Mugamba (blue - one)
(15,@SUB_WARRIOR,5,0,8,8042,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,@SUB_WARRIOR,5,0,26,19575,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- Strength of Mugamba (blue - two)
(15,@SUB_WARRIOR,6,0,8,8043,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,@SUB_WARRIOR,6,0,26,19576,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- PRIEST CONDITIONS
-- Zandalar Confessor's Bindings
(15,@SUB_PRIEST,0,0,8,8070,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Bindings is rewarded"),
(15,@SUB_PRIEST,0,0,26,19842,1,0,0,"Only allow gossip option to be visible if player does not have item  Zandalar Confessor's Bindings"),
-- Zandalar Confessor's Mantle
(15,@SUB_PRIEST,1,0,8,8071,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Mantle is rewarded"),
(15,@SUB_PRIEST,1,0,26,19841,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Mantle"),
-- Zandalar Confessor's Wraps
(15,@SUB_PRIEST,2,0,8,8061,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Wraps is rewarded"),
(15,@SUB_PRIEST,2,0,26,19843,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Wraps"),
-- The All-Seeing Eye of Zuldazar
(15,@SUB_PRIEST,3,0,8,8052,0,0,0,"Only allow gossip option to be visible if quest The All-Seeing Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,3,0,26,19594,1,0,0,"Only allow gossip option to be visible if player does not have item The All-Seeing Eye of Zuldazar"),
-- The Eye of Zuldazar (green)
(15,@SUB_PRIEST,4,0,8,8049,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,4,0,26,19591,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- The Eye of Zuldazar (blue - one)
(15,@SUB_PRIEST,5,0,8,8050,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,5,0,26,19592,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- The Eye of Zuldazar (blue - two)
(15,@SUB_PRIEST,6,0,8,8051,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,6,0,26,19593,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- WARLOCK CONDITIONS
-- Zandalar Demoniac's Mantle
(15,@SUB_WARLOCK,0,0,8,8076,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Mantle is rewarded"),
(15,@SUB_WARLOCK,0,0,26,19849,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Mantle"),
-- Zandalar Demoniac's Robe
(15,@SUB_WARLOCK,1,0,8,8077,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Robes is rewarded"),
(15,@SUB_WARLOCK,1,0,26,20033,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Robe"),
-- Zandalar Demoniac's Wraps
(15,@SUB_WARLOCK,2,0,8,8059,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Wraps is rewarded"),
(15,@SUB_WARLOCK,2,0,26,19848,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Wraps"),
-- Kezan's Unstoppable Taint
(15,@SUB_WARLOCK,3,0,8,8109,0,0,0,"Only allow gossip option to be visible if quest Kezan's Unstoppable Taint is rewarded"),
(15,@SUB_WARLOCK,3,0,26,19605,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Unstoppable Taint"),
-- Kezan's Taint (green)
(15,@SUB_WARLOCK,4,0,8,8106,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,@SUB_WARLOCK,4,0,26,19602,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- Kezan's Taint (blue - one)
(15,@SUB_WARLOCK,5,0,8,8107,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,@SUB_WARLOCK,5,0,26,19603,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- Kezan's Taint (blue - two)
(15,@SUB_WARLOCK,6,0,8,8108,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,@SUB_WARLOCK,6,0,26,19604,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- MAGE CONDITIONS
-- Zandalar Illusionist's Mantle
(15,@SUB_MAGE,0,0,8,8068,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Mantle is rewarded"),
(15,@SUB_MAGE,0,0,26,19845,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Mantle"),
-- Zandalar Illusionist's Robe
(15,@SUB_MAGE,1,0,8,8069,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Robes is rewarded"),
(15,@SUB_MAGE,1,0,26,20034,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Robe"),
-- Zandalar Illusionist's Wraps
(15,@SUB_MAGE,2,0,8,8060,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Wraps is rewarded"),
(15,@SUB_MAGE,2,0,26,19846,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Wraps"),
-- Jewel of Kajaro
(15,@SUB_MAGE,3,0,8,8104,0,0,0,"Only allow gossip option to be visible if quest The Jewel of Kajaro is rewarded"),
(15,@SUB_MAGE,3,0,26,19601,1,0,0,"Only allow gossip option to be visible if player does not have item Jewel of Kajaro"),
-- Pebble of Kajaro (green)
(15,@SUB_MAGE,4,0,8,8101,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,@SUB_MAGE,4,0,26,19598,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- Pebble of Kajaro (blue - one)
(15,@SUB_MAGE,5,0,8,8102,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,@SUB_MAGE,5,0,26,19599,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- Pebble of Kajaro (blue - two)
(15,@SUB_MAGE,6,0,8,8103,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,@SUB_MAGE,6,0,26,19600,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- SHAMAN CONDITIONS
-- Zandalar Augur's Belt
(15,@SUB_SHAMAN,0,0,8,8074,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Belt is rewarded"),
(15,@SUB_SHAMAN,0,0,26,19829,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Belt"),
-- Zandalar Augur's Bracers
(15,@SUB_SHAMAN,1,0,8,8056,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Bracers is rewarded"),
(15,@SUB_SHAMAN,1,0,26,19830,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Bracers"),
-- Zandalar Augur's Hauberk
(15,@SUB_SHAMAN,2,0,8,8075,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Hauberk is rewarded"),
(15,@SUB_SHAMAN,2,0,26,19828,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Hauberk"),
-- Unmarred Vision of Voodress
(15,@SUB_SHAMAN,3,0,8,8119,0,0,0,"Only allow gossip option to be visible if quest The Unmarred Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,3,0,26,19609,1,0,0,"Only allow gossip option to be visible if player does not have item Unmarred Vision of Voodress"),
-- Vision of Voodress (green)
(15,@SUB_SHAMAN,4,0,8,8116,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,4,0,26,19606,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- Vision of Voodress (blue - one)
(15,@SUB_SHAMAN,5,0,8,8117,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,5,0,26,19607,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- Vision of Voodress (blue - two)
(15,@SUB_SHAMAN,6,0,8,8118,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,6,0,26,19608,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- DRUID CONDITIONS
-- Zandalar Haruspex's Belt
(15,@SUB_DRUID,0,0,8,8064,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Belt is rewarded"),
(15,@SUB_DRUID,0,0,26,19839,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Belt"),
-- Zandalar Haruspex's Bracers
(15,@SUB_DRUID,1,0,8,8057,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Bracers is rewarded"),
(15,@SUB_DRUID,1,0,26,19840,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Bracers"),
-- Zandalar Haruspex's Tunic
(15,@SUB_DRUID,2,0,8,8065,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Tunic is rewarded"),
(15,@SUB_DRUID,2,0,26,19838,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Tunic"),
-- Pristine Enchanted South Seas Kelp
(15,@SUB_DRUID,3,0,8,8113,0,0,0,"Only allow gossip option to be visible if quest Pristine Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,3,0,26,19613,1,0,0,"Only allow gossip option to be visible if player does not have item Pristine Enchanted South Seas Kelp"),
-- Enchanted South Seas Kelp (green)
(15,@SUB_DRUID,4,0,8,8110,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,4,0,26,19610,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
-- Enchanted South Seas Kelp (blue - one)
(15,@SUB_DRUID,5,0,8,8111,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,5,0,26,19611,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
-- Enchanted South Seas Kelp (blue - two)
(15,@SUB_DRUID,6,0,8,8112,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,6,0,26,19612,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
-- ROGUE CONDITIONS
-- Zandalar Madcap's Bracers
(15,@SUB_ROGUE,0,0,8,8063,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Bracers is rewarded"),
(15,@SUB_ROGUE,0,0,26,19836,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Bracers"),
-- Zandalar Madcap's Mantle
(15,@SUB_ROGUE,1,0,8,8072,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Mantle is rewarded"),
(15,@SUB_ROGUE,1,0,26,19835,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Mantle"),
-- Zandalar Madcap's Tunic
(15,@SUB_ROGUE,2,0,8,8073,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Tunic is rewarded"),
(15,@SUB_ROGUE,2,0,26,19834,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Tunic"),
-- Zandalarian Shadow Mastery Talisman
(15,@SUB_ROGUE,3,0,8,8144,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Mastery Talisman is rewarded"),
(15,@SUB_ROGUE,3,0,26,19617,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Mastery Talisman"),
-- Zandalarian Shadow Talisman (green)
(15,@SUB_ROGUE,4,0,8,8141,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@SUB_ROGUE,4,0,26,19614,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- Zandalarian Shadow Talisman (blue - one)
(15,@SUB_ROGUE,5,0,8,8142,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@SUB_ROGUE,5,0,26,19615,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- Zandalarian Shadow Talisman (blue - two)
(15,@SUB_ROGUE,6,0,8,8143,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@SUB_ROGUE,6,0,26,19616,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- HUNTER CONDITIONS
-- Zandalar Predator's Belt
(15,@SUB_HUNTER,0,0,8,8066,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Belt is rewarded"),
(15,@SUB_HUNTER,0,0,26,19832,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Belt"),
-- Zandalar Predator's Bracers
(15,@SUB_HUNTER,1,0,8,8062,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Bracers is rewarded"),
(15,@SUB_HUNTER,1,0,26,19833,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Bracers"),
-- Zandalar Predator's Mantle
(15,@SUB_HUNTER,2,0,8,8067,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Mantle is rewarded"),
(15,@SUB_HUNTER,2,0,26,19831,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Mantle"),
-- Maelstrom's Wrath
(15,@SUB_HUNTER,3,0,8,8148,0,0,0,"Only allow gossip option to be visible if quest Maelstrom's Wrath is rewarded"),
(15,@SUB_HUNTER,3,0,26,19621,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Wrath"),
-- Maelstrom's Tendril (green)
(15,@SUB_HUNTER,4,0,8,8145,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@SUB_HUNTER,4,0,26,19618,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
-- Maelstrom's Tendril (blue - one)
(15,@SUB_HUNTER,5,0,8,8146,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@SUB_HUNTER,5,0,26,19619,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
-- Maelstrom's Tendril (blue - two)
(15,@SUB_HUNTER,6,0,8,8147,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@SUB_HUNTER,6,0,26,19620,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
-- NOTE: THESE ARE GROUPED CONDITIONS!
-- EITHER ONE OF THE REQUIREMENTS MUST BE MET FOR THE GOSSIP TO BE VISIBLE!
-- Conditions for gossip main menu of Jin''rokh the Breaker
-- Paladin main menu conditions
(15,6321,0,0,8,8053,0,0,0,"Only allow main gossip to be visible if quest Paragons of Power: The Freethinker's Armguards is rewarded"),
(15,6321,0,0,26,19827,1,0,0,"Only allow main gossip to be visible if player does not have item Zandalar Freethinker's Armguards"),
(15,6321,0,1,8,8054,0,0,0,"Only allow main gossip to be visible if quest Paragons of Power: The Freethinker's Belt is rewarded"),
(15,6321,0,1,26,19826,1,0,0,"Only allow main gossip to be visible if player does not have item Zandalar Freethinker's Belt"),
(15,6321,0,2,8,8055,0,0,0,"Only allow main gossip to be visible if quest Paragons of Power: The Freethinker's Breastplate is rewarded"),
(15,6321,0,2,26,19825,1,0,0,"Only allow main gossip to be visible if player does not have item Zandalar Freethinker's Breastplate"),
(15,6321,0,3,8,8048,0,0,0,"Only allow main gossip to be visible if quest The Hero's Brand is rewarded"),
(15,6321,0,3,26,19588,1,0,0,"Only allow main gossip to be visible if player does not have item Hero's Brand"),
(15,6321,0,4,8,8045,0,0,0,"Only allow main gossip to be visible if quest The Heathen's Brand is rewarded"),
(15,6321,0,4,26,19579,1,0,0,"Only allow main gossip to be visible if player does not have item Heathen's Brand"),
(15,6321,0,5,8,8046,0,0,0,"Only allow main gossip to be visible if quest The Heathen's Brand is rewarded"),
(15,6321,0,5,26,19585,1,0,0,"Only allow main gossip to be visible if player does not have item Heathen's Brand"),
(15,6321,0,6,8,8047,0,0,0,"Only allow main gossip to be visible if quest The Heathen's Brand is rewarded"),
(15,6321,0,6,26,19586,1,0,0,"Only allow main gossip to be visible if player does not have item Heathen's Brand"),
-- Warrior main menu conditions
(15,6321,1,0,8,8058,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Armguards is rewarded"),
(15,6321,1,0,26,19824,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Armguards"),
(15,6321,1,1,8,8078,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Belt is rewarded"),
(15,6321,1,1,26,19823,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Belt"),
(15,6321,1,2,8,8079,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Breastplate is rewarded"),
(15,6321,1,2,26,19822,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Breastplate"),
(15,6321,1,3,8,8044,0,0,0,"Only allow gossip option to be visible if quest The Rage of Mugamba is rewarded"),
(15,6321,1,3,26,19577,1,0,0,"Only allow gossip option to be visible if player does not have item Rage of Mugamba"),
(15,6321,1,4,8,8041,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,6321,1,4,26,19574,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
(15,6321,1,5,8,8042,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,6321,1,5,26,19575,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
(15,6321,1,6,8,8043,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,6321,1,6,26,19576,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- Conditions for gossip main menu of Al''tabim the All-Seeing
-- Priest main menu conditions
(15,6322,0,0,8,8070,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Bindings is rewarded"),
(15,6322,0,0,26,19842,1,0,0,"Only allow gossip option to be visible if player does not have item  Zandalar Confessor's Bindings"),
(15,6322,0,1,8,8071,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Mantle is rewarded"),
(15,6322,0,1,26,19841,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Mantle"),
(15,6322,0,2,8,8061,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Wraps is rewarded"),
(15,6322,0,2,26,19843,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Wraps"),
(15,6322,0,3,8,8052,0,0,0,"Only allow gossip option to be visible if quest The All-Seeing Eye of Zuldazar is rewarded"),
(15,6322,0,3,26,19594,1,0,0,"Only allow gossip option to be visible if player does not have item The All-Seeing Eye of Zuldazar"),
(15,6322,0,4,8,8049,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,6322,0,4,26,19591,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
(15,6322,0,5,8,8050,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,6322,0,5,26,19592,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
(15,6322,0,6,8,8051,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,6322,0,6,26,19593,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- Warlock main menu conditions
(15,6322,1,0,8,8076,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Mantle is rewarded"),
(15,6322,1,0,26,19849,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Mantle"),
(15,6322,1,1,8,8077,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Robes is rewarded"),
(15,6322,1,1,26,20033,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Robe"),
(15,6322,1,2,8,8059,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Wraps is rewarded"),
(15,6322,1,2,26,19848,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Wraps"),
(15,6322,1,3,8,8109,0,0,0,"Only allow gossip option to be visible if quest Kezan's Unstoppable Taint is rewarded"),
(15,6322,1,3,26,19605,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Unstoppable Taint"),
(15,6322,1,4,8,8106,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,6322,1,4,26,19602,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
(15,6322,1,5,8,8107,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,6322,1,5,26,19603,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
(15,6322,1,6,8,8108,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,6322,1,6,26,19604,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- Mage main menu conditions
(15,6322,2,0,8,8068,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Mantle is rewarded"),
(15,6322,2,0,26,19845,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Mantle"),
(15,6322,2,1,8,8069,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Robes is rewarded"),
(15,6322,2,1,26,20034,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Robe"),
(15,6322,2,2,8,8060,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Wraps is rewarded"),
(15,6322,2,2,26,19846,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Wraps"),
(15,6322,2,3,8,8104,0,0,0,"Only allow gossip option to be visible if quest The Jewel of Kajaro is rewarded"),
(15,6322,2,3,26,19601,1,0,0,"Only allow gossip option to be visible if player does not have item Jewel of Kajaro"),
(15,6322,2,4,8,8101,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,6322,2,4,26,19598,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
(15,6322,2,5,8,8102,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,6322,2,5,26,19599,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
(15,6322,2,6,8,8103,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,6322,2,6,26,19600,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- Conditions for gossip main menu of Maywiki of Zuldazar
-- Shaman main menu conditions
(15,6341,0,0,8,8074,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Belt is rewarded"),
(15,6341,0,0,26,19829,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Belt"),
(15,6341,0,1,8,8056,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Bracers is rewarded"),
(15,6341,0,1,26,19830,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Bracers"),
(15,6341,0,2,8,8075,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Hauberk is rewarded"),
(15,6341,0,2,26,19828,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Hauberk"),
(15,6341,0,3,8,8119,0,0,0,"Only allow gossip option to be visible if quest The Unmarred Vision of Voodress is rewarded"),
(15,6341,0,3,26,19609,1,0,0,"Only allow gossip option to be visible if player does not have item Unmarred Vision of Voodress"),
(15,6341,0,4,8,8116,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,6341,0,4,26,19606,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
(15,6341,0,5,8,8117,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,6341,0,5,26,19607,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
(15,6341,0,6,8,8118,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,6341,0,6,26,19608,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- Druid main menu conditions
(15,6341,1,0,8,8064,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Belt is rewarded"),
(15,6341,1,0,26,19839,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Belt"),
(15,6341,1,1,8,8057,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Bracers is rewarded"),
(15,6341,1,1,26,19840,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Bracers"),
(15,6341,1,2,8,8065,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Tunic is rewarded"),
(15,6341,1,2,26,19838,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Tunic"),
(15,6341,1,3,8,8113,0,0,0,"Only allow gossip option to be visible if quest Pristine Enchanted South Seas Kelp is rewarded"),
(15,6341,1,3,26,19613,1,0,0,"Only allow gossip option to be visible if player does not have item Pristine Enchanted South Seas Kelp"),
(15,6341,1,4,8,8110,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,6341,1,4,26,19610,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
(15,6341,1,5,8,8111,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,6341,1,5,26,19611,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
(15,6341,1,6,8,8112,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
-- Conditions for gossip main menu of Falthir the Sightless
-- Rogue main menu conditions
(15,@GOSSIP,0,0,8,8063,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Bracers is rewarded"),
(15,@GOSSIP,0,0,26,19836,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Bracers"),
(15,@GOSSIP,0,1,8,8072,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Mantle is rewarded"),
(15,@GOSSIP,0,1,26,19835,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Mantle"),
(15,@GOSSIP,0,2,8,8073,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Tunic is rewarded"),
(15,@GOSSIP,0,2,26,19834,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Tunic"),
(15,@GOSSIP,0,3,8,8144,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Mastery Talisman is rewarded"),
(15,@GOSSIP,0,3,26,19617,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Mastery Talisman"),
(15,@GOSSIP,0,4,8,8141,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@GOSSIP,0,4,26,19614,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
(15,@GOSSIP,0,5,8,8142,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@GOSSIP,0,5,26,19615,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
(15,@GOSSIP,0,6,8,8143,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@GOSSIP,0,6,26,19616,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- Hunter main menu conditions
(15,@GOSSIP,1,0,8,8066,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Belt is rewarded"),
(15,@GOSSIP,1,0,26,19832,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Belt"),
(15,@GOSSIP,1,1,8,8062,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Bracers is rewarded"),
(15,@GOSSIP,1,1,26,19833,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Bracers"),
(15,@GOSSIP,1,2,8,8067,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Mantle is rewarded"),
(15,@GOSSIP,1,2,26,19831,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Mantle"),
(15,@GOSSIP,1,3,8,8148,0,0,0,"Only allow gossip option to be visible if quest Maelstrom's Wrath is rewarded"),
(15,@GOSSIP,1,3,26,19621,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Wrath"),
(15,@GOSSIP,1,4,8,8145,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@GOSSIP,1,4,26,19618,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
(15,@GOSSIP,1,5,8,8146,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@GOSSIP,1,5,26,19619,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
(15,@GOSSIP,1,6,8,8147,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@GOSSIP,1,6,26,19620,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril");

-- Gahz'ranka Dead (npc) should be dead and unselectable
-- This creature spawns when original Gahz'ranka body dissapears
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=15122;
DELETE FROM `creature_template_addon` WHERE `entry`=15122;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(15122,0,0,1,0,'29266');

-- Set spawnpoint of Gahz'ranka into water instead of at land
UPDATE `event_scripts` SET `x`=-11688.5136,`y`=-1737.743,`z`=2.6789,`o`=3.9 WHERE `id`=9104;

-- Set all Hooktooth Frenzies homeposition higher in water
UPDATE `creature` SET `position_z`=8.638660 WHERE `guid` IN (49731,49727,46069,49730,49071,51444,49074,51443,49072,49724,49068,51447,51446,51450,49723,49728,49076,49722,51964,51963,51448,51442,49073,49070,51445,51449,49726,49075,49725,49729);

-- Correct homeposition of Gurubashi Berserkers
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11777.142578,`position_y`=-1581.515991,`position_z`=20.997643,`orientation`=1.621398 WHERE `guid`=51395;
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11802.939453,`position_y`=-1582.822388,`position_z`=21.003288,`orientation`=1.621398 WHERE `guid`=48555;

-- Double spawned Soulflayer & Son of Hakkar group
DELETE FROM `creature` WHERE `guid` IN (49673,49674,51393) AND `id` IN (11357);
DELETE FROM `creature` WHERE `guid`=49672 AND `id`=11359;
DELETE FROM `creature_addon` WHERE `guid` IN (49672,49674,51393);

-- Hakkari Oracle pathing: 11346
SET @GUID := 736;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11880.799805,`position_y`=-1114.160034,`position_z`=83.378799 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11880.609375,-1096.299805,89.065399,0,0,0,100,0),
(@PATH,2,-11880.470703,-1075.671265,95.479660,0,0,0,100,0),
(@PATH,3,-11880.609375,-1096.299805,89.065399,0,0,0,100,0),
(@PATH,4,-11880.521484,-1136.912598,77.347404,0,0,0,100,0),
(@PATH,5,-11881.089844,-1142.275757,77.281197,0,0,0,100,0),
(@PATH,6,-11885.173828,-1146.204590,77.279572,0,0,0,100,0),
(@PATH,7,-11893.494141,-1147.923462,77.285706,0,0,0,100,0),
(@PATH,8,-11941.483398,-1149.618530,77.287071,0,0,0,100,0),
(@PATH,9,-11945.541992,-1148.230957,77.279755,0,0,0,100,0),
(@PATH,10,-11951.206055,-1141.635376,77.282402,0,0,0,100,0),
(@PATH,11,-11952.918945,-1133.938110,78.511307,0,0,0,100,0),
(@PATH,12,-11952.707031,-1113.114014,84.954788,0,0,0,100,0),
(@PATH,13,-11952.385742,-1092.186523,91.525848,0,0,0,100,0),
(@PATH,14,-11952.707031,-1113.114014,84.954788,0,0,0,100,0),
(@PATH,15,-11952.918945,-1133.938110,78.511307,0,0,0,100,0),
(@PATH,16,-11951.206055,-1141.635376,77.282402,0,0,0,100,0),
(@PATH,17,-11945.541992,-1148.230957,77.279755,0,0,0,100,0),
(@PATH,18,-11941.483398,-1149.618530,77.287071,0,0,0,100,0),
(@PATH,19,-11893.494141,-1147.923462,77.285706,0,0,0,100,0),
(@PATH,20,-11885.173828,-1146.204590,77.279572,0,0,0,100,0),
(@PATH,21,-11881.089844,-1142.275757,77.281197,0,0,0,100,0),
(@PATH,22,-11880.521484,-1136.912598,77.347404,0,0,0,100,0),
(@PATH,23,-11880.609375,-1096.299805,89.065399,0,0,0,100,0),
(@PATH,24,-11880.470703,-1075.671265,95.479660,0,0,0,100,0);

-- Make the six Hakkari Oracle and Gurubashi Warrior emote to talk
DELETE FROM `creature_addon` WHERE `guid` IN (739,740,741,742,743,744);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(739,0,0,0,0,1,''),(740,0,0,0,0,1,''),(741,0,0,0,0,1,''),(742,0,0,0,0,1,''),(743,0,0,0,0,1,''),(744,0,0,0,0,1,'');

-- Son of Hakkar pathing: 11357
SET @GUID := 49034;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11836.500000,`position_y`=-1599.979980,`position_z`=40.750099 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11836.160156,-1613.540039,40.456375,0,0,0,100,0),
(@PATH,2,-11836.692383,-1618.308838,36.998791,0,0,0,100,0),
(@PATH,3,-11836.348633,-1635.910522,36.999691,0,0,0,100,0),
(@PATH,4,-11836.131836,-1647.003418,33.733452,0,0,0,100,0),
(@PATH,5,-11835.504883,-1659.293457,36.999123,0,0,0,100,0),
(@PATH,6,-11833.794922,-1676.584351,36.986992,0,0,0,100,0),
(@PATH,7,-11833.675781,-1682.667236,40.679619,0,0,0,100,0),
(@PATH,8,-11833.439453,-1694.743042,40.748413,0,0,0,100,0),
(@PATH,9,-11833.675781,-1682.667236,40.679619,0,0,0,100,0),
(@PATH,10,-11833.794922,-1676.584351,36.986992,0,0,0,100,0),
(@PATH,11,-11835.504883,-1659.293457,36.999123,0,0,0,100,0),
(@PATH,12,-11836.131836,-1647.003418,33.733452,0,0,0,100,0),
(@PATH,13,-11836.348633,-1635.910522,36.999691,0,0,0,100,0),
(@PATH,14,-11836.692383,-1618.308838,36.998791,0,0,0,100,0),
(@PATH,15,-11836.160156,-1613.540039,40.456375,0,0,0,100,0),
(@PATH,16,-11836.500000,-1599.979980,40.750099,0,0,0,100,0);

-- Son of Hakkar pathing: 11357
SET @GUID := 49033;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11745.992188,`position_y`=-1620.595581,`position_z`=36.996082 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11743.156250,-1609.533691,40.685410,0,0,0,100,0),
(@PATH,2,-11743.031250,-1615.080078,36.998463,0,0,0,100,0),
(@PATH,3,-11739.655273,-1631.531128,36.998829,0,0,0,100,0),
(@PATH,4,-11739.375000,-1643.833984,33.733307,0,0,0,100,0),
(@PATH,5,-11739.109375,-1655.463013,36.796623,0,0,0,100,0),
(@PATH,6,-11740.051758,-1673.494141,37.093468,0,0,0,100,0),
(@PATH,7,-11740.300781,-1678.714233,40.658524,0,0,0,100,0),
(@PATH,8,-11740.165039,-1691.161987,40.748100,0,0,0,100,0),
(@PATH,9,-11740.300781,-1678.714233,40.658524,0,0,0,100,0),
(@PATH,10,-11740.051758,-1673.494141,37.093468,0,0,0,100,0),
(@PATH,11,-11739.109375,-1655.463013,36.796623,0,0,0,100,0),
(@PATH,12,-11739.375000,-1643.833984,33.733307,0,0,0,100,0),
(@PATH,13,-11739.655273,-1631.531128,36.998829,0,0,0,100,0),
(@PATH,14,-11743.031250,-1615.080078,36.998463,0,0,0,100,0),
(@PATH,15,-11742.692383,-1597.847656,40.750408,0,0,0,100,0);

-- Zulian Panther pathing: 11365
SET @GUID := 49320;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11626.807617,`position_y`=-1701.435425,`position_z`=38.823635 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11626.807617,-1701.435425,38.823635,0,0,0,100,0),
(@PATH,2,-11627.707031,-1727.870483,40.333164,0,0,0,100,0),
(@PATH,3,-11629.434570,-1760.955322,38.754513,0,0,0,100,0),
(@PATH,4,-11653.967773,-1807.740723,43.086334,0,0,0,100,0),
(@PATH,5,-11629.434570,-1760.955322,38.754513,0,0,0,100,0),
(@PATH,6,-11627.707031,-1727.870483,40.333164,0,0,0,100,0),
(@PATH,7,-11630.115234,-1687.330566,39.997681,0,0,0,100,0),
(@PATH,8,-11634.075195,-1596.245239,39.645630,0,0,0,100,0);

-- Make the two other panthers follow the leader
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49319,49318);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49320;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49320,49320,0,0,2),
(49320,49319,3,225,2),
(49320,49318,3,90,2);

-- Soulflayer pathing: 11359
SET @GUID := 51397;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11857.572266,`position_y`=-1597.060181,`position_z`=21.108191 WHERE `guid`=@GUID;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11853.084961,`position_y`=-1689.830444,`position_z`=21.169413 WHERE `guid`=51398; -- Son of Hakkar on the left
UPDATE `creature` SET `MovementType`=2,`position_x`=-11859.287109,`position_y`=-1602.102905,`position_z`=21.126654 WHERE `guid`=51402; -- Son of Hakkar on the right
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11854.121094,-1704.387817,21.126833,0,0,0,100,0),
(@PATH,2,-11857.572266,-1597.060181,21.108191,0,0,0,100,0);

-- Make the two Son of Hakkars follow the Soulflayer
DELETE FROM `creature_formations` WHERE `leaderGUID`=51397;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51397,51397,0,0,2),
(51397,51398,3,225,2),
(51397,51402,3,90,2);

-- Soulflayer pathing: 11359
SET @GUID := 49663;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11714.797852,`position_y`=-1701.325806,`position_z`=21.127512 WHERE `guid`=@GUID;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11722.087891,`position_y`=-1695.433838,`position_z`=21.128262 WHERE `guid`=49665; -- Son of Hakkar on the left
UPDATE `creature` SET `MovementType`=2,`position_x`=-11716.234375,`position_y`=-1695.188965,`position_z`=21.128262 WHERE `guid`=49664; -- Son of Hakkar on the right
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11718.995117,-1690.362915,21.128012,0,0,0,100,0),
(@PATH,2,-11723.005859,-1587.319458,21.028204,0,0,0,100,0),
(@PATH,3,-11719.233398,-1696.215698,21.127626,0,0,0,100,0);

-- Make the two Son of Hakkars follow the Soulflayer
DELETE FROM `creature_formations` WHERE `leaderGUID`=49663;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49663,49663,0,0,2),
(49663,49665,3,225,2),
(49663,49664,3,90,2);

-- Soulflayer pathing: 11359
SET @GUID := 51421;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11762.890625,`position_y`=-1722.024536,`position_z`=19.575914 WHERE `guid`=@GUID;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11764.499023,`position_y`=-1719.525024,`position_z`=19.575289 WHERE `guid`=51422; -- Son of Hakkar on the left
UPDATE `creature` SET `MovementType`=2,`position_x`=-11764.550781,`position_y`=-1724.298218,`position_z`=19.625282 WHERE `guid`=51423; -- Son of Hakkar on the right
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11763.343750,-1722.480713,19.575899,0,0,0,100,0),
(@PATH,2,-11708.300781,-1720.306274,19.575914,0,0,0,100,0),
(@PATH,3,-11713.461914,-1566.296997,19.575914,0,0,0,100,0),
(@PATH,4,-11708.300781,-1720.306274,19.575914,0,0,0,100,0),
(@PATH,5,-11862.150391,-1725.399780,19.576309,0,0,0,100,0),
(@PATH,6,-11867.898438,-1571.811768,19.576309,0,0,0,100,0),
(@PATH,7,-11862.150391,-1725.399780,19.576309,0,0,0,100,0);

-- Make the two Son of Hakkars follow the Soulflayer
DELETE FROM `creature_formations` WHERE `leaderGUID`=51421;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51421,51421,0,0,2),
(51421,51422,3,225,2),
(51421,51423,3,90,2);

-- Set one group to another platform and make the Sons of Hakkar group up with the Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11735.766602,`position_y`=-1585.883423,`position_z`=40.750748 WHERE `guid`=51427; -- Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11738.824219,`position_y`=-1586.245483,`position_z`=40.750748 WHERE `guid`=51428; -- Son of Hakkar
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11732.513672,`position_y`=-1591.200195,`position_z`=40.750748 WHERE `guid`=51429; -- Son of Hakkar
DELETE FROM `creature_formations` WHERE `leaderGUID`=51427;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51427,51427,0,0,2),
(51427,51428,3,225,2),
(51427,51429,3,90,2);

-- Set one group to another platform and make the Sons of Hakkar group up with the Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11843.626953,`position_y`=-1593.210083,`position_z`=40.750298 WHERE `guid`=51390; -- Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11844.555664,`position_y`=-1589.202515,`position_z`=40.750298 WHERE `guid`=51425; -- Son of Hakkar
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11846.154297,`position_y`=-1594.911377,`position_z`=40.750298 WHERE `guid`=51426; -- Son of Hakkar
DELETE FROM `creature_formations` WHERE `leaderGUID`=51390;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51390,51390,0,0,2),
(51390,51425,3,225,2),
(51390,51426,3,90,2);

-- Insert missing Hooktooth Frenzy
DELETE FROM `creature` WHERE `guid`=49673;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(49673,11374,309,1,1,15101,0,-11673.693359,-1623.402710,8.929444,4.587632,7200,0,0,9156,0,0,0,0,0);

-- Hooktooth Frenzy pathing: 11359
SET @GUID := 49673;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11673.693359,`position_y`=-1623.402710,`position_z`=8.638660 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11673.025391,-1622.384766,8.638660,0,1,0,100,0),
(@PATH,2,-11673.558594,-1686.983032,8.638660,0,1,0,100,0),
(@PATH,3,-11685.807617,-1714.556519,8.638660,0,1,0,100,0),
(@PATH,4,-11713.664063,-1759.057007,8.638660,0,1,0,100,0),
(@PATH,5,-11745.197266,-1778.084229,8.638660,0,1,0,100,0),
(@PATH,6,-11769.161133,-1780.376587,8.638660,0,1,0,100,0),
(@PATH,7,-11792.379883,-1767.869629,8.638660,0,1,0,100,0),
(@PATH,8,-11816.695313,-1739.452515,8.638660,0,1,0,100,0),
(@PATH,9,-11868.729492,-1734.182373,8.638660,0,1,0,100,0),
(@PATH,10,-11899.966797,-1680.415405,8.638660,0,1,0,100,0),
(@PATH,11,-11893.339844,-1632.780518,8.638660,0,1,0,100,0),
(@PATH,12,-11882.101563,-1558.908203,8.638660,0,1,0,100,0),
(@PATH,13,-11862.220703,-1522.576660,8.638660,0,1,0,100,0),
(@PATH,14,-11821.798828,-1434.877319,8.638660,0,1,0,100,0),
(@PATH,15,-11833.968750,-1368.541626,8.638660,0,1,0,100,0),
(@PATH,16,-11802.698242,-1365.827637,8.638660,0,1,0,100,0),
(@PATH,17,-11813.227539,-1424.008911,8.638660,0,1,0,100,0),
(@PATH,18,-11721.414063,-1441.936646,8.638660,0,1,0,100,0),
(@PATH,19,-11697.149414,-1525.417969,8.638660,0,1,0,100,0),
(@PATH,20,-11698.563477,-1591.051880,8.638660,0,1,0,100,0),
(@PATH,21,-11673.025391,-1622.384766,8.638660,0,1,0,100,0);

-- Hooktooth Frenzy pathing: 11359
SET @GUID := 49726;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11679.599609,`position_y`=-1607.959961,`position_z`=8.638660 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11673.025391,-1622.384766,8.638660,0,1,0,100,0),
(@PATH,2,-11698.563477,-1591.051880,8.638660,0,1,0,100,0),
(@PATH,3,-11697.149414,-1525.417969,8.638660,0,1,0,100,0),
(@PATH,4,-11721.414063,-1441.936646,8.638660,0,1,0,100,0),
(@PATH,5,-11813.227539,-1424.008911,8.638660,0,1,0,100,0),
(@PATH,6,-11802.698242,-1365.827637,8.638660,0,1,0,100,0),
(@PATH,7,-11833.968750,-1368.541626,8.638660,0,1,0,100,0),
(@PATH,8,-11821.798828,-1434.877319,8.638660,0,1,0,100,0),
(@PATH,9,-11862.220703,-1522.576660,8.638660,0,1,0,100,0),
(@PATH,10,-11882.101563,-1558.908203,8.638660,0,1,0,100,0),
(@PATH,11,-11893.339844,-1632.780518,8.638660,0,1,0,100,0),
(@PATH,12,-11899.966797,-1680.415405,8.638660,0,1,0,100,0),
(@PATH,13,-11868.729492,-1734.182373,8.638660,0,1,0,100,0),
(@PATH,14,-11816.695313,-1739.452515,8.638660,0,1,0,100,0),
(@PATH,15,-11792.379883,-1767.869629,8.638660,0,1,0,100,0),
(@PATH,16,-11769.161133,-1780.376587,8.638660,0,1,0,100,0),
(@PATH,17,-11745.197266,-1778.084229,8.638660,0,1,0,100,0),
(@PATH,18,-11713.664063,-1759.057007,8.638660,0,1,0,100,0),
(@PATH,19,-11685.807617,-1714.556519,8.638660,0,1,0,100,0),
(@PATH,20,-11673.558594,-1686.983032,8.638660,0,1,0,100,0);

-- kill startup errors introduced in 2011_08_06_00
DELETE FROM `creature_loot_template` WHERE `entry` IN ( 37655,38031,38057,38058,38059,38062,38063,38072,38073,38074,38075,38076,38098,38099,38100,38101,38102,38108,38197,38198,38258,38418,38445,38446,38479,38480,38481);

DELETE FROM `command` WHERE `name` = 'cast dest';
INSERT INTO `command` VALUES
('cast dest',3,'Syntax: .cast dest #spellid #x #y #z [triggered]\r\n  Selected target will cast #spellid at provided destination. If ''trigered'' or part provided then spell casted with triggered flag.');
-- honor challenge
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=30037;
DELETE FROM `smart_scripts` WHERE `entryorguid`=30037 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(30037,0,0,0,8,0,100,0,21855,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mjordin Combatant - set to phase 1 when aggroed by spell'),
(30037,0,1,0,6,1,100,0,0,0,0,0,33,30038,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mjordin Combatant - give credit only when it has buff');

-- forgotten depths ambusher
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=30204;
DELETE FROM `smart_scripts` WHERE `entryorguid`=30204 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(30204,0,0,0,4,0,100,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Depths Ambusher - change flags when aggroed'),
(30204,0,1,0,4,0,100,0,0,0,0,0,28,56422,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Depths Ambusher - remove submerge');

-- ocular
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33555200 WHERE `entry`=29790;
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|8, `unit_flags`=`unit_flags`|4, `InhabitType`=7 WHERE `entry` IN (29747,29790);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29747;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29747 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(29747,0,0,0,0,0,100,0,1500,1500,4000,4000,11,55269,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ocular - cast Deathly Stare every 3 secs'),
 -- (29747,0,1,0,6,0,100,0,0,0,0,0,11,55288,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Ocular - cast It''s All Fun and Games: The Ocular On Death'),
(29747,0,1,0,6,0,100,0,0,0,0,0,33,29803,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Ocular - cast It''s All Fun and Games: The Ocular On Death'), -- temporary hack
(29747,0,2,0,25,0,100,0,0,0,0,0,75,55162,1,0,0,0,0,1,0,0,0,0,0,0,0, 'Ocular - cast Transform on Spawn');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=55288;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(55288,55289,0, 'Ocular on script cast killcredit');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=55288;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, Comment) VALUES 
(17,0,55288,0,18,1,0,0,0, 'It''s All Fun and Games: The Ocular On Death');

-- shadow vault auras
DELETE FROM `spell_area` WHERE `spell`=30181 AND `area`=4477;
INSERT INTO `spell_area` VALUES 
(30181,4477,0,0,12896,0,1101,2,1),
(30181,4477,0,0,12897,0,690,2,1);

-- quests
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN (12897,12896);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ScriptName`, `Comment`) VALUES 
(19,0,12897,0,8,12893,0,0,'', 'If he cannot be turned - horde'),
(19,0,12896,0,8,12893,0,0,'', 'If he cannot be turned - alliance');

-- temp fix
SET @VILE := 29769;
SET @LADY := 29770;
SET @LEAPER := 29840;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@VILE,@LADY,@LEAPER) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@VILE,0,0,0,6,0,100,0,0,0,0,0,33,29845,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Vile - On spell hit - Give kill credit'),
(@LADY,0,0,0,6,0,100,0,0,0,0,0,33,29846,0,0,0,0,0,7,0,0,0,0,0,0,0,'Lady Nightswood - On spell hit - Give kill credit'),
(@LEAPER,0,0,0,6,0,100,0,0,0,0,0,33,29847,0,0,0,0,0,7,0,0,0,0,0,0,0, 'The Leaper - On spell hit - Give kill credit');

-- vereth quests
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN (13146,13147,13160,13161,13162,13163,13164);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ScriptName`, `Comment`) VALUES 
(19,0,13146,0,8,13145,0,0,'', 'Generosity Abounds'),
(19,0,13160,0,8,13145,0,0,'', 'Stunning View'),
(19,0,13147,0,8,13145,0,0,'', 'Matchmaker'),
(19,0,13161,0,8,13146,0,0,'', 'The Rider of the Unholy'),
(19,0,13161,0,8,13147,0,0,'', 'The Rider of the Unholy'),
(19,0,13161,0,8,13160,0,0,'', 'The Rider of the Unholy'),
(19,0,13162,0,8,13146,0,0,'', 'The Rider of Frost'),
(19,0,13162,0,8,13147,0,0,'', 'The Rider of Frost'),
(19,0,13162,0,8,13160,0,0,'', 'The Rider of Frost'),
(19,0,13163,0,8,13146,0,0,'', 'The Rider of Blood'),
(19,0,13163,0,8,13147,0,0,'', 'The Rider of Blood'),
(19,0,13163,0,8,13160,0,0,'', 'The Rider of Blood'),
(19,0,13164,0,8,13161,0,0,'', 'The Fate of Bloodbane'),
(19,0,13164,0,8,13162,0,0,'', 'The Fate of Bloodbane'),
(19,0,13164,0,8,13163,0,0,'', 'The Fate of Bloodbane');

UPDATE `gameobject` SET `phasemask`=3 WHERE `guid`=62035;
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry`=29769;
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=29717;
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=29738;
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=29722;
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry`=29840;
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry`=29770;

-- lightbane from sniffs
DELETE FROM `event_scripts` WHERE `id`=19423;
INSERT INTO `event_scripts` VALUES
(19423,3,10,29851,300000,0,8593.944,2618.039,652.3534,3.174454);

-- Add loot table for Ahune <The Frost Lord>.
CALL `sp_get_go_lootid`(187892,@ENTRY);
-- Add loot table for Ahune <The Frost Lord>.
DELETE FROM `gameobject_loot_template` WHERE `entry`= @ENTRY;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,35557,28,1,0,1,2), -- Huge Snowball
(@ENTRY,35723,12,1,0,1,1), -- Shards of Ahune
(@ENTRY,35498,3 ,1,0,1,1), -- Formula: Enchant Weapon - Deathfrost
(@ENTRY,35720,3 ,1,0,5,6), -- Lord of Frost's Private Label
-- CLOAKS
(@ENTRY,54805,0,1,1,1,1), -- Cloak of the Frigid Winds
(@ENTRY,54804,0,1,1,1,1), -- Shroud of Winter's Chill
(@ENTRY,54803,0,1,1,1,1), -- The Frost Lord's Battle Shroud
(@ENTRY,54802,0,1,1,1,1), -- The Frost Lord's War Cloak
(@ENTRY,54801,0,1,1,1,1); -- Icebound Cloak

-- Dual-Blade Butcher loot fix
DELETE FROM `reference_loot_template` WHERE `item` IN (47285,47446);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(34332,47285,0,1,1,1,1), -- normal
(34346,47446,0,1,1,1,1); -- heroic

SET @CGUID := 209079;

-- Insert a creature that shouldn't have been deleted
DELETE FROM `creature` WHERE `id`=29740;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(100065,29740,571,1,1,26471,0,3273.75,-2246.84,114.818,4.5204,300,0,0,9610,0,0,0,0,0);

-- Icecrown spawns
DELETE FROM `creature` WHERE `id` IN (29717,29719,29720,29722,29738,29770,29769,29804,29747,29840);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(152138,29717,571,1,2,0,0,8335.01,2815.44,655.279,1.91986,300,0,0,12175,3893,0),
(152139,29717,571,1,2,0,0,8416.89,2698.95,655.278,5.4655,300,0,0,12175,3893,0),
(152140,29717,571,1,2,0,0,8337.6,2803.88,655.317,4.75039,300,0,0,12175,3893,0),
(152141,29717,571,1,2,0,0,8313.91,2802.63,655.294,3.49066,300,0,0,12175,3893,0),
(152142,29717,571,1,2,0,0,8375.95,2711.55,655.283,4.58118,300,0,0,12175,3893,0),
(152143,29717,571,1,2,0,0,8353.96,2806.34,655.317,0.488692,300,0,0,12175,3893,0),
(152144,29717,571,1,2,0,0,8379.28,2778.25,655.28,0.471239,300,0,0,12175,3893,0),
(152145,29717,571,1,2,0,0,8364.14,2701.92,656.568,0.0349066,300,0,0,12175,3893,0),
(152146,29717,571,1,2,0,0,8477.41,2632.19,653.252,4.90438,300,0,0,12175,3893,0),
(152147,29717,571,1,2,0,0,8481.43,2626.01,652.453,2.44346,300,0,0,12175,3893,0),
(152148,29717,571,1,2,0,0,8487.49,2597.66,652.453,3.735,300,0,0,12175,3893,0),
(152149,29717,571,1,2,0,0,8482,2594.25,653.308,5.72468,300,0,0,12175,3893,0),
(152126,29719,571,1,2,0,0,8251.46,2788.82,642.024,3.15905,300,0,0,12175,0,0),
(152127,29719,571,1,2,0,0,8441.54,2736.37,760.141,5.28835,300,0,0,12175,0,0),
(152128,29719,571,1,2,0,0,8346.44,2669.66,689.96,5.49779,300,0,0,12175,0,0),
(152129,29719,571,1,2,0,0,8481.1,2684.45,652.537,2.75762,300,0,0,12175,0,0),
(152130,29719,571,1,2,0,0,8419.11,2731.21,656.928,3.83972,300,0,0,12175,0,0),
(152131,29719,571,1,2,0,0,8442.5,2591.95,760.057,2.81745,300,0,0,12175,0,0),
(152132,29719,571,1,2,0,0,8333.68,2713.6,658.645,1.27409,300,0,0,12175,0,0),
(152133,29719,571,1,2,0,0,8353.3,2769.46,656.19,4.17134,300,0,0,12175,0,0),
(152134,29719,571,1,2,0,0,8249.88,2766.01,642.024,2.84489,300,0,0,12175,0,0),
(152135,29719,571,1,2,0,0,8249.3,2792.87,641.876,4.50706,300,0,0,12175,0,0),
(152136,29719,571,1,2,0,0,8407.3,2792.75,717.842,3.32933,300,0,0,12175,0,0),
(152137,29719,571,1,2,0,0,8441.07,2731.16,760.057,3.90197,300,0,0,12175,0,0),
(152150,29720,571,1,2,0,0,8253.07,2778.52,641.94,5.84327,300,0,0,12175,0,0),
(152151,29720,571,1,2,0,0,8375.25,2827.48,717.925,1.25664,300,0,0,12175,0,0),
(152152,29720,571,1,2,0,0,8384.67,2727.19,655.276,0.523599,300,0,0,12175,0,0),
(152153,29720,571,1,2,0,0,8262.02,2742.37,643.984,2.56197,300,0,0,12175,0,0),
(152154,29720,571,1,2,0,0,8505.87,2684.41,654.01,4.31096,300,0,0,12175,0,0),
(152155,29720,571,1,2,0,0,8493.93,2656.29,653.637,4.39823,300,0,0,12175,0,0),
(152156,29720,571,1,2,0,0,8249.41,2794.36,642.251,3.02912,300,0,0,12175,0,0),
(152157,29720,571,1,2,0,0,8238,2798.22,638.909,2.10867,300,0,0,12175,0,0),
(152158,29720,571,1,2,0,0,8312.52,2676.2,689.168,3.89319,300,0,0,12175,0,0),
(152159,29720,571,1,2,0,0,8357.75,2724,662.616,1.15192,300,0,0,12175,0,0),
(152160,29720,571,1,2,0,0,8417.85,2644.77,760.057,0.294484,300,0,0,12175,0,0),
(152161,29720,571,1,2,0,0,8323.99,2775.64,655.539,0.820305,300,0,0,12175,0,0),
(152162,29720,571,1,2,0,0,8313.71,2730.07,666.374,1.41372,300,0,0,12175,0,0),
(152163,29720,571,1,2,0,0,8404.08,2751.16,666.536,3.59538,300,0,0,12175,0,0),
(152164,29720,571,1,2,0,0,8526.63,2647.68,654.274,5.81195,300,0,0,12175,0,0),
(@CGUID+00,29720,571,1,2,0,0,8510.63,2619.33,652.453,1.21255,300,0,0,12175,0,0),
(@CGUID+01,29722,571,1,2,0,0,8419.52,2697.4,760.141,4.81711,300,0,0,12175,0,0),
(@CGUID+02,29722,571,1,2,0,0,8413.14,2643.3,760.141,3.28122,300,0,0,12175,0,0),
(@CGUID+03,29722,571,1,2,0,0,8313.09,2684.89,689.96,5.93412,300,0,0,12175,0,0),
(@CGUID+04,29722,571,1,2,0,0,8407.96,2796.92,717.907,5.70723,300,0,0,12175,0,0),
(@CGUID+05,29722,571,1,2,0,0,8382.41,2828.45,717.247,5.77289,300,0,0,12175,0,0),
(@CGUID+06,29722,571,1,2,0,0,8418.25,2696.34,760.057,3.28026,300,0,0,12175,0,0),
(@CGUID+07,29722,571,1,2,0,0,8338.52,2740.88,655.542,6.19592,300,0,0,12175,0,0),
(@CGUID+08,29722,571,1,2,0,0,8284.4,2669.41,689.419,4.65308,300,0,0,12175,0,0),
(@CGUID+09,29722,571,1,2,0,0,8348.2,2813.92,655.394,2.53073,300,0,0,12175,0,0),
(@CGUID+10,29722,571,1,2,0,0,8320.35,2814.49,656.567,5.58505,300,0,0,12175,0,0),
(@CGUID+11,29722,571,1,2,0,0,8349.74,2669.86,689.877,0.32094,300,0,0,12175,0,0),
(@CGUID+12,29722,571,1,2,0,0,8367.34,2745.54,655.24,0.160263,300,0,0,12175,0,0),
(@CGUID+13,29738,571,1,2,0,0,8407.75,2712.33,655.278,0.593412,300,0,0,12175,3893,0),
(@CGUID+14,29738,571,1,2,0,0,8380.24,2751.93,655.466,2.37967,300,0,0,12175,3893,0),
(@CGUID+15,29738,571,1,2,0,0,8289.62,2759.84,656.208,2.9147,300,0,0,12175,3893,0),
(@CGUID+16,29738,571,1,2,0,0,8292.34,2783.9,656.208,3.15905,300,0,0,12175,3893,0),
(@CGUID+17,29738,571,1,2,0,0,8520.61,2728.09,652.537,4.99164,300,0,0,12175,3893,0),
(@CGUID+18,29738,571,1,2,0,0,8309.55,2775.3,655.197,4.70894,300,0,0,12175,3893,2),
(@CGUID+19,29840,571,1,2,0,0,8418.5,2620.67,759.958,4.90178,300,0,0,12600,0,2),
(@CGUID+20,29770,571,1,2,0,0,8402.52,2824.4,716.659,0.954007,300,0,0,10080,8814,0),
(@CGUID+21,29769,571,1,2,0,0,8298.21,2657.99,688.695,5.5676,300,0,0,12600,0,0),
(@CGUID+22,29804,571,1,2,0,0,8395.01,2675.19,657.913,1.32645,300,0,0,63000,19970,0),
(152165,29747,571,1,2,0,0,8526.228,2665.085,1045.04,2.670354,120,0,0,126000,0,0);

DELETE FROM `gameobject` WHERE `id` IN (191778,191779);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(152116,191778,571,1,2,8600.93,2639.53,652.353,-3.12412,0,0,-0.999962,0.00873622,300,100,1),
(152117,191779,571,1,2,8594.72,2627.14,652.353,1.15192,0,0,0.54464,0.83867,300,100,1);

SET @Ithania = 17119;

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=@Ithania);
DELETE FROM `creature_template_addon` WHERE `entry`=@Ithania;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Ithania,0,8,257,0, NULL); -- Ithania

DELETE FROM `creature_text` WHERE `entry`=@Ithania;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Ithania,0,0, 'I think I can make it to Brackenwall on my own. They''ve got the cargo at the top of the tower. Be careful!',12,0,0,0,0,0, 'Ithania - Escape');

-- Script
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Ithania;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@Ithania AND `source_type`=0);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@Ithania*100 AND `source_type` IN (0,9));
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@Ithania, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 80, @Ithania*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - On gossip hello run timed action list'),
(@Ithania*100, 9, 0, 0, 0, 0, 0, 0, 500, 500, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 0 - Remove kneeling'),
(@Ithania*100, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 1 - Remove gossip flag'),
(@Ithania*100, 9, 2, 0, 0, 0, 0, 0, 500, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 2 - Say'),
(@Ithania*100, 9, 3, 0, 0, 0, 0, 0, 1500, 1500, 0, 0, 53, 1, @Ithania, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 3 - Start waypoint'),
(@Ithania, 0, 1, 0, 40, 0, 0, 0, 2, @Ithania, 0, 0, 33, 17119, 0, 0, 0, 0, 0, 18, 60, 0, 0, 0, 0, 0, 0, 'Ithania - 5 - Give killcredit (adjust timer)'),
(@Ithania, 0, 2, 0, 40, 0, 0, 0, 2, @Ithania, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 6 - Despawn');

DELETE FROM `waypoints` WHERE `entry`=@Ithania;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@Ithania, 1, -2873.96, -3424.76, 39.35, 'Ithania - Tower Entrance'),
(@Ithania, 2, -2833.36, -3415.22, 33.77, 'Ithania - Road');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (29769,29770,29840);
-- Template updates for creature 25596 (Infected Kodo Beast)
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|512,`speed_run`=2 WHERE `entry`=25596;
UPDATE `creature_template_addon` SET `bytes1`=7,`bytes2`=1,`mount`=0,`emote`=0,`auras`='45771' WHERE `entry`=25596;

-- Tome
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12938;
UPDATE `quest_template` SET `nextquestid`=12938, `exclusivegroup`=12898 WHERE `entry` in (12898,12899);

-- Aokromes
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12891;
UPDATE `quest_template` SET `nextquestid`=12891, `exclusivegroup`=12887 WHERE `entry` in (12887,12892);
UPDATE `creature_template` SET `faction_A`=21,`faction_H`=21 WHERE `entry`=29851;

DELETE FROM `spell_dbc` WHERE `id`=18350;
DELETE FROM `spell_script_names` WHERE `spell_id`=18350;

UPDATE `prospecting_loot_template` SET `maxcount` = 2 WHERE `entry` = 36910;

UPDATE `creature` SET `position_z`=-6.03356	WHERE `guid`=46069 AND `id`=11741; -- Dredge Crusher
UPDATE `creature` SET `position_z`=8.638660 WHERE `guid`=49069 AND `id`=11374; -- Hooktooth Frenzies
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` = 37231; -- Robe Beam Stalker
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` = 38008; -- Blood Orb Controller
UPDATE `playercreateinfo_action` SET `action`=26297 WHERE `action` IN (20554,50621,26635,26296) AND `race`=8; -- Berserking - Troll racial

-- Memories
UPDATE `creature_template` SET `difficulty_entry_1`=35531 WHERE `entry`=34942; -- Memory of Hogger
UPDATE `creature_template` SET `difficulty_entry_1`=35541 WHERE `entry`=35028; -- Memory of VanCleef
UPDATE `creature_template` SET `difficulty_entry_1`=35538 WHERE `entry`=35029; -- Memory of Mutanus
UPDATE `creature_template` SET `difficulty_entry_1`=35530 WHERE `entry`=35030; -- Memory of Herod
UPDATE `creature_template` SET `difficulty_entry_1`=35536 WHERE `entry`=35031; -- Memory of Lucifron
UPDATE `creature_template` SET `difficulty_entry_1`=35540 WHERE `entry`=35032; -- Memory of Thunderaan
UPDATE `creature_template` SET `difficulty_entry_1`=35521 WHERE `entry`=35033; -- Memory of Chromaggus
UPDATE `creature_template` SET `difficulty_entry_1`=35528 WHERE `entry`=35034; -- Memory of Hakkar
UPDATE `creature_template` SET `difficulty_entry_1`=35543 WHERE `entry`=35036; -- Memory of Vek'nilash
UPDATE `creature_template` SET `difficulty_entry_1`=35535 WHERE `entry`=35037; -- Memory of Kalithresh
UPDATE `creature_template` SET `difficulty_entry_1`=35537 WHERE `entry`=35038; -- Memory of Malchezaar
UPDATE `creature_template` SET `difficulty_entry_1`=35527 WHERE `entry`=35039; -- Memory of Gruul
UPDATE `creature_template` SET `difficulty_entry_1`=35542 WHERE `entry`=35040; -- Memory of Vashj
UPDATE `creature_template` SET `difficulty_entry_1`=35520 WHERE `entry`=35041; -- Memory of Archimonde
UPDATE `creature_template` SET `difficulty_entry_1`=35533 WHERE `entry`=35042; -- Memory of Illidan
UPDATE `creature_template` SET `difficulty_entry_1`=35523 WHERE `entry`=35043; -- Memory of Delrissa
UPDATE `creature_template` SET `difficulty_entry_1`=35525 WHERE `entry`=35044; -- Memory of Entropius
UPDATE `creature_template` SET `difficulty_entry_1`=35534 WHERE `entry`=35045; -- Memory of Ingvar
UPDATE `creature_template` SET `difficulty_entry_1`=35522 WHERE `entry`=35046; -- Memory of Cyanigosa
UPDATE `creature_template` SET `difficulty_entry_1`=35524 WHERE `entry`=35047; -- Memory of Eck
UPDATE `creature_template` SET `difficulty_entry_1`=35539 WHERE `entry`=35048; -- Memory of Onyxia
UPDATE `creature_template` SET `difficulty_entry_1`=35532 WHERE `entry`=35049; -- Memory of Heigan
UPDATE `creature_template` SET `difficulty_entry_1`=35532 WHERE `entry`=35050; -- Memory of Ignis
UPDATE `creature_template` SET `difficulty_entry_1`=35544 WHERE `entry`=35051; -- Memory of Vezax
UPDATE `creature_template` SET `difficulty_entry_1`=35519 WHERE `entry`=35052; -- Memory of Algalon

-- Others
UPDATE `creature_template` SET `difficulty_entry_1`=35306 WHERE `entry`=35305; -- Argent Monk
UPDATE `creature_template` SET `difficulty_entry_1`=35308 WHERE `entry`=35307; -- Argent Priestess
UPDATE `creature_template` SET `difficulty_entry_1`=35310 WHERE `entry`=35309; -- Argent Lightwielder

