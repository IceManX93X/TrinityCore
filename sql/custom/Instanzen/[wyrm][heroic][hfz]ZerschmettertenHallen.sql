-- id 
update creature_template set `flags_extra` = `flags_extra`|'1' where entry in 
(20568,20923,20923,20597);

REPLACE INTO `creature_template`
(`entry`,`heroic_entry`,`modelid_A`,`modelid_A2`,`modelid_H`,`modelid_H2`,`name`,`subname`,`IconName`,`minlevel`,`maxlevel`,`minhealth`,`maxhealth`,`minmana`,`maxmana`,`armor`,`faction_A`,`faction_H`,`npcflag`,`speed`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`baseattacktime`,`rangeattacktime`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`class`,`race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`PetSpellDataId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`RacialLeader`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`)
VALUES
(20588,0,17184,0,17184,0,'Shattered Hand Houndmaster (1)','','',70,70,27315,27315,0,0,6792,14,14,0,1.2,1,1,1875,2259,0,14465,1420,1667,0,0,0,0,0,0,0,3941,4325,0,7,0,17670,17670,0,0,0,0,0,0,0,40248,22907,35950,0,0,2018,2644,'',0,3,0,1,0,270602433,0,''),
(20594,0,16578,0,16578,0,'Shattered Hand Sharpshooter (1)','','',70,70,19607,19607,0,0,6642,14,14,0,1.2,1,1,1871,2270,0,14495,1420,1667,0,0,0,0,0,0,0,1871,2270,14495,7,0,16704,16704,0,0,0,0,0,0,0,35945,22907,37551,0,0,1928,2528,'',0,3,0,1,0,1,0,''),
(20593,0,19277,0,19277,0,'Shattered Hand Sentry (1)','','',70,70,27350,27350,0,0,6492,14,14,0,1.2,1,1,1948,2500,0,15568,0,0,0,0,0,0,0,0,0,0,0,0,7,0,16507,16507,0,0,0,0,0,0,0,37511,31553,0,0,0,2608,3416,'',0,3,0,1,0,1,0,''),
(20592,0,17727,0,17727,0,'Shattered Hand Scout (1)','','',70,70,14147,14147,0,0,6492,14,14,0,1.2,1,0,1221,1827,0,10668,0,0,0,0,0,0,0,0,0,0,0,0,7,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20586,0,17183,0,17183,0,'Shattered Hand Gladiator (1)','','',70,70,27350,27350,0,0,6792,14,14,0,1.2,1,1,1970,2523,0,15724,0,0,0,0,0,0,0,0,0,0,0,0,7,0,17464,17464,0,0,0,0,0,0,0,16856,0,0,0,0,1848,2422,'',0,3,0,1,0,270602433,0,''),
(20585,0,16969,0,16969,0,'Shattered Hand Executioner (1)','','',70,70,27350,27350,0,0,7089,14,14,0,1.2,1,1,2188,2759,0,17313,0,0,0,0,0,0,0,0,0,0,0,0,7,0,20585,0,0,0,0,0,0,0,0,11876,15284,0,0,0,2018,7982,'',0,3,0,1,0,369082335,2,''),
(20584,0,17186,0,17186,0,'Shattered Hand Champion (1)','','',71,71,36781,36781,0,0,7089,14,14,0,1.2,1,1,2112,2712,0,16880,0,0,0,0,0,0,0,0,0,0,0,0,7,0,17671,17671,0,0,0,0,0,0,0,32588,32587,11972,0,0,2616,3426,'',0,3,0,1,0,270602433,0,''),
(20583,0,17185,0,17185,0,'Shattered Hand Centurion (1)','','',71,71,36781,36781,0,0,7089,14,14,0,1.2,1,1,1897,2597,0,15725,1420,0,0,0,0,0,0,0,0,0,0,0,7,0,17465,17465,0,0,0,0,0,0,0,31403,16145,0,0,0,2616,3426,'',0,3,0,1,0,270602433,0,''),
(20582,0,16577,0,16577,0,'Shattered Hand Brawler (1)','','',70,70,5000,5000,0,0,6792,14,14,0,1.2,1,1,1770,2179,0,13823,1420,0,0,0,0,0,0,0,0,0,0,0,7,0,16593,16593,0,0,0,0,0,0,0,3391,36033,36020,0,0,2018,2644,'',0,3,0,1,0,1,0,''),
(20597,0,19799,0,19799,0,'Warchief Kargath Bladefist (1)','','',72,72,206640,206640,0,0,7387,14,14,0,1.2,1,1,2464,3034,0,19243,0,0,0,0,0,0,0,0,0,0,0,0,7,0,20597,0,0,0,0,0,0,0,0,25821,0,0,0,0,13838,18082,'',0,3,0,1,0,536854527,1,''),
(20596,0,18031,0,18031,0,"Warbringer O'mrogg (1)",'','',72,72,206732,206732,0,0,7387,14,14,0,1.2,1,1,2255,2802,0,17701,0,0,0,0,0,0,0,0,0,0,0,0,7,64,20596,0,0,0,0,0,0,0,0,0,0,0,0,0,12988,16972,'',0,3,0,1,1806,536854527,1,''),
(20595,0,17726,0,17726,0,'Shattered Hand Zealot (1)','','',70,70,9431,9431,0,0,6492,14,14,0,1.2,1,0,1430,2000,0,12001,1420,0,0,0,0,0,0,0,0,0,0,0,7,32,17462,17462,0,0,0,0,0,0,0,30989,0,0,0,0,404,538,'',0,3,0,1,0,0,0,''),
(20589,0,19275,0,19275,0,'Shattered Hand Legionnaire (1)','','',70,70,52395,52395,0,0,6792,14,14,0,1.2,1,1,2250,2835,0,17796,1420,0,0,0,0,0,0,0,0,0,0,0,7,0,16700,16700,0,0,0,0,0,0,0,15615,30472,30485,0,0,2528,3310,'',0,3,0,1,0,270602433,0,''),
(20581,0,17725,0,17725,0,'Shattered Hand Blood Guard (1)','','',71,71,28006,28006,0,0,7089,14,14,0,1.2,1,1,1952,2659,0,16137,1420,0,0,0,0,0,0,0,0,0,0,0,7,32,17461,17461,0,0,0,0,0,0,0,0,0,0,0,0,2616,3426,'',0,3,0,1,0,1,0,''),
(20580,0,17190,0,17190,0,'Shattered Hand Assassin (1)','','',70,71,27350,27350,0,0,5580,14,14,0,1.2,1,1,1571,2210,0,13235,1420,0,0,0,0,0,0,0,0,0,0,0,7,0,17695,17695,0,0,0,0,0,0,0,30980,30992,0,0,0,2018,2644,'',0,3,0,1,0,0,0,''),
(20579,0,16578,0,16578,0,'Shattered Hand Archer (1)','','',70,70,20283,20283,0,0,6492,14,14,0,1.2,1,1,1279,1743,0,10573,1420,1667,0,0,0,0,0,0,0,1257,1809,10727,7,32,17427,17427,0,0,0,0,0,0,0,30990,22907,0,0,0,1928,2528,'',0,3,0,1,0,270602433,0,''),
(20578,0,16578,0,16578,0,'Sharpshooter Guard (1)','','',70,70,11789,11789,0,0,6492,14,14,0,1.2,1,0,863,1642,0,8766,1400,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,35942,22907,37551,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20577,0,17189,0,17189,0,'Shadowmoon Darkcaster (1)','','',70,70,19144,19144,35980,35980,3427,14,14,0,1.2,1,1,1252,2071,0,11629,0,0,0,0,0,0,0,0,0,0,0,0,7,0,17694,17694,0,0,0,0,0,0,0,12542,33508,15232,0,0,1422,1866,'',0,3,0,1,0,0,0,''),
(20576,0,16581,0,16581,0,'Shadowmoon Acolyte (1)','','',70,70,19144,19144,35980,35980,3427,14,14,0,1.2,1,1,1306,1873,0,11125,0,0,0,0,0,0,0,0,0,0,0,0,7,0,16594,16594,0,0,0,0,0,0,0,31516,35943,36052,30479,0,1422,1866,'',0,3,0,1,0,0,0,''),
(20575,0,16580,0,16580,0,'Reaver Guard (1)','','',70,70,11789,11789,0,0,0,14,14,0,1.2,1,0,748,1547,0,8031,1400,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,15496,30485,30471,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20569,0,17013,0,17013,0,'Heathen Guard (1)','','',70,70,11789,11789,0,0,6492,14,14,0,1.2,1,0,557,1077,0,5715,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,30474,30485,0,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20566,0,10029,0,10029,0,'Creeping Oozeling (1)','','',70,70,4716,4716,0,0,6492,14,14,0,1.2,1,0,190,566,0,2642,1420,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20565,0,358,0,358,0,'Creeping Ooze (1)','','',70,70,27350,27350,0,0,6492,14,14,0,1.2,1,1,1304,1875,0,11128,0,0,0,0,0,0,0,0,0,0,0,0,10,0,17356,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20591,0,16584,0,16584,0,'Shattered Hand Savage (1)','','',70,70,27350,27350,0,0,6492,14,14,0,1.2,1,1,1860,2397,0,14901,0,0,0,0,0,0,0,0,0,0,0,0,7,0,16523,16523,0,0,0,0,0,0,0,36054,30470,30485,0,0,2524,3306,'',0,3,0,1,0,1,0,''),
(20590,0,16580,0,16580,0,'Shattered Hand Reaver (1)','','',70,70,27350,27350,0,0,6642,14,14,0,1.2,1,1,1927,2573,0,15746,0,0,0,0,0,0,0,0,0,0,0,0,7,0,16699,16699,0,0,0,0,0,0,0,15496,30485,30471,0,0,2014,2640,'',0,3,0,1,0,1,0,''),
(20587,0,17013,0,17013,0,'Shattered Hand Heathen (1)','',NULL,70,70,27350,27350,0,0,6492,14,14,0,1.2,1,1,1915,2244,0,14558,2000,0,0,0,0,0,0,0,0,0,0,0,7,0,17420,17420,0,0,0,0,0,0,0,35949,30485,0,0,0,2524,3306,'',0,3,0,1,0,1,0,''),
(20574,0,14334,0,14334,0,'Rabid Warhound (1)','',NULL,70,70,12226,12226,0,0,5892,14,14,0,1.2,1,1,1482,1890,0,11802,0,0,0,0,1,0,0,0,0,0,0,0,1,0,17669,0,70062,0,0,0,0,0,0,30636,30639,0,0,0,0,0,'',0,3,0,1,0,0,0,''),
(20568,0,16628,0,16628,0,'Grand Warlock Nethekurse (1)','',NULL,71,71,149420,149420,62044,62044,5714,14,14,0,1.2,1,1,1755,2565,0,15116,0,0,0,0,0,0,0,0,0,0,0,0,7,32,20568,0,0,0,0,0,0,5,0,0,0,0,0,0,12986,16968,'',0,3,0,1,0,536854527,1,''),
(20567,0,16839,0,16839,0,'Fel Orc Convert (1)','',NULL,70,70,13972,13972,0,0,6792,14,14,0,1.2,1,0,400,819,0,4265,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,30478,0,0,0,0,706,932,'',0,3,0,1,0,0,0,'');


-- Scripts 
update eventai_scripts set `event_flags` = `event_flags`|'4' where creature_id in (select distinct id from creature where map = 540) or creature_id in (17621,17623);
-- Porung 
update creature set spawnMask = 1 where id = 17461;
insert into `creature` 
(`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) 
values
('540000','20923','540','2','0','0','513.24','315.927','1.93557','3.1429','72000','0','0','139482','0','0','0');

-- T�r
DELETE FROM `gameobject` Where guid = 540000;

insert into gameobject 
(guid,id,map,spawnMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state)
values(540000,182539,540,3,142.516,266.37,-11.600,3.15959,0, 0, 0.99996, -0.00899712,25, 0, 1);

update gameobject_template set flags = 2 where entry = 182539;

-- Henker
insert into `creature` 
(`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) 
values
('1013582','17301','540','2','0','0','169.143','-84.9309','1.90807','3.05205','86400','0','0','19607','0','0','0');
