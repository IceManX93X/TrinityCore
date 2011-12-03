SET @RUNED_ORB          := 45087;
SET @EMBLEM_OF_CONQUEST := 45624;
SET @SACK_10            := 45875;
SET @SACK_25            := 45878;

UPDATE `item_template` SET `minMoneyLoot`=1000000,`maxMoneyLoot`=1000000 WHERE `entry`=@SACK_10;
UPDATE `item_template` SET `minMoneyLoot`=1500000,`maxMoneyLoot`=1500000 WHERE `entry`=@SACK_25;

DELETE FROM `item_loot_template` WHERE `entry` IN (@SACK_10,@SACK_25);
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
-- Sack of Ulduar Spoils
(@SACK_10,@EMBLEM_OF_CONQUEST,100,1,0,5,5),
(@SACK_10,@RUNED_ORB,100,1,0,1,1),
-- Large Sack of Ulduar Spoils
(@SACK_25,@EMBLEM_OF_CONQUEST,100,1,0,10,10),
(@SACK_25,@RUNED_ORB,100,1,0,2,2),
(@SACK_25,45105,0,1,1,1,1),
(@SACK_25,45104,0,1,1,1,1),
(@SACK_25,45103,0,1,1,1,1),
(@SACK_25,45102,0,1,1,1,1),
(@SACK_25,45100,0,1,1,1,1),
(@SACK_25,45099,0,1,1,1,1),
(@SACK_25,45098,0,1,1,1,1),
(@SACK_25,45101,0,1,1,1,1),
(@SACK_25,45095,0,1,1,1,1),
(@SACK_25,45096,0,1,1,1,1),
(@SACK_25,45094,0,1,1,1,1),
(@SACK_25,45097,0,1,1,1,1),
(@SACK_25,45091,0,1,1,1,1),
(@SACK_25,45088,0,1,1,1,1),
(@SACK_25,45092,0,1,1,1,1),
(@SACK_25,45093,0,1,1,1,1),
(@SACK_25,45090,0,1,1,1,1),
(@SACK_25,45089,0,1,1,1,1);