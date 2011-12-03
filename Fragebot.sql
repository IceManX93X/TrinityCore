DELETE FROM `creature_template` WHERE `entry` = 700000;
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN(55554, 55555, 55556, 55557, 55558, 55559, 55560, 55561, 55562, 55563, 55564, 55565, 55566, 55567, 55568, 55569, 55570, 55571, 55572, 55573, 55574, 55575, 55576, 55577, 55578, 55579);
DELETE FROM `gossip_menu` WHERE `entry` IN(55554, 55555, 55556, 55557, 55558, 55559, 55560, 55561, 55562, 55563, 55564, 55565, 55566, 55567, 55568, 55569, 55570, 55571, 55572, 55573, 55574, 55575, 55576, 55577, 55578, 55579);
DELETE FROM `npc_text` WHERE `ID` IN(55554, 55555, 55560, 55561, 55562, 55563, 55564, 55565, 55566, 55567, 55568, 55569, 55570, 55571, 55572, 55573, 55574, 55575, 55576, 55577, 55578, 55579);
DELETE FROM `creature` WHERE `guid` IN(500000, 500001, 500002, 500003, 500004, 500005, 500006, 500007);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(55579, 700000);
DELETE FROM `gossip_scripts` WHERE `id` IN(55579);

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) 
VALUES(700000, 0, 0, 0, 0, 0, 22669, 0, 0, 0, "Fragomat", "Ich beantworte (fast) jede Frage", "Directions", 55554, 111, 111, 0, 35, 35, 1, 1, 1, 0.9, 0, 111, 111, 0, 666, 1, 2000, 2000, 8, 2, 8, 0, 0, 0, 0, 0, 222, 222, 111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", 1, 4, 11111, 11111, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "", 12340);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) 
VALUES(55554, 1, 0, "Allgemeine Informationen zum Server", 1, 1, 55555, 0, 0, 0, ""),
(55555, 1, 0, "Ist der Server Blizzlike?", 1, 1, 55560, 0, 0, 0, ""),
(55560, 0, 0, "Zur letzten Seite", 1, 1, 55555, 0, 0, 0, ""),
(55560, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55555, 2, 0, "Wann ist immer Serverupdate?", 1, 1, 55561, 0, 0, 0, ""),
(55561, 0, 0, "Zur letzten Seite", 1, 1, 55555, 0, 0, 0, ""),
(55561, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55555, 3, 0, "Wie lange ist immer Serverupdate?", 1, 1, 55562, 0, 0, 0, ""),
(55562, 0, 0, "Zur letzten Seite", 1, 1, 55555, 0, 0, 0, ""),
(55562, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55555, 4, 0, 'Zurück', 1, 1, 55554, 0, 0, 0, ""), 

(55554, 2, 0, "Questfragen", 1, 1, 55556, 0, 0, 0, ""),
(55556, 2, 0, "Buggy Quest? Was kann ich tun?", 1, 1, 55563, 0, 0, 0, ""),
(55563, 0, 0, "Zur letzten Seite", 1, 1, 55556, 0, 0, 0, ""),
(55563, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55556, 3, 0, "Questtexte / Items / Berufe nicht anklickbar?", 1, 1, 55564, 0, 0, 0, ""),
(55564, 0, 0, "Zur letzten Seite", 1, 1, 55556, 0, 0, 0, ""),
(55564, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55556, 4, 0, "Du kannst keine Quests erledigen / Questitems einsammeln?", 1, 1, 55565, 0, 0, 0, ""),
(55565, 0, 0, "Zur letzten Seite", 1, 1, 55556, 0, 0, 0, ""),
(55565, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55556, 5, 0, "Ich sehe auf der Karte die Quests nicht mehr", 1, 1, 55566, 0, 0, 0, ""),
(55566, 0, 0, "Zur letzten Seite", 1, 1, 55556, 0, 0, 0, ""),
(55566, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55556, 6, 0, 'Zurück', 1, 1, 55554, 0, 0, 0, ""),

(55554, 3, 0, "Channelfragen", 1, 1, 55557, 0, 0, 0, ""),
(55557, 1, 0, 'LoL Channel - Welcher ist wofuer da?', 1, 1, 55567, 0, 0, 0, ""),
(55567, 0, 0, "Zur letzten Seite", 1, 1, 55557, 0, 0, 0, ""),
(55567, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55557, 2, 0, "Channel betreten / Channel verlassen Anzeige deaktivieren", 1, 1, 55568, 0, 0, 0, ""),
(55568, 0, 0, "Zur letzten Seite", 1, 1, 55557, 0, 0, 0, ""),
(55568, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55557, 3, 0, 'Zurueck', 1, 1, 55554, 0, 0, 0, ""),

(55554, 4, 0, "InGame Befehle", 1, 1, 55558, 0, 0, 0, ""),
(55558, 1, 0, "Mir wird in der Gruppe jemand als unbekannt angezeigt. Was tun?", 1, 1, 55569, 0, 0, 0, ""),
(55569, 0, 0, "Zur letzten Seite", 1, 1, 55558, 0, 0, 0, ""),
(55569, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55558, 2, 0, "Du kannst nicht lesen was du schreibst?", 1, 1, 55570, 0, 0, 0, ""),
(55570, 0, 0, "Zur letzten Seite", 1, 1, 55558, 0, 0, 0, ""),
(55570, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55558, 3, 0, "Du kannst nicht lesen was andere schreiben?", 1, 1, 55571, 0, 0, 0, ""),
(55571, 0, 0, "Zur letzten Seite", 1, 1, 55558, 0, 0, 0, ""),
(55571, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55558, 4, 0, "Du hast das AddOn RECOUNT installiert aber es regt sich nix?", 1, 1, 55572, 0, 0, 0, ""),
(55572, 0, 0, "Zur letzten Seite", 1, 1, 55558, 0, 0, 0, ""),
(55572, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55558, 5, 0, "Wie kann ich sehen ob ein GM online ist?", 1, 1, 55573, 0, 0, 0, ""),
(55573, 0, 0, "Zur letzten Seite", 1, 1, 55558, 0, 0, 0, ""),
(55573, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55558, 6, 0, "Wenn man angeblich in einer Gruppe ist, aber die Gruppe schon verlassen hat.", 1, 1, 55574, 0, 0, 0, ""),
(55574, 0, 0, "Zur letzten Seite", 1, 1, 55558, 0, 0, 0, ""),
(55574, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55558, 7, 0, 'Zurück', 1, 1, 55554, 0, 0, 0, ""),

(55554, 5, 0, "Sonstiges", 1, 1, 55559, 0, 0, 0, ""),
(55559, 1, 0, 'Ich bin tot aber kein Geisterheiler in der Nähe', 1, 1, 55575, 0, 0, 0, ""),
(55575, 0, 0, "Zur letzten Seite", 1, 1, 55559, 0, 0, 0, ""),
(55575, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55559, 2, 0, "Du hast eine Regelwidrigkeit entdeckt oder wurdest beleidigt?", 1, 1, 55576, 0, 0, 0, ""),
(55576, 0, 0, "Zur letzten Seite", 1, 1, 55559, 0, 0, 0, ""),
(55576, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55559, 3, 0, "Woher bekomme ich AddOns?", 1, 1, 55577, 0, 0, 0, ""),
(55577, 0, 0, "Zur letzten Seite", 1, 1, 55559, 0, 0, 0, ""),
(55577, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55559, 4, 0, 'Hast du Verbesserungsvorschläge?', 1, 1, 55578, 0, 0, 0, ""),
(55578, 0, 0, "Zur letzten Seite", 1, 1, 55559, 0, 0, 0, ""),
(55578, 1, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55559, 5, 0, 'Wo finde ich Waffenmeister für meine Klasse?', 1, 1, 55579, 0, 0, 0, ""),
(55579, 0, 0, "Bring mich nach Orgrimmar!", 1, 1, 0, 0, 55579, 0, ""),
(55579, 1, 0, "Zur letzten Seite", 1, 1, 55559, 0, 0, 0, ""),
(55579, 2, 0, "Zur Startseite", 1, 1, 55554, 0, 0, 0, ""),
(55559, 6, 0, 'Zurück', 1, 1, 55554, 0, 0, 0, "");

INSERT INTO `gossip_menu` (`entry`, `text_id`)
VALUES(55554, 55554),
(55555, 55555),
(55556, 55555),
(55557, 55555),
(55558, 55555),
(55559, 55555),
(55560, 55560),
(55561, 55561),
(55562, 55562),
(55563, 55563),
(55564, 55564),
(55565, 55565),
(55566, 55566),
(55567, 55567),
(55568, 55568),
(55569, 55569),
(55570, 55570),
(55571, 55571),
(55572, 55572),
(55573, 55573),
(55574, 55574),
(55575, 55575), 
(55576, 55576),
(55577, 55577),
(55578, 55578),
(55579, 55579);

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`)
VALUES(55554, "Wie kann ich euch helfen?", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55555, "Klicke auf eine Frage um die Antwort zu sehen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55560, "Ja aber die EP-Rate ist leicht angehoben um Buggy Quests auszugleichen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55561, "Serverupdate ist immer Samstag Vormittag bzw Mittag", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55562, "Je nach Menge der Neuerungen kann es manchmal bis zu 2-3 Stunden dauern.$BIn den meisten Fällen geht es aber wesentlich schneller", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),

(55563, "Einen Bugreport ins Mantis schreiben - bugs.landoflegends.de (extra Account noetig)", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55564, "Rechtsklick auf Chat-Reiter 'Allgemein', 'Interaktiv machen' anklicken", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55565, "Ueberpruefe das du in keinem Schlachtzug bist",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55566, "Eine andere Quest annehmen bzw Abbrechen/abgeben, dann sollte es wieder funktionieren",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),

(55567, "Ich suche eine Gilde - /join Gildenrekrutierung $B$B Ich moechte etwas verkaufen / kaufen! - /join AH $B$B Smalltalk / Quest-Fragen etc. - /join global $B$B  Ich suche eine Gruppe (Instanz/Raid/Event etc) - /join SucheNachGruppe $B$B Du hast Fragen an einen GM / Supporter? - /join Support $B$B Musikwuensche uebers Radio / Allg. Gespraeche uebers Radio fuehren. - /join Radio",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55568, "Rechtsklick auf Chat-Reiter 'Allgemein', 'Einstellungen' anklicken, 'Anderes' anklicken, Haken bei 'Channel' entfernen (rechte Seite)", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),

(55569, "Schreibe ' /reload ' in den Chat und mit Enter bestaetigen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55570, "Schreibe ' /reload ' in den Chat und mit Enter bestaetigen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55571, "Schreibe ' /reload ' in den Chat und mit Enter bestaetigen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55572, "Reloggen oder  ' /script CombatLogClearEntries() ' in den Chat eingeben und mit Enter bestaetigen",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55573, ".gm i in den Chat eingeben und es wird der eine Liste der momentan eingeloggten GM angezeigt",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55574, "/script LeaveParty(); in den Chat eingeben und mit Enter bestaetigen",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),

(55575, "1. WoW schliessen, LoL Starter oeffnen, Kreuz bei 'WDB Ordner loeschen' rein, 'WoW starten' anklicken. $B$B2. Auf die LoL HP gehen, Portal anklicken, Ruhestein benutzen. $B$B3. Gehe auf tiny.cc/geistheiler - Dann einfach zu naechsten Geistheiler laufen", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55576, "Screenshot machen (Druck Taste), - LoL-HP, Forenuebersicht, Team - Spieler - Regelverstoeße, 'Neues Thema erstellen'",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55577, "Bei wowinterface.com, curseforge.com oder teilweise auch curse.com findet ihr zahlreiche AddOns.$BAchtet hierbei auf die richtige Version - maximal 3.3.5a",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55578, "Zum Fragebot: Eine PN an FlavaSava oder Zhora schreiben $B Zum Server: Auf der LoL HP gibt es das Unterforum 'Verbesserungsvorschlaege', Dort den Vorschlag posten",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340),
(55579, "blablubb",  "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);

INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) 
VALUES(55579, 0, 6, 1, 0, 0, 1629.359985, -4373.390137, 31.256399 , 3.548390);



INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES(500000, 700000, 530, 1, 1, 0, 0, 3970.298828, '-13924.089844', 100.189575, 2.409580, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500001, 700000, 0, 1, 1, 0, 0, '-6230.345703', 319.271179, 383.117218, 1.570506, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500002, 700000, 1, 1, 1, 0, 0, 10326.400391, 835.421997, 1326.369995, 0.614792, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500003, 700000, 0, 1, 1, 0, 0, '-8924.769531', '-134.764999', 81.313301, 5.010850, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500004, 700000, 530, 1, 1, 0, 0, 10354.299805, '-6370.200195', 36.021599, 4.961830, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500005, 700000, 1, 1, 1, 0, 0, '-2904.689941', '-259.657013', 52.940899, 0.286670, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500006, 700000, 0, 1, 1, 0, 0, 1657.089966, 1683.239990, 120.718964, 3.188280, 30, 0, 0, 11111, 11111, 0, 1, 2, 8),
(500007, 700000, 1, 1, 1, 0, 0, '-604.479004', '-4257.290039', 38.956100, 0.302379, 30, 0, 0, 11111, 11111, 0, 1, 2, 8);
