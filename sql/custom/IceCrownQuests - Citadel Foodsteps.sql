-- ########################## Citadel Footsteps #########################
-- ############# Complete Questlinking ##################################
-- ###### By BroodWyrm ############ source wowhead user Whiterock #######

-- Blackwatch ... Prev: The Shadow Vault Allianz OR The Shadow Vault Horde
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13106;
DELETE FROM conditions WHERE SourceEntry = 13106 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13106,0,8,12898,0,0,0,'',''),
(19,0,13106,0,8,12898,0,0,0,'',''),
(20,0,13106,1,8,12899,0,0,0,'',''),
(19,0,13106,1,8,12899,0,0,0,'','');

-- Where Are They Coming From? ... Prev: Blackwatch
UPDATE quest_template SET PrevQuestId = 13106, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13117;

-- Death's Gaze ... Prev: Where Are They Coming From?
UPDATE quest_template SET PrevQuestId = 13117, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13120;
-- Destroying the Altars ... Prev: Where Are They Coming From?
UPDATE quest_template SET PrevQuestId = 13117, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13119;

-- I'm Not Dead Yet! H ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13229;
DELETE FROM conditions WHERE SourceEntry = 13229 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13229,0,8,13120,0,0,0,'',''),
(19,0,13229,0,8,13120,0,0,0,'',''),
(20,0,13229,0,8,13119,0,0,0,'',''),
(19,0,13229,0,8,13119,0,0,0,'','');
-- I'm Not Dead Yet! A ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13221;
DELETE FROM conditions WHERE SourceEntry = 13221 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13221,0,8,13120,0,0,0,'',''),
(19,0,13221,0,8,13120,0,0,0,'',''),
(20,0,13221,0,8,13119,0,0,0,'',''),
(19,0,13221,0,8,13119,0,0,0,'','');

-- Spill Their Blood ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13134;
DELETE FROM conditions WHERE SourceEntry = 13134 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13134,0,8,13120,0,0,0,'',''),
(19,0,13134,0,8,13120,0,0,0,'',''),
(20,0,13134,0,8,13119,0,0,0,'',''),
(19,0,13134,0,8,13119,0,0,0,'','');
-- Jagged Shards ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13136;
DELETE FROM conditions WHERE SourceEntry = 13136 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13136,0,8,13120,0,0,0,'',''),
(19,0,13136,0,8,13120,0,0,0,'',''),
(20,0,13136,0,8,13119,0,0,0,'',''),
(19,0,13136,0,8,13119,0,0,0,'','');

-- The Runesmiths of Malykriss ... Prev: Jagged Shards     
UPDATE quest_template SET PrevQuestId = 13136, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13140;
-- I'm Smelting... Smelting! ... Prev: Jagged Shards
UPDATE quest_template SET PrevQuestId = 13136, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13138;
-- By Fire Be Purged ... Prev: I'm Smelting... Smelting! AND The Runesmiths of Malykriss AND Spill Their Blood 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13211;
DELETE FROM conditions WHERE SourceEntry = 13211 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13211,0,8,13140,0,0,0,'',''),
(19,0,13211,0,8,13140,0,0,0,'',''),
(20,0,13211,0,8,13134,0,0,0,'',''),
(19,0,13211,0,8,13134,0,0,0,'',''),
(20,0,13211,0,8,13138,0,0,0,'',''),
(19,0,13211,0,8,13138,0,0,0,'','');
-- A Visit to the Doctor ... Prev: I'm Smelting... Smelting! AND The Runesmiths of Malykriss AND Spill Their Blood 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13152;
DELETE FROM conditions WHERE SourceEntry = 13152 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13152,0,8,13140,0,0,0,'',''),
(19,0,13152,0,8,13140,0,0,0,'',''),
(20,0,13152,0,8,13134,0,0,0,'',''),
(19,0,13152,0,8,13134,0,0,0,'',''),
(20,0,13152,0,8,13138,0,0,0,'',''),
(19,0,13152,0,8,13138,0,0,0,'','');

-- Killing Two Scourge With One Skeleton ... Prev: A Visit to the Doctor AND By Fire Be Purged
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13144;
DELETE FROM conditions WHERE SourceEntry = 13144 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13144,0,8,13152,0,0,0,'',''),
(19,0,13144,0,8,13152,0,0,0,'',''),
(20,0,13144,0,8,13211,0,0,0,'',''),
(19,0,13144,0,8,13211,0,0,0,'','');

-- Let's Get Out of Here A ... Prev: Killing Two Scourge With One Skeleton 
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13482;
-- Let's Get Out of Here H ... Prev: Killing Two Scourge With One Skeleton
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13481;
-- He's Gone to Pieces ... Prev: Killing Two Scourge With One Skeleton ... NextQuestInChain: Putting Olakin Back Together Again
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13220 WHERE entry = 13212;
-- Putting Olakin Back Together Again ... Prev: He's Gone to Pieces ... NextQuestInChain: The Flesh Giant Champion
UPDATE quest_template SET PrevQuestId = 13212, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13235 WHERE entry = 13220;
-- The Flesh Giant Champion ... Prev: Putting Olakin Back Together Again
UPDATE quest_template SET PrevQuestId = 13220, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13235;

-- ####################################################

-- Exploiting an Opening(A) ... Prev: The SkyBreaker AND The ShadowVault ... NextQuestInChain: Securing the Perimeter
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13387 WHERE entry = 13386;
DELETE FROM conditions WHERE SourceEntry = 13386 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13386,0,8,12898,0,0,0,'',''),
(19,0,13386,0,8,12898,0,0,0,'',''),
(20,0,13386,0,8,13225,0,0,0,'',''),
(19,0,13386,0,8,13225,0,0,0,'','');
-- Securing the Perimeter ... Prev: Exploiting an Opening ... NextQuestInChain: Set it Off!
UPDATE quest_template SET PrevQuestId = 13386, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13388 WHERE entry = 13387;
-- Set it Off! ... Prev: Securing the Perimeter ... NextQuestInChain: A Short Fuse
UPDATE quest_template SET PrevQuestId = 13387, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13389 WHERE entry = 13388;
-- A Short Fuse ... Prev: Set it Off! ... NextQuestInChain: A Voice in the Dark
UPDATE quest_template SET PrevQuestId = 13388, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13390 WHERE entry = 13389;
-- A Voice in the Dark ... Prev: A Short Fuse ... NextQuestInChain: Time to Hide
UPDATE quest_template SET PrevQuestId = 13389, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13391 WHERE entry = 13390;
--  Time to Hide ... Prev:  A Voice in the Dark ... NextQuestInChain: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13390, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13392 WHERE entry = 13391;
-- Return to the Surface ... Prev: Time to Hide ... NextQuestInChain: Field Repairs
UPDATE quest_template SET PrevQuestId = 13391, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13393 WHERE entry = 13392;
-- Field Repairs ... Prev: Return to the Surface 
UPDATE quest_template SET PrevQuestId = 13392, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13393;

-- Do Your Worst ... Prev: Field Repairs ... NextQuestInChain: Army of the Damned
UPDATE quest_template SET PrevQuestId = 13393, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13395 WHERE entry = 13394;
-- Army of the Damned ... Prev: Do Your Worst ... NextQuestInChain: Futility
UPDATE quest_template SET PrevQuestId = 13394, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13396 WHERE entry = 13395;
-- Futility ... Prev: Army of the Damned ... NextQuestInChain: Sindragosa's Fall
UPDATE quest_template SET PrevQuestId = 13395, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13397 WHERE entry = 13396;
-- Sindragosa's Fall ... Prev: Futility 
UPDATE quest_template SET PrevQuestId = 13396, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13397;

-- Where Dragons Fell ... Prev: Futility ... NextQuestInChain:	Time for Answers	
UPDATE quest_template SET PrevQuestId = 13396, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13399 WHERE entry = 13398;
-- Time for Answers ... Prev: Where Dragons Fell ... NextQuestInChain: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13398, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13400 WHERE entry = 13399;
-- The Hunter and the Prince ... Prev: Time for Answers ... NextQuestInChain: Knowledge is a Terrible Burden
UPDATE quest_template SET PrevQuestId = 13399, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13401 WHERE entry = 13400;
-- Knowledge is a Terrible Burden ... Prev: The Hunter and the Prince ... NextQuestInChain: Tirion's Help
UPDATE quest_template SET PrevQuestId = 13400, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13402 WHERE entry = 13401;
-- Tirion's Help ... Prev: Knowledge is a Terrible Burden ... NextQuestInChain: Tirion's Gambit
UPDATE quest_template SET PrevQuestId = 13401, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13403 WHERE entry = 13402;
-- Tirion's Gambit ... Prev: Tirion's Help
UPDATE quest_template SET PrevQuestId = 13402, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13403;

-- ####################################################

-- Opportunity ... Prev: Orgrim's Hammer AND The ShadowVault ... NextQuestInChain: Establishing Superiority
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13259 WHERE entry = 13258;
DELETE FROM conditions WHERE SourceEntry = 13258 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13258,0,8,13224,0,0,0,'',''),
(19,0,13258,0,8,13224,0,0,0,'',''),
(20,0,13258,0,8,12899,0,0,0,'',''),
(19,0,13258,0,8,12899,0,0,0,'','');

-- Establishing Superiority ... Prev: Opportunity ... NextQuestInChain: Blow it Up!
UPDATE quest_template SET PrevQuestId = 13258, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13262 WHERE entry = 13259;
-- Blow it Up! ... Prev:  Establishing Superiority ... NextQuestInChain: A Short Fuse
UPDATE quest_template SET PrevQuestId = 13259, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13263 WHERE entry = 13262;
-- A Short Fuse ... Prev: Blow it Up! ... NextQuestInChain: A Voice in the Dark
UPDATE quest_template SET PrevQuestId = 13262, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13271 WHERE entry = 13263;
-- A Voice in the Dark ... Prev: A Short Fuse ... NextQuestInChain: Time to Hide
UPDATE quest_template SET PrevQuestId = 13263, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13275 WHERE entry = 13271;
-- Time to Hide ... Prev: A Voice in the Dark ... NextQuestInChain: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13271, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13282 WHERE entry = 13275;
-- Return to the Surface ... Prev: Time to Hide ... NextQuestInChain: Field Repairs
UPDATE quest_template SET PrevQuestId = 13275, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13304 WHERE entry = 13282;
-- Field Repairs ... Prev: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13282, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13304;

-- Do Your Worst ... Prev: Field Repairs ... NextQuestInChain: Army of the Damned
UPDATE quest_template SET PrevQuestId = 13304, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13236 WHERE entry = 13305;
-- Army of the Damned ... Prev: Do Your Worst ... NextQuestInChain: Futility
UPDATE quest_template SET PrevQuestId = 13305, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13348 WHERE entry = 13236;
-- Futility ... Prev: Army of the Damned ... NextQuestInChain: Cradle of the Frostbrood
UPDATE quest_template SET PrevQuestId = 13236, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13349 WHERE entry = 13348;
-- Cradle of the Frostbrood ... Prev: Futility
UPDATE quest_template SET PrevQuestId = 13348, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13349;

-- Where Dragons Fell ... Prev: Futility
UPDATE quest_template SET PrevQuestId = 13349, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13359;
-- Time for Answers ... Prev: Where Dragons Fell ... NextQuestInChain: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13359, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13361 WHERE entry = 13360;
-- The Hunter and the Prince ... Prev: Time for Answers ... NextQuestInChain: Knowledge is a Terrible Burden
UPDATE quest_template SET PrevQuestId = 13360, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13362 WHERE entry = 13361;
-- Knowledge is a Terrible Burden ... Prev: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13361, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13362;

-- Argent Aid ... Prev: Knowledge is a Terrible Burden ... NextQuestInChain: Tirion's Gambit
UPDATE quest_template SET PrevQuestId = 13362, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13364 WHERE entry = 13363;
-- Tirion's Gambit ... Prev: Argent Aid
UPDATE quest_template SET PrevQuestId = 13363, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13364;

-- ###############################

-- Parting Gifts ... Prev: A Short Fuse A OR A Short Fuse H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13168;
DELETE FROM conditions WHERE SourceEntry = 13168 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13168,0,8,13263,0,0,0,'',''),
(19,0,13168,0,8,13263,0,0,0,'',''),
(20,0,13168,1,8,13389,0,0,0,'',''),
(19,0,13168,1,8,13389,0,0,0,'','');

-- An Undead's Best Friend ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13169;
-- Honor is for the Weak ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13170;
-- From Whence They Came ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13171;

-- Seeds of Chaos ... Prev: An Undead's Best Friend AND Honor is for the Weak AND From Whence They Came
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13172;
DELETE FROM conditions WHERE SourceEntry = 13172 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13172,0,8,13169,0,0,0,'',''),
(19,0,13172,0,8,13169,0,0,0,'',''),
(20,0,13172,0,8,13170,0,0,0,'',''),
(19,0,13172,0,8,13170,0,0,0,'',''),
(20,0,13172,0,8,13171,0,0,0,'',''),
(19,0,13172,0,8,13171,0,0,0,'','');
-- Amidst the Confusion ... Prev: An Undead's Best Friend AND Honor is for the Weak AND From Whence They Came
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13174;
DELETE FROM conditions WHERE SourceEntry = 13174 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13174,0,8,13169,0,0,0,'',''),
(19,0,13174,0,8,13169,0,0,0,'',''),
(20,0,13174,0,8,13170,0,0,0,'',''),
(19,0,13174,0,8,13170,0,0,0,'',''),
(20,0,13174,0,8,13171,0,0,0,'',''),
(19,0,13174,0,8,13171,0,0,0,'','');

-- Vereth the Cunning ... Prev: Amidst the Confusion AND Seeds of Chaos ... NextQuestInChain: New Recruit
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13143 WHERE entry = 13155;
DELETE FROM conditions WHERE SourceEntry = 13155 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13155,0,8,13174,0,0,0,'',''),
(19,0,13155,0,8,13174,0,0,0,'',''),
(20,0,13155,0,8,13172,0,0,0,'',''),
(19,0,13155,0,8,13172,0,0,0,'','');

-- New Recruit ... Prev: Vereth the Cunning ... NextQuestInChain: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13155, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13145 WHERE entry = 13143;
-- The Vile Hold ... Prev: New Recruit
UPDATE quest_template SET PrevQuestId = 13143, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13145;

-- Generosity Abounds ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13146;
-- Stunning View ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13160;
-- Matchmaker ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13147;

-- The Rider of the Unholy ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13161;
DELETE FROM conditions WHERE SourceEntry = 13161 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13161,0,8,13146,0,0,0,'',''),
(19,0,13161,0,8,13146,0,0,0,'',''),
(20,0,13161,0,8,13160,0,0,0,'',''),
(19,0,13161,0,8,13160,0,0,0,'',''),
(20,0,13161,0,8,13147,0,0,0,'',''),
(19,0,13161,0,8,13147,0,0,0,'','');
-- The Rider of the Frost ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13162;
DELETE FROM conditions WHERE SourceEntry = 13162 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13162,0,8,13146,0,0,0,'',''),
(19,0,13162,0,8,13146,0,0,0,'',''),
(20,0,13162,0,8,13160,0,0,0,'',''),
(19,0,13162,0,8,13160,0,0,0,'',''),
(20,0,13162,0,8,13147,0,0,0,'',''),
(19,0,13162,0,8,13147,0,0,0,'','');
-- The Rider of the Blood ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13163;
DELETE FROM conditions WHERE SourceEntry = 13163 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13163,0,8,13146,0,0,0,'',''),
(19,0,13163,0,8,13146,0,0,0,'',''),
(20,0,13163,0,8,13160,0,0,0,'',''),
(19,0,13163,0,8,13160,0,0,0,'',''),
(20,0,13163,0,8,13147,0,0,0,'',''),
(19,0,13163,0,8,13147,0,0,0,'','');

-- The Fate of Bloodbane ... Prev: The Rider of the Blood AND Frost AND Unholy
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13164;
DELETE FROM conditions WHERE SourceEntry = 13164 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13164,0,8,13161,0,0,0,'',''),
(19,0,13164,0,8,13161,0,0,0,'',''),
(20,0,13164,0,8,13162,0,0,0,'',''),
(19,0,13164,0,8,13162,0,0,0,'',''),
(20,0,13164,0,8,13163,0,0,0,'',''),
(19,0,13164,0,8,13163,0,0,0,'','');
