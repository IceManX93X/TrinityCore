-- Fix Quest 'Get the Key' #12949 - add Quest Invisibility to Instructor Hroegar
-- add Quest Invisibility to Instructor Hroegar
DELETE FROM `creature_template_addon` WHERE `entry` = 29915;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(29915,0,0,0,4097,0,'56058 0'); -- apply aura - Get the Key: Instructor Hroegar's Invisibility
-- on quest #12949 apply aura - Savage Ledge: See Instructor Hroegar's Invisibility
DELETE FROM `spell_area` WHERE `spell` = 56057;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES 
(56057,4497,12949,1,12949,0,0,2,1);