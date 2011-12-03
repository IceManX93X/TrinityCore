-- ##########################  Crusaders' Pinnacle ##########################
-- ############# Complete Questlinking ##################################
-- ###### By BroodWyrm ############ source wowhead user Whiterock #######

-- Judgment Day Comes! Allianz ... Next Quest: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 13036, ExclusiveGroup = 13226, NextQuestInChain = 0 WHERE entry = 13226;

-- Judgment Day Comes! Horde ... Next Quest: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 13036, ExclusiveGroup = 13226, NextQuestInChain = 0 WHERE entry = 13227;

-- Wenn das nicht funktioniert:
-- Honor Above All Else ... Prev: Judgment Day Comes! Allianz ODER Judgment Day Comes! Horde ... NextInChain: Scourge Tactics
-- DELETE FROM conditions WHERE SourceEntry = 13036 AND SourceTypeOrReferenceId IN (20,19);
-- INSERT INTO conditions VALUES
-- (20,0,13036,0,8,13226,0,0,0,'',''),
-- (19,0,13036,0,8,13226,0,0,0,'',''),
-- (20,0,13036,1,8,13227,0,0,0,'',''),
-- (19,0,13036,1,8,13227,0,0,0,'','');
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13008 WHERE entry = 13036;

-- Scourge Tactics ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13008;
-- Defending The Vanguard ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13039;
-- Curing The Incurable ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13040;

-- If There Are Survivors... Prev: Scourge Tactics AND Defending The Vanguard AND Curing The Incurable
-- NextInChain: Into The Wild Green Yonder
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE entry = 13008;
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE entry = 13039;
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE entry = 13040;
UPDATE quest_template SET PrevQuestId = 13008, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13045 WHERE entry = 13044;
-- Into The Wild Green Yonder ... Prev:  If There Are Survivors ... NextInChain: A Cold Front Approaches
UPDATE quest_template SET PrevQuestId = 13044, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13070 WHERE entry = 13045;
-- A Cold Front Approaches ... Prev: Into The Wild Green Yonder ... NextInChain: The Last Line Of Defense
UPDATE quest_template SET PrevQuestId = 13045, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13086 WHERE entry = 13070;
-- The Last Line Of Defense ... Prev: A Cold Front Approaches
UPDATE quest_template SET PrevQuestId = 13070, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13086;

-- Tirions Mount
DELETE FROM `creature_template_addon` WHERE `entry` IN (30677);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30677,0,2325,0,0,0,'');  -- Tirion Fordring - Mount

-- Once More Unto The Breach, Hero
-- Once More Unto The Breach, Hero  DK only
UPDATE quest_template SET PrevQuestId = 13086, NextQuestId = 0, ExclusiveGroup = 13104, NextQuestInChain = 0 WHERE entry = 13104;
UPDATE quest_template SET PrevQuestId = 13086, NextQuestId = 0, ExclusiveGroup = 13104, NextQuestInChain = 0 WHERE entry = 13105;

-- The Scourgestone ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13122;
DELETE FROM conditions WHERE SourceEntry = 13122 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13122,0,8,13104,0,0,0,'',''),
(19,0,13122,0,8,13104,0,0,0,'',''),
(20,0,13122,1,8,13105,0,0,0,'',''),
(19,0,13122,1,8,13105,0,0,0,'','');

-- The Purging Of Scourgeholme ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13118;
DELETE FROM conditions WHERE SourceEntry = 13118 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13118,0,8,13104,0,0,0,'',''),
(19,0,13118,0,8,13104,0,0,0,'',''),
(20,0,13118,1,8,13105,0,0,0,'',''),
(19,0,13118,1,8,13105,0,0,0,'','');

-- The Restless Dead ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13110;
DELETE FROM conditions WHERE SourceEntry = 13110 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13110,0,8,13104,0,0,0,'',''),
(19,0,13110,0,8,13104,0,0,0,'',''),
(20,0,13110,1,8,13105,0,0,0,'',''),
(19,0,13110,1,8,13105,0,0,0,'','');


-- It Could Kill Us All ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13135;
DELETE FROM conditions WHERE SourceEntry = 13135 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13135,0,8,13104,0,0,0,'',''),
(19,0,13135,0,8,13104,0,0,0,'',''),
(20,0,13135,1,8,13105,0,0,0,'',''),
(19,0,13135,1,8,13105,0,0,0,'','');

-- The Stone That Started A Revolution ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13130;
DELETE FROM conditions WHERE SourceEntry = 13130 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13130,0,8,13104,0,0,0,'',''),
(19,0,13130,0,8,13104,0,0,0,'',''),
(20,0,13130,1,8,13105,0,0,0,'',''),
(19,0,13130,1,8,13105,0,0,0,'','');

-- The Air Stands Still ... Prev: The Scourgestone UND The Purging Of Scourgeholme
UPDATE quest_template SET NextQuestId = 13125, ExclusiveGroup = -13122 WHERE entry = 13122;
UPDATE quest_template SET NextQuestId = 13125, ExclusiveGroup = -13122 WHERE entry = 13118;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13125;

-- Into The Frozen Heart Of Northrend ... Prev: The Air Stands Still AND The Restless Dead AND The Stone That Started A Revolution AND It Could Kill Us All
-- NextQuestInChain: The Battle For Crusaders' Pinnacle
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13135;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13110;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13130;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13125;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13141 WHERE entry = 13139;

-- The Battle For Crusaders' Pinnacle ... Prev: Into The Frozen Heart Of Northrend ... NextQuestInChain: The Crusaders' Pinnacle
UPDATE quest_template SET PrevQuestId = 13139, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13157 WHERE entry = 13141;
-- The Crusaders' Pinnacle ... PRev: The Battle For Crusaders' Pinnacle
UPDATE quest_template SET PrevQuestId = 13141, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13157;