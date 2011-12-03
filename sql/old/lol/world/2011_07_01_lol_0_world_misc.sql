SET @GUID := 303044;

-- unify money reward
UPDATE `quest_template` SET `RewOrReqMoney`=37000, `RewMoneyMaxLevel`=66300 WHERE `title`='Honor the Flame';

######################
## flame warden (A) ##
######################
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry`=11583 OR `entry` BETWEEN 11804 AND 11834;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=25883 OR `entry` BETWEEN 25887 AND 25917;

-- questrelations
DELETE FROM `creature_questrelation` WHERE `quest`=11583 OR `quest` BETWEEN 11804 AND 11834;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
## outland
(25889,11807), -- blades edge
(25903,11821), -- nagrand
(25905,11823), -- shadowmoon
(25912,11829), -- nagrand
(25900,11818), -- hellfire
(25913,11830), -- netherstorm
(25907,11825), -- terokkar
## kalimdor
(25883,11805), -- ashenvale
(25891,11809), -- bloodmyst
(25894,11812), -- desolace
(25899,11817), -- feralas
(25906,11824), -- teldrassil
(25888,11806), -- azuremyst
(25893,11811), -- darkshore
(25897,11815), -- dustwallow marsh
(25914,11831), -- silithus
(25916,11833), -- tanaris
(25917,11834), -- winterspring
## eastern kingdoms
(25887,11804), -- arathi highlands
(25892,11810), -- burning steppes
(25896,11814), -- duskwood
(25901,11819), -- hillsbrad foothills
(25904,11822), -- redridge mountains
(25908,11826), -- hinterlands
(25909,11827), -- western plaguelands
(25890,11808), -- blasted lands
(25895,11813), -- dun morogh
(25898,11816), -- elwynn forest
(25902,11820), -- loch modan
(25915,11832), -- stranglethorn vale
(25911,11828), -- wetlands
(25910,11583); -- westfall

-- involvedrelations
DELETE FROM `creature_involvedrelation` WHERE `quest`=11583 OR `quest` BETWEEN 11804 AND 11834;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
## outland
(25889,11807), -- blades edge
(25903,11821), -- nagrand
(25905,11823), -- shadowmoon
(25912,11829), -- nagrand
(25900,11818), -- hellfire
(25913,11830), -- netherstorm
(25907,11825), -- terokkar
## kalimdor
(25883,11805), -- ashenvale
(25891,11809), -- bloodmyst
(25894,11812), -- desolace
(25899,11817), -- feralas
(25906,11824), -- teldrassil
(25888,11806), -- azuremyst
(25893,11811), -- darkshore
(25897,11815), -- dustwallow marsh
(25914,11831), -- silithus
(25916,11833), -- tanaris
(25917,11834), -- winterspring
## eastern kingdoms
(25887,11804), -- arathi highlands
(25892,11810), -- burning steppes
(25896,11814), -- duskwood
(25901,11819), -- hillsbrad foothills
(25904,11822), -- redridge mountains
(25908,11826), -- hinterlands
(25909,11827), -- western plaguelands
(25890,11808), -- blasted lands
(25895,11813), -- dun morogh
(25898,11816), -- elwynn forest
(25902,11820), -- loch modan
(25915,11832), -- stranglethorn vale
(25911,11828), -- wetlands
(25910,11583); -- westfall

-- spawn missing warden
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+10;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'25888','530','1','1','0','0','-4204.55','-12333.2','2.34492','2.74105','30','0','0','1524','0','0','0','0','0'),
(@GUID+1,'25889','530','1','1','0','0','2024.83','6607.65','137.407','0.480902','30','0','0','1524','0','0','0','0','0'),
(@GUID+2,'25891','530','1','1','0','0','-2175.01','-11885','32.3573','2.36091','30','0','0','1524','0','0','0','0','0'),
(@GUID+3,'25892','0','1','1','0','0','-8231.91','-2611.69','133.167','1.84443','30','0','0','1524','0','0','0','0','0'),
(@GUID+4,'25899','1','1','1','0','0','-4396.98','3459.2','10.8561','5.49229','30','0','0','1524','0','0','0','0','0'),
(@GUID+5,'25903','530','1','1','0','0','-2491.53','7538.32','-1.03453','2.51409','30','0','0','3052','0','0','0','0','0'),
(@GUID+6,'25905','530','1','1','0','0','-3926.57','2037.81','95.1806','6.08835','30','0','0','42','0','0','0','0','0'),
(@GUID+7,'25907','530','1','1','0','0','-2983.44','4165.95','7.86408','3.07031','30','0','0','42','0','0','0','0','0'),
(@GUID+8,'25909','0','1','1','0','0','1004.72','-1447.66','61.8342','5.14376','30','0','0','42','0','0','0','0','0'),
(@GUID+9,'25912','530','1','1','0','0','244.981','5998.43','23.8744','2.19129','30','0','0','42','0','0','0','0','0'),
(@GUID+10,'25913','530','1','1','0','0','3120.33','3709.94','144.328','5.38094','30','0','0','42','0','0','0','0','0');

-- warden event relation
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID AND @GUID+10;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@GUID),
(1,@GUID+1),
(1,@GUID+2),
(1,@GUID+3),
(1,@GUID+4),
(1,@GUID+5),
(1,@GUID+6),
(1,@GUID+7),
(1,@GUID+8),
(1,@GUID+9),
(1,@GUID+10);

######################
## flame keeper (H) ##
######################
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry`=11584 OR `entry` BETWEEN 11835 AND 11863;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=25884 OR `entry` BETWEEN 25918 AND 25923 OR `entry` BETWEEN 25925 AND 25947;

-- questrelations
DELETE FROM `creature_questrelation` WHERE `quest`=11584 OR `quest` BETWEEN 11835 AND 11863;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
## outland
(25926,11843), -- blades edge
(25937,11854), -- nagrand
(25938,11855), -- shadowmoon
(25947,11863), -- nagrand
(25934,11851), -- hellfire
(25918,11835), -- netherstorm
(25942,11858), -- terokkar
## kalimdor
(25884,11841), -- ashenvale
(25929,11846), -- durotar
(25928,11845), -- desolace
(25932,11849), -- feralas
(25943,11859), -- the barrens
(25940,11856), -- stonetalon mountains
(25936,11852), -- mulgore
(25930,11847), -- dustwallow marsh
(25919,11836), -- silithus
(25921,11838), -- tanaris
(25922,11839), -- winterspring
(25945,11861), -- thousand needles
## eastern kingdoms
(25925,11842), -- badlands
(25931,11848), -- eversong woods
(25935,11853), -- hillsbrad foothills
(25920,11837), -- stranglethorn vale
(25944,11860), -- hinterlands
(25923,11840), -- arathi highlands
(25927,11844), -- burning steppes
(25933,11850), -- ghostlands
(25939,11584), -- silverpine forest
(25941,11857), -- swamp of sorrows
(25946,11862); -- tirisfal glades

-- involvedrelations
DELETE FROM `creature_involvedrelation` WHERE `quest`=11584 OR `quest` BETWEEN 11835 AND 11863;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
## outland
(25926,11843), -- blades edge
(25937,11854), -- nagrand
(25938,11855), -- shadowmoon
(25947,11863), -- nagrand
(25934,11851), -- hellfire
(25918,11835), -- netherstorm
(25942,11858), -- terokkar
## kalimdor
(25884,11841), -- ashenvale
(25929,11846), -- durotar
(25928,11845), -- desolace
(25932,11849), -- feralas
(25943,11859), -- the barrens
(25940,11856), -- stonetalon mountains
(25936,11852), -- mulgore
(25930,11847), -- dustwallow marsh
(25919,11836), -- silithus
(25921,11838), -- tanaris
(25922,11839), -- winterspring
(25945,11861), -- thousand needles
## eastern kingdoms
(25925,11842), -- badlands
(25931,11848), -- eversong woods
(25935,11853), -- hillsbrad foothills
(25920,11837), -- stranglethorn vale
(25944,11860), -- hinterlands
(25923,11840), -- arathi highlands
(25927,11844), -- burning steppes
(25933,11850), -- ghostlands
(25939,11584), -- silverpine forest
(25941,11857), -- swamp of sorrows
(25946,11862); -- tirisfal glades

-- spawn missing keeper
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+11 AND @GUID+14;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID+11,'25918','530','1','1','0','0','2939.25','3707.13','143.35','2.41213','30','0','0','42','0','0','0','0','0'),
(@GUID+12,'25926','530','1','1','0','0','2299.3','6140.85','134.987','2.15454','30','0','0','42','0','0','0','0','0'),
(@GUID+13,'25936','1','1','1','0','0','-2325.35','-612.436','-8.94079','0.669778','30','0','0','42','0','0','0','0','0'),
(@GUID+14,'25938','530','1','1','0','0','-3079.78','2433.31','63.9935','0.138969','30','0','0','42','0','0','0','0','0');

-- keeper event relation
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID+11 AND @GUID+14;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(1,@GUID+11),
(1,@GUID+12),
(1,@GUID+13),
(1,@GUID+14);
