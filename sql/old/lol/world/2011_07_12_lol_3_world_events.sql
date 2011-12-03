SET @GO_GUID := 400030;

-- unify money reward
UPDATE `quest_template` SET `RewOrReqMoney`=74000, `RewMoneyMaxLevel`=132300 WHERE `entry` IN (11750,11775,11801);

#################################
## Desecration of the Alliance ##
#################################
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (11581,11732) OR `entry` BETWEEN 11734 AND 11763;
UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry` IN (187564,187914,187916,187917) OR `entry` BETWEEN 187919 AND 187946;

-- questrelations
DELETE FROM `gameobject_questrelation` WHERE `quest` IN (11581,11732) OR `quest` BETWEEN 11734 AND 11763;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
## outland
(187919,11736), -- blades edge
(187933,11750), -- nagrand
(187935,11752), -- shadowmoon
(187941,11758), -- nagrand
(187930,11747), -- hellfire
(187942,11759), -- netherstorm
(187937,11754), -- terokkar
## kalimdor
(187916,11734), -- ashenvale
(187921,11738), -- bloodmyst
(187924,11741), -- desolace
(187929,11746), -- feralas
(187936,11753), -- teldrassil
(187917,11735), -- azuremyst
(187923,11740), -- darkshore
(187927,11744), -- dustwallow marsh
(187943,11760), -- silithus
(187945,11762), -- tanaris
(187946,11763), -- winterspring
## eastern kingdoms
(187914,11732), -- arathi highlands
(187922,11739), -- burning steppes
(187926,11743), -- duskwood
(187931,11748), -- hillsbrad foothills
(187934,11751), -- redridge mountains
(187938,11755), -- hinterlands
(187939,11756), -- western plaguelands
(187920,11737), -- blasted lands
(187925,11742), -- dun morogh
(187928,11745), -- elwynn forest
(187932,11749), -- loch modan
(187944,11761), -- stranglethorn vale
(187940,11757), -- wetlands
(187564,11581); -- westfall

-- involvedrelations
DELETE FROM `gameobject_involvedrelation` WHERE `quest` IN (11581,11732) OR `quest` BETWEEN 11734 AND 11763;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
## outland
(187919,11736), -- blades edge
(187933,11750), -- nagrand
(187935,11752), -- shadowmoon
(187941,11758), -- nagrand
(187930,11747), -- hellfire
(187942,11759), -- netherstorm
(187937,11754), -- terokkar
## kalimdor
(187916,11734), -- ashenvale
(187921,11738), -- bloodmyst
(187924,11741), -- desolace
(187929,11746), -- feralas
(187936,11753), -- teldrassil
(187917,11735), -- azuremyst
(187923,11740), -- darkshore
(187927,11744), -- dustwallow marsh
(187943,11760), -- silithus
(187945,11762), -- tanaris
(187946,11763), -- winterspring
## eastern kingdoms
(187914,11732), -- arathi highlands
(187922,11739), -- burning steppes
(187926,11743), -- duskwood
(187931,11748), -- hillsbrad foothills
(187934,11751), -- redridge mountains
(187938,11755), -- hinterlands
(187939,11756), -- western plaguelands
(187920,11737), -- blasted lands
(187925,11742), -- dun morogh
(187928,11745), -- elwynn forest
(187932,11749), -- loch modan
(187944,11761), -- stranglethorn vale
(187940,11757), -- wetlands
(187564,11581); -- westfall

-- spawn missing bonfires
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+10;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID,'187917','530','1','1','-4198.8','-12342.4','1.06331','3.02457','0','0','0.998289','0.0584759','300','0','1'),
(@GO_GUID+1,'187919','530','1','1','2018.58','6595.76','135.845','0.275927','0','0','0.137526','0.990498','300','0','1'),
(@GO_GUID+2,'187921','530','1','1','-2175.9','-11893.9','31.9622','2.47871','0','0','0.945575','0.325405','300','0','1'),
(@GO_GUID+3,'187922','0','1','1','-8242.57','-2614.57','133.156','1.50279','0','0','0.682657','0.730739','300','0','1'),
(@GO_GUID+4,'187929','1','1','1','-4388.91','3472.16','9.49197','5.45912','0','0','0.400472','-0.916309','300','0','1'),
(@GO_GUID+5,'187933','530','1','1','-2479.67','7545.61','-2.24268','2.5887','0','0','0.962032','0.272938','300','0','1'),
(@GO_GUID+6,'187935','530','1','1','-3891.67','2024.15','95.4382','2.44804','0','0','0.940473','0.339868','300','0','1'),
(@GO_GUID+7,'187937','530','1','1','-2992.52','4154.9','5.83402','2.25743','0','0','0.903863','0.427822','300','0','1'),
(@GO_GUID+8,'187939','0','1','1','995.013','-1447.26','62.0325','5.03694','0','0','0.583575','-0.812059','300','0','1'),
(@GO_GUID+9,'187941','530','1','1','187.533','6029.76','21.9231','0.934652','0','0','0.450501','0.892776','300','0','1'),
(@GO_GUID+10,'187942','530','1','1','3113.01','3706.52','144.327','5.96213','0','0','0.159837','-0.987143','300','0','1');

-- bonfire event relation
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID AND @GO_GUID+10;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID),
(1,@GO_GUID+1),
(1,@GO_GUID+2),
(1,@GO_GUID+3),
(1,@GO_GUID+4),
(1,@GO_GUID+5),
(1,@GO_GUID+6),
(1,@GO_GUID+7),
(1,@GO_GUID+8),
(1,@GO_GUID+9),
(1,@GO_GUID+10);

##############################
## Desecration of the Horde ##
##############################
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry`=11580 OR `entry` BETWEEN 11764 AND 11787 OR `entry` BETWEEN 11799 AND 11803;
UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=187559 OR `entry` BETWEEN 187947 AND 187975;

-- questrelations
DELETE FROM `gameobject_questrelation` WHERE `quest`=11580 OR `quest` BETWEEN 11764 AND 11787 OR `quest` BETWEEN 11799 AND 11803;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
## outland
(187955,11767), -- blades edge
(187966,11778), -- nagrand
(187967,11779), -- shadowmoon
(187975,11787), -- zangarmarsh
(187963,11775), -- hellfire
(187949,11799), -- netherstorm
(187970,11782), -- terokkar
## kalimdor
(187948,11765), -- ashenvale
(187958,11770), -- durotar
(187957,11769), -- desolace
(187961,11773), -- feralas
(187971,11783), -- the barrens
(187968,11780), -- stonetalon mountains
(187965,11777), -- mulgore
(187959,11771), -- dustwallow marsh
(187950,11800), -- silithus
(187952,11802), -- tanaris
(187953,11803), -- winterspring
(187973,11785), -- thousand needles
## eastern kingdoms
(187954,11766), -- badlands
(187960,11772), -- eversong woods
(187964,11776), -- hillsbrad foothills
(187951,11801), -- stranglethorn vale
(187972,11784), -- hinterlands
(187947,11764), -- arathi highlands
(187956,11768), -- burning steppes
(187962,11774), -- ghostlands
(187559,11580), -- silverpine forest
(187969,11781), -- swamp of sorrows
(187974,11786); -- tirisfal glades

-- involvedrelations
DELETE FROM `gameobject_involvedrelation` WHERE `quest`=11580 OR `quest` BETWEEN 11764 AND 11787 OR `quest` BETWEEN 11799 AND 11803;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
## outland
(187955,11767), -- blades edge
(187966,11778), -- nagrand
(187967,11779), -- shadowmoon
(187975,11787), -- zangarmarsh
(187963,11775), -- hellfire
(187949,11799), -- netherstorm
(187970,11782), -- terokkar
## kalimdor
(187948,11765), -- ashenvale
(187958,11770), -- durotar
(187957,11769), -- desolace
(187961,11773), -- feralas
(187971,11783), -- the barrens
(187968,11780), -- stonetalon mountains
(187965,11777), -- mulgore
(187959,11771), -- dustwallow marsh
(187950,11800), -- silithus
(187952,11802), -- tanaris
(187953,11803), -- winterspring
(187973,11785), -- thousand needles
## eastern kingdoms
(187954,11766), -- badlands
(187960,11772), -- eversong woods
(187964,11776), -- hillsbrad foothills
(187951,11801), -- stranglethorn vale
(187972,11784), -- hinterlands
(187947,11764), -- arathi highlands
(187956,11768), -- burning steppes
(187962,11774), -- ghostlands
(187559,11580), -- silverpine forest
(187969,11781), -- swamp of sorrows
(187974,11786); -- tirisfal glades

-- spawn missing bonfires
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID+11 AND @GO_GUID+14;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_GUID+11,'187949','530','1','1','2934.58','3702.37','143.256','2.53231','0','0','0.953954','0.299953','300','0','1'),
(@GO_GUID+12,'187955','530','1','1','2293.19','6130.84','135.623','2.1334','0','0','0.875611','0.483017','300','0','1'),
(@GO_GUID+13,'187965','1','1','1','-2333.04','-621.359','-7.8616','6.19349','0','0','0.0448345','-0.998994','300','0','1'),
(@GO_GUID+14,'187967','530','1','1','-3088.93','2433.26','62.9845','5.67602','0','0','0.298941','-0.954272','300','0','1');

-- bonfire event relation
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @GO_GUID+11 AND @GO_GUID+14;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1,@GO_GUID+11),
(1,@GO_GUID+12),
(1,@GO_GUID+13),
(1,@GO_GUID+14);
