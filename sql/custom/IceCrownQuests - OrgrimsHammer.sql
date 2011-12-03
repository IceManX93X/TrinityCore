-- ##########################  Orgrim's Hammer ##########################
-- ############# Complete Questlinking ##################################
-- ###### By BroodWyrm ############ source wowhead user Whiterock #######

--
-- DELETE FROM `creature_transport` WHERE `guid`=77 AND `transport_entry`=192241 AND `npc_entry`=31261;
-- INSERT INTO `creature_transport` (`guid`,`transport_entry`,`npc_entry`,`TransOffsetX`,`TransOffsetY`,`TransOffsetZ`,`TransOffsetO`,`emote`) VALUES
-- (77,192241,31261,52.5,5.3,30.5268,3.94314,0);


-- Orgrim's Hammer ... Prequest Crusader Pinacle
UPDATE quest_template SET PrevQuestId = 13157, NextQuestId = 0, ExclusiveGroup = 13225, NextQuestInChain = 0 WHERE entry = 13224;
-- Expoiting a Openinig ... Prev: Orgrim's Hammer AND The Shadow Vault - Next in Chain: Securing the Perimeter
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13224;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13259 WHERE entry = 13258;
DELETE FROM conditions WHERE SourceEntry = 13258 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13258,0,8,12899,0,0,0,'',''),
(19,0,13258,0,8,12899,0,0,0,'',''),
(20,0,13258,0,8,13224,0,0,0,'',''),
(19,0,13258,0,8,13224,0,0,0,'','');


-- Blood of the Choosen ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13330;
-- Joining the Assault ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13340;
-- -- Assault by ... Prev: Joining the Assault
UPDATE quest_template SET PrevQuestId = 13340, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13310;
UPDATE quest_template SET PrevQuestId = 13340, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13301;

-- Mind Tricks ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13308;
DELETE FROM conditions WHERE SourceEntry = 13308 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13308,0,8,13225,0,0,0,'',''),
(19,0,13308,0,8,13225,0,0,0,'',''),
(20,0,13308,1,8,13224,0,0,0,'',''),
(19,0,13308,1,8,13224,0,0,0,'','');
-- Slaves to Saronite ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13302;
-- Get to Ymirheim! ... Prev: Orgrim's Hammer ... NextChain: King of the Mountain
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13283 WHERE entry = 13293;
-- -- King of the Mountain ... Prev Get to Ymirheim
UPDATE quest_template SET PrevQuestId = 13293, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13283;

-- The Broken Front ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13228;
-- -- Avenge me... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13230;
-- Make Them Pay! ... Prev: The Broken Front
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13234;

-- Good For Something? ... Prev: The Broken Front ... Next in Chain: Volatility
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13239 WHERE entry = 13238;
-- -- Volatility
UPDATE quest_template SET PrevQuestId = 13238, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13239;
-- -- -- Volatility Daily ... Prev: Volatility
UPDATE quest_template SET PrevQuestId = 13239, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13261;
-- -- Green Technology ... Prev: Volatility ... NextinChain: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13239, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13373 WHERE entry = 13379;
-- -- -- Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13379, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13373;
-- -- -- -- Riding the Wavelength: The Bombardment ... Prev: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13373, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13406;
-- -- -- -- Total Ohmage: The Valley of Lost Hope! ... Prev: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13373, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13376;

-- Takes One to Know One ... Prev: The Broken Front ... NextInChain: Poke and Prod
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13237 WHERE entry = 13260;
-- Poke and Prod ... Prev: Takes One to Know One
UPDATE quest_template SET PrevQuestId =  13260, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13237;

-- Against the Giants ... Prev: Poke and Prod ... Next in Chain: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13237, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13279 WHERE entry = 13277;
-- Coprous the Defiled ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13277, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13278;
-- Basic Chemistry ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13277, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13279;
-- -- Neutralizing the Plague ... Prev: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13279, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13281;

-- That's Abominable! ... Prev: Poke and Prod 
UPDATE quest_template SET PrevQuestId = 13237, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13264;
-- -- That's Abominable! Daily ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13264, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13276;

-- Sneak Preview ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13264, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13351;
-- Chain of Command ... Prev: Sneak Preview
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13354;
-- Cannot Reproduce ... Prev: Sneak Preview ... Next In Chain: Retest Now
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13356 WHERE entry = 13355;
-- -- Retest Now ... Prev: Cannot Reproduce
UPDATE quest_template SET PrevQuestId = 13355, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13356;
-- -- Retest Now Daily ... Prev: Retest Now
UPDATE quest_template SET PrevQuestId = 13356, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13357;

-- Drag and Drop ... Prev: Sneak Preview  
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13352;
-- -- Drag and Drop Daily ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13353;
-- -- Not a Bug ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13358;
-- -- -- Not a Bug Daily ... Prev: Not a Bug
UPDATE quest_template SET PrevQuestId = 13358, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13365;

-- Need more Info ... Prev: Drag and Drop ... Next in Chain: No Rest For The Wicked
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13367 WHERE entry = 13366;
-- No Rest For the Wicked ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13366, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13367;
-- -- No Rest For the Wicked Daily ... Prev: No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 13367, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13368;
-- Raise the Barricades ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13366, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13306;

-- The Ironwall Rampart ... Prev: Raise the Barricades AND No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13312;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13306;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13367;
DELETE FROM conditions WHERE SourceEntry = 13312 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13312,0,8,13306,0,0,0,'',''),
(19,0,13312,0,8,13306,0,0,0,'',''),
(20,0,13312,0,8,13367,0,0,0,'',''),
(19,0,13312,0,8,13367,0,0,0,'','');

-- Blinding the Eyes in the Sky ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13306, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13313;
-- -- Keeping the Alliance Blind ... Prev: Blinding the Eyes in the Sky
UPDATE quest_template SET PrevQuestId = 13313, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13331;
-- Bloodspattered Banners ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13306, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13307;
-- Before the Gate of Horror ... Prev:  Bloodspattered Banners AND The Ironwall Rampart
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13329;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13307;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13312;
DELETE FROM conditions WHERE SourceEntry = 13329 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13329,0,8,13307,0,0,0,'',''),
(19,0,13329,0,8,13307,0,0,0,'',''),
(20,0,13329,0,8,13312,0,0,0,'',''),
(19,0,13329,0,8,13312,0,0,0,'','');

-- Shatter the Shards ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13329, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13328;
-- The Guardians of Corp'rethar ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13329, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13316;