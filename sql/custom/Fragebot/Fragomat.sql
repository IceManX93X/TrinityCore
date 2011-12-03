-- NPC erstellen
-- INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES(700000,25865,1,1,1,23447,0,16290.1,16394.00,64.9873,4.69349,28800,0,0,11111,11111,0,0,1,4,0);
INSERT INTO creature_template (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES(700000, 0, 0, 0, 0, 0, 23447, 0, 0, 0, "Fragomat", "Ich beantworte (fast) jede Frage", "Directions", 55554, 111, 111, 0, 5, 5, 1, 1, 1, 0.4, 0, 111, 111, 0, 666, 1, 2000, 2000, 8, 2, 8, 0, 0, 0, 0, 0, 222, 222, 111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", 1, 4, 11111, 11111, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "", 12340);
INSERT INTO creature_template (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES(700001, 0, 0, 0, 0, 0, 15363, 0, 0, 0, "Fragomat", "Ich beantworte (fast) jede Frage", "Directions", 55554, 111, 111, 0, 5, 5, 1, 1, 1, 0.4, 0, 111, 111, 0, 666, 1, 2000, 2000, 8, 2, 8, 0, 0, 0, 0, 0, 222, 222, 111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", 1, 4, 11111, 11111, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "", 12340);

-- Schild
INSERT INTO gameobject_template (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`)
VALUES(300500, 5, 8143, "Hier wird dir geholfen", "", "", "", 0, 0, 0.68, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", "", 12340);
INSERT INTO gameobject_template (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`)
VALUES(300501, 5, 714, "Hier wird dir geholfen", "", "", "", 0, 0, 0.68, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", "", 12340);


-- NPC_text
INSERT INTO npc_text VALUES(55555, "Wie kann ich euch helfen?", "Wie kann ich euch helfen?", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55556, "Einen Bugreport ins Mantis schreiben - bugs.landoflegends.de (extra Account noetig)", "Einen Bugreport ins Mantis schreiben - bugs.landoflegends.de (extra Account noetig)", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55557, "Schreibe ' /reload ' in den Chat", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55558, "1. WoW schlie�en, LoL Starter �ffnen, Kreuz bei 'WDB Ordner l�schen' rein, 'WoW starten' anklicken. $B2. Auf die LoL HP gehen, Portal anklicken, Ruhestein benutzen. $B3. Gehe auf tiny.cc/geistheiler - Dann einfach zu n�chsten Geistheiler laufen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55559, "Ich suche eine Gilde -> /join Gildenrekrutierung $B Ich m�chte etwas verkaufen / kaufen! -> /join AH $B Smalltalk / Quest-Fragen etc. -> /join global $B Ich suche eine Gruppe (Instanz/Raid/Event etc) -> /join SucheNachGruppe $B Du hast Fragen an einen GM / Supporter? -> /join Support $B Musikw�nsche �bers Radio / Allg. Gespr�che �bers Radio f�hren. -> /join Radio", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55560, "WoW neustarten oder ' /leave channelname ' und dann wieder ' /join channelname '.", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55561, "Rechtsklick auf Chat-Reiter 'Allgemein', 'Einstellungen' anklicken, 'Anderes' anklicken, Haken bei 'Channel' entfernen (rechte Seite)", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55562, "Rechtsklick auf Chat-Reiter 'Allgemein', 'Interaktiv machen' anklicken", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55563, "Screenshot machen (Druck Taste), -> LoL-HP, Foren�bersicht, Team <-> Spieler -> Regelverst��e, 'Neues Thema erstellen'",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55564, "�berpr�ge das du in keinem Schlachtzug bist",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55565, "Eine andere Quest annehmen bzw Abbrechen/abgeben, dann sollte es wieder funktionieren",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55566, "Reloggen oder ein Makro mit dem Inhalt ' /script CombatLogClearEntries() ' anfertigen",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55567, "Makro mit den Inhalt ' /script LeaveParty() ' anfertigen",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO npc_text VALUES(55568, "In jeder Hauptstadt befinden sich Wachen die man ansprechen und entsprechen danach fragen kann",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);

-- gossip_menu
INSERT INTO gossip_menu (`entry`, `text_id`) VALUES(55555, 55554),

-- gossip_menu_option
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55555, 55555, 7, "Buggy Quest? Was kann ich tun?", 1, 1, 55555, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55555, 1, 0, "Buggy Quest? Was kann ich tun?", 1, 1, 55556, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55556, 2, 0, "Einen Bugreport ins Mantis schreiben - bugs.landoflegends.de (extra Account n�tig", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55557, 2, 0, "Wie kann ich sehen ob ein GM online ist?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55558, 1, 0, "Gib in den Chat .gm i ein dann siehst du eine Liste der eingeloggten GM", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55559, 3, 0, "Mir wird in der Gruppe jemand als unbekannt angezeigt. Was tun?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55560, 1, 0, "Gib /reload in den Chat ein. Muss man manchmal auch mehrmals machen", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55561, 4, 0, "Ich bin tot aber kein Geisterheiler in der N�he", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55562, 1, 0, "1. LoL Starter �ffnen, Haken bei WDB Ordner l�schen rein, WoW neustarten. $N 2. Auf die LoL HP gehn, Portal, Ruhestein $B 3. gehe auf tiny.cc/geistheiler und lauf zum n�chsten Geistheiler", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55563, 5, 0, "LoL Channel - Welcher ist wof�r da?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55564, 1, 0, "/join Gildenrekrutierung - Gildensuche $B /join ah - K�ufe bzw Verk�ufe $B /join global - Smalltalk und Questfragen $B /join SucheNachGruppe - Gruppensuche f�r Instanzen bzw Quests $B /join Support - Wenn du Fragen Gm bzw Supporter hast $B /join Radio - Alles rund ums LoL Radio", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55565, 6, 0, "Du kannst nicht lesen was du schreibst?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55566, 1, 0, "/reload in den Chat eingeben oder WoW komplett neutstarten", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55567, 7, 0, "Du kannst nicht lesen was andere schreiben?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55568, 1, 0, "/leave Channelname und dann wieder /join Channelname", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55569, 8, 0, "Channel betreten / Channel verlassen Anzeige deaktivieren", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55570, 1, 0, "Rechtsklick auf den Chat-Reiter Allgemein/auf Einstellungen klicken/Anderes anklicken/Haken bei Channel raus", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55571, 9, 0, "Questtexte / Items / Berufe nicht anklickbar?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55572, 1, 0, "Rechtsklick auf den Chat-Reiter Allgemein/auf interaktiv machen klicken", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55573, 10, 0, "Du hast eine Regelwidrigkeit entdeckt oder wurdest beleidigt?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55574, 1, 0, "Screen/LoL-HP/Foren�bersicht/Team-Spieler-Regelverst��e/Neues Thema und posten", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55575, 11, 0, "Du kannst keine Quests erledigen / Questitems einsammeln?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55576, 1, 0, "�berpr�fe das du in keinem Schlachtzug bist", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55577, 12, 0, "Ich sehe auf der Karte die Quests nicht mehr", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55578, 1, 0, "Eine andere Quest annehmen bzw eine abgeben, dann sollte es wieder funktionieren.", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55579, 13, 0, "Du hast das AddOn RECOUNT installiert aber es regt sich nix?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55580, 1, 0, "relogen oder /script CombatLogClearEntries() in ein Makro schreiben", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55581, 14, 0, "Wenn man angeblich in einer Gruppe ist, aber die Gruppe schon verlassen.", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55582, 1, 0, "/script LeaveParty() in den Chat eingeben", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55583, 15, 0, "Wo finde ich einen Lehrer f�r meine Klasse bzw. f�r meine Berufe?", 1, 1, 0, 0, 0, 0, 0, "");
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55584, 1, 0, "In jeder Hauptstadt befinden sich Wachen, die man ansprechen kann", 1, 1, 0, 0, 0, 0, 0, "");

-- DELETEN

DELETE FROM gossip_menu_option WHERE menu_id IN(55554, 55555, 55556, 55557, 55558, 55559, 55560, 55561, 55562, 55563, 55564, 55565, 55566, 55567, 55568, 55569, 55570, 55571, 55572, 55573, 55574, 55575, 55576, 55577, 55578, 55579, 55580, 55581, 55582, 55583, 55584);



