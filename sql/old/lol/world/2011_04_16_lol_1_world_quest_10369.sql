-- Fix Quest 'Arzeth's Demise' #10369
SET @Quest      = 10369;
SET @Merciless  = 19354;
SET @Powerless  = 20680;
SET @Spell      = 35460;

UPDATE quest_template SET ReqCreatureOrGOId1 = @Powerless, ReqCreatureOrGOCount1 = 1 WHERE entry = @Quest;
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = @Merciless;
-- SAI
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = @Merciless;
INSERT INTO smart_scripts VALUES
(@Merciless,0,0,0,8,0,100,0,@Spell,0,0,0,36,@Powerless,0,0,0,0,0,1,0,0,0,0,0,0,0,'on spellhit - change template to Arzeth the Powerless');