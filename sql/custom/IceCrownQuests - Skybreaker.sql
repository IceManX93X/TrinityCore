-- ##########################  The Skybreaker ###########################
-- ############# Complete Questlinking ##################################
-- ###### By BroodWyrm ############ source wowhead user Whiterock #######

-- The Skybreaker ... Prequest Crusader Pinacle
UPDATE quest_template SET PrevQuestId = 13157, NextQuestId = 0, ExclusiveGroup = 13225, NextQuestInChain = 0 WHERE entry = 13225;
-- Expoiting a Openinig ... Prev: The Skybreaker AND The Shadow Vault - Next in Chain: Securing the Perimeter
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13225;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13387 WHERE entry = 13386;
DELETE FROM conditions WHERE SourceEntry = 13386 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13386,0,8,12898,0,0,0,'',''),
(19,0,13386,0,8,12898,0,0,0,'',''),
(20,0,13386,0,8,13225,0,0,0,'',''),
(19,0,13386,0,8,13225,0,0,0,'','');

-- Blood of the Choosen ... Prev: The Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13336;
-- Joining the Assault ... Prev: The Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13341;
-- -- Assault by ... Prev: Joining the Assault
UPDATE quest_template SET PrevQuestId = 13341, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13309;
UPDATE quest_template SET PrevQuestId = 13341, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13284;

-- Mind Tricks ... Prev: Skybreaker OR Orgrims Hammer
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13308;
DELETE FROM conditions WHERE SourceEntry = 13308 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13308,0,8,13225,0,0,0,'',''),
(19,0,13308,0,8,13225,0,0,0,'',''),
(20,0,13308,1,8,13224,0,0,0,'',''),
(19,0,13308,1,8,13224,0,0,0,'','');
-- Slaves to Saronite ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13300;
-- Get to Ymirheim! ... Prev: Skybreaker ... NextChain: King of the Mountain
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13280 WHERE entry = 13296;
-- -- King of the Mountain ... Prev Get to Ymirheim
UPDATE quest_template SET PrevQuestId = 13296, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13280;

-- The Broken Front ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13231;
-- -- Finish Me ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13232;
-- No Mercy ... Prev: The Broken Front
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13233;

-- Your Attention, Please ... Prev: The Broken Front ... Next in Chain: Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13291 WHERE entry = 13290;
-- -- Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13290, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13291;
-- -- -- The Solution Solution Prev: Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13291, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13292;
-- -- Killohertz ... Prev: Borrowed Technology ... NextinChain: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13291, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13380 WHERE entry = 13383;
-- -- -- Leading the Charge
UPDATE quest_template SET PrevQuestId = 13383, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13380;
-- -- -- -- Static Shock Troops: the Bombardment Prev: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13380, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13404;
-- -- -- -- Putting the Hertz: The Valley of Lost Hope Prev: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13380, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13382;

-- ...All the Help We Can Get. ... Prev: The Broken Front ... NextInChain: Poke and Prod
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13287 WHERE entry = 13286;
-- Poke and Prod ... Prev: ...All the Help We Can Get.
UPDATE quest_template SET PrevQuestId = 13286, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13287;

-- Against the Giants ... Prev: Poke and Prod ... Next in Chain: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13287, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13295 WHERE entry = 13294;
-- Coprous the Defiled ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13294, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13298;
-- Basic Chemistry ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13294, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13295;
-- -- Neutralizing the Plague ... Prev: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13295, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13297;

-- That's Abominable! ... Prev: Poke and Prod 
UPDATE quest_template SET PrevQuestId = 13287, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13288;
-- -- That's Abominable! Daily ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13288, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13289;

-- Sneak Preview ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13288, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13315;
-- Chain of Command ... Prev: Sneak Preview
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13319;
-- Cannot Reproduce ... Prev: Sneak Preview ... Next In Chain: Retest Now
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13321 WHERE entry = 13320;
-- -- Retest Now ... Prev: Cannot Reproduce
UPDATE quest_template SET PrevQuestId = 13320, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13321;
-- -- Retest Now Daily ... Prev: Retest Now
UPDATE quest_template SET PrevQuestId = 13321, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13322;

-- Drag and Drop ... Prev: Sneak Preview  
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13318;
-- -- Drag and Drop Daily ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13323;
-- -- Not a Bug ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13342;
-- -- -- Not a Bug Daily ... Prev: Not a Bug
UPDATE quest_template SET PrevQuestId = 13342, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13344;

-- Need more Info ... Prev: Drag and Drop ... Next in Chain: No Rest For The Wicked
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13346 WHERE entry = 13345;
-- No Rest For the Wicked ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13345, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13346;
-- -- No Rest For the Wicked Daily ... Prev: No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 13346, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13350;
-- Raise the Barricades ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13345, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13332;

-- The Ironwall Rampart ... Prev: Raise the Barricades AND No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13337;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13346;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13332;
DELETE FROM conditions WHERE SourceEntry = 13337 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13337,0,8,13346,0,0,0,'',''),
(19,0,13337,0,8,13346,0,0,0,'',''),
(20,0,13337,0,8,13332,0,0,0,'',''),
(19,0,13337,0,8,13332,0,0,0,'','');

-- Get the Message ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13332, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13314;
-- -- Capture More Dispatches ... Prev: Get the Message
UPDATE quest_template SET PrevQuestId = 13314, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13333;
-- Bloodspattered Banners ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13332, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13334;
-- Before the Gate of Horror ... Prev:  Bloodspattered Banners AND The Ironwall Rampart
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13335;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13334;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13337;
DELETE FROM conditions WHERE SourceEntry = 13335 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13335,0,8,13334,0,0,0,'',''),
(19,0,13335,0,8,13334,0,0,0,'',''),
(20,0,13335,0,8,13337,0,0,0,'',''),
(19,0,13335,0,8,13337,0,0,0,'','');

-- Shatter the Shards ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13335, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13339;
-- The Guardians of Corp'rethar ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13335, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13338;