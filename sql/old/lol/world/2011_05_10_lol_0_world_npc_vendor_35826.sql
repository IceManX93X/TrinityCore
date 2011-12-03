-- Fix NPC 'Kaye Toogie' add vendor flag & add sales 
UPDATE `creature_template` SET `npcflag`=`npcflag` | 128 WHERE `entry`=35826;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES
(35826,0,16054,1,1800,0),
(35826,0,13311,1,1800,0),
(35826,0,10609,1,1800,0);