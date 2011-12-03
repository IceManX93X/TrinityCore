-- ##########################  The Shadow Vault #########################
-- ############# Complete Questlinking ##################################
-- ###### By BroodWyrm ############ source wowhead user Whiterock #######

-- If He Cannot Be Turned Alliance ... Prev: Non ... NextInChain: The Shadow Vault
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12898 WHERE entry = 12896;
-- If He Cannot Be Turned Horde ... Prev: Non ... NextInChain: The Shadow Vault
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12899 WHERE entry = 12897;
-- The Shadow Vault Alliance... Prev: If He Cannot Be Turned Alliance ... NextInChain: The Duke
UPDATE quest_template SET PrevQuestId = 12896, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12938 WHERE entry = 12898;
-- The Shadow Vault Horde... Prev: If He Cannot Be Turned Alliance ... NextInChain: The Duke
UPDATE quest_template SET PrevQuestId = 12897, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12938 WHERE entry = 12899;
-- The Duke... Prev: The Shadow Vault Alliance OR Horde ... NextInChain: Honor Challenge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12939 WHERE entry = 12938;
DELETE FROM conditions WHERE SourceEntry = 12938 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12938,0,8,12898,0,0,0,'',''),
(19,0,12938,0,8,12898,0,0,0,'',''),
(20,0,12938,1,8,12899,0,0,0,'',''),
(19,0,12938,1,8,12899,0,0,0,'','');

-- Honor Challenge ... Prev: The Duke ... NextInChain: Shadow Vault Decree
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12943 WHERE entry = 12939;
-- Shadow Vault Decree ... Prev: Honor Challenge
UPDATE quest_template SET PrevQuestId = 12939, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12943;

-- Get the Key ... Prev: Honor Challenge ... NextInChain: Let the Baron Know
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12951 WHERE entry = 12949;
-- Let the Baron Know ... Prev: Get the Key 
UPDATE quest_template SET PrevQuestId = 12949, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12951;

-- Vandalizing Jotunheim ... Prev: Let the Baron Know AND Shadow Vault Decree 
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13084;
DELETE FROM conditions WHERE SourceEntry = 13084 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13084,0,8,12951,0,0,0,'',''),
(19,0,13084,0,8,12951,0,0,0,'',''),
(20,0,13084,0,8,12943,0,0,0,'',''),
(19,0,13084,0,8,12943,0,0,0,'','');
-- Leave Our Mark ... Prev: Let the Baron Know AND Shadow Vault Decree 
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12995;
DELETE FROM conditions WHERE SourceEntry = 12995 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12995,0,8,12951,0,0,0,'',''),
(19,0,12995,0,8,12951,0,0,0,'',''),
(20,0,12995,0,8,12943,0,0,0,'',''),
(19,0,12995,0,8,12943,0,0,0,'','');

/*
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 23301;
INSERT INTO conditions VALUES
(13,0,23301,0,18,2,29880,0,0,'',''),
(13,0,23301,0,18,2,30243,0,0,'',''),
(13,0,23301,0,18,2,30632,0,0,'',''),
(13,0,23301,0,18,2,30725,0,0,'','');
*/

-- Crush Dem Vrykuls! ... Prev: Let the Baron Know AND Shadow Vault Decree ... NextInChain: Vile Like Fire!
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13071 WHERE entry = 12992;
DELETE FROM conditions WHERE SourceEntry = 12992 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12992,0,8,12951,0,0,0,'',''),
(19,0,12992,0,8,12951,0,0,0,'',''),
(20,0,12992,0,8,12943,0,0,0,'',''),
(19,0,12992,0,8,12943,0,0,0,'','');
-- -- Vile Like Fire! ... Prev: Crush Dem Vrykuls!
UPDATE quest_template SET PrevQuestId = 12992, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13071;

-- Vaelen Has Returned ... Prev: Let the Baron Know AND Shadow Vault Decree ... NextInChain: Ebon Blade Prisoners
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12982 WHERE entry = 13085;
-- Ebon Blade Prisoners ... Prev: Vaelen Has Returned
UPDATE quest_template SET PrevQuestId = 13085, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12982;
-- -- Shoot 'Em Up ... Prev: Ebon Blade Prisoners
UPDATE quest_template SET PrevQuestId = 12982, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13069;

-- To the Rise with all Due Haste! ... Prev: Ebon Blade Prisoners ... NextInChain: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12982, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12807 WHERE entry = 12806;
-- The Story Thus Far... ... Prev: To the Rise with all Due Haste! ... NextInChain: Blood in the Water 
UPDATE quest_template SET PrevQuestId = 12806, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12810 WHERE entry = 12807;
-- Blood in the Water ... Prev: The Story Thus Far... ... NextInChain: You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12814 WHERE entry = 12810;
-- You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12810, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12814;
-- Fix for "You'll Need a Gryphon"
UPDATE `creature_template` SET `spell1`=54420  , `VehicleId`=165  , `InhabitType`=7 WHERE `entry` = 29403;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17 AND SourceEntry = 54420;
INSERT INTO conditions VALUES
(17,0,54420,0,29,29405,10,0,0,'','Deliver Gryphon only near Uzo Deathcaller');

-- -- From Their Corpses, Rise! ... Prev: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12813;
-- -- No Fly Zone ... Prev: You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12814, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12815;
-- -- Intelligence Gathering ... Prev: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12838;
-- -- -- The Grand (Admiral's) Plan ... Prev:  The Story Thus Far... ... NextInChain: In Strict Confidence
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12840 WHERE entry = 12839;
-- -- -- In Strict Confidence ... Prev: The Grand (Admiral's) Plan ... NextInChain: Second Chances
UPDATE quest_template SET PrevQuestId = 12839, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12847 WHERE entry = 12840;
-- -- -- Second Chances ... Prev: In Strict Confidence ... NextInChain: The Admiral Revealed
UPDATE quest_template SET PrevQuestId = 12840, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12852 WHERE entry = 12847;
-- -- -- The Admiral Revealed ... Prev: Second Chances
UPDATE quest_template SET PrevQuestId = 12847, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12852;

-- Eliminate the Competition ... Prev: The Duke ... NextInChain: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12999 WHERE entry = 12955;
-- The Bone Witch ... Prev: Eliminate the Competition
UPDATE quest_template SET PrevQuestId = 12955, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12999;
-- -- Reading the Bones ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13092;
-- -- Reading the Bones Repeatable ... Prev: Reading the Bones
UPDATE quest_template SET PrevQuestId = 13092, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13093;

-- Deep in the Bowels of The Underhalls ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13042;
-- Revenge for the Vargul ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13059;

-- The Sum is Greater than the Parts ... Prev: The Bone Witch ... NextInChain: The Art of Being a Water Terror
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13091 WHERE entry = 13043;
-- The Art of Being a Water Terror ... Prev: The Sum is Greater than the Parts ... NextInChain: Through the Eye
UPDATE quest_template SET PrevQuestId = 13043, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13121 WHERE entry = 13091;
--  Through the Eye ... Prev: The Art of Being a Water Terror ... NextInChain: Find the Ancient Hero
UPDATE quest_template SET PrevQuestId = 13091, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13133 WHERE entry = 13121;
-- Find the Ancient Hero ... Prev: Through the Eye  ... NextInChain: Not-So-Honorable Combat
UPDATE quest_template SET PrevQuestId = 13121, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13137 WHERE entry = 13133;
-- Not-So-Honorable Combat ... Prev: Find the Ancient Hero  ... NextInChain: Banshee's Revenge
UPDATE quest_template SET PrevQuestId = 13133, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13142 WHERE entry =13137;
-- Banshee's Revenge ... Prev: Not-So-Honorable Combat ... NextInChain: Battle at Valhalas
UPDATE quest_template SET PrevQuestId = 13137, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13213 WHERE entry = 13142;
-- Battle at Valhalas ... Prev: Banshee's Revenge
UPDATE quest_template SET PrevQuestId = 13142, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13213;

-- Battle at Valhalas: Fallen Heroes ... Prev: Battle at Valhalas
UPDATE quest_template SET PrevQuestId = 13213, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13214;
-- Battle at Valhalas: Khit'rix the Dark Master ... Prev: Battle at Valhalas: Fallen Heroes
UPDATE quest_template SET PrevQuestId = 13214, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13215;
-- Battle at Valhalas: The Return of Sigrid Iceborn ... Prev: Battle at Valhalas: Khit'rix the Dark Master
UPDATE quest_template SET PrevQuestId = 13215, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13216;
-- Battle at Valhalas: Carnage! ... Prev: Battle at Valhalas: The Return of Sigrid Iceborn
UPDATE quest_template SET PrevQuestId = 13216, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13217;
-- Battle at Valhalas: Thane Deathblow ... Prev: Battle at Valhalas: Carnage!
UPDATE quest_template SET PrevQuestId = 13217, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13218;
-- Battle at Valhalas: Final Challenge ... Prev: Battle at Valhalas: Thane Deathblow
UPDATE quest_template SET PrevQuestId = 13217, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13219;