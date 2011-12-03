


-- INSERT INTO creature_template (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) 
-- VALUES(700000, 0, 0, 0, 0, 0, 23447, 0, 0, 0, "Fragomat", "Ich beantworte (fast) jede Frage", "Directions", 55554, 111, 111, 0, 5, 5, 1, 1, 1, 0.4, 0, 111, 111, 0, 666, 1, 2000, 2000, 8, 2, 8, 0, 0, 0, 0, 0, 222, 222, 111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", 1, 4, 11111, 11111, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "", 12340);

-- INSERT INTO gossip_menu (`entry`, `text_id`) 
-- VALUES(55555, 55554),
-- (300505, 55554);



INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`)

(55554, 3, 0, "Channelfragen", 1, 1, 55557, 0, 0, 0, 0, ""),
(55557, 1, 0, "LoL Channel - Welcher ist wofuer da?", 1, 1, 55567, 0, 0, 0, 0, ""),
(55567, 1, 0, "Gildensuche  - /join Gildenrekrutierung $B Kaeufe bzw Verkaeufe - /join ah $B Smalltalk / Questfragen etc. - /join global $B ", 1, 1, 55554, 0, 0, 0, 0, ""),
(55567, 2, 0, "Gruppensuche - /join SucheNachGruppe $B Fragen an GM / Supporter / Scripter - /join Support $B Musikwuenschen uebers Radio", 1, 1, 55554, 0, 0, 0, 0, ""),
(55557, 2, 0, "Channel betreten / Channel verlassen Anzeige deaktivieren", 1, 1, 55568, 0, 0, 0, 0, ""),
(55568, 1, 0, "Rechtsklick auf den Chat-Reiter Allgemein/auf Einstellungen klicken/Anderes anklicken/Haken bei Channel raus", 1, 1, 0, 0, 0, 0, ""),
(55557, 3, 0, "Zurueck", 1, 1, 55554, 0, 0, 0, 0, "");

INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`)
(55554, 4, 0, "InGame Befehle", 1, 1, 55558, 0, 0, 0, 0, ""),
(55558, 1, 0, "Mir wird in der Gruppe jemand als unbekannt angezeigt. Was tun?", 1, 1, 55569, 0, 0, 0, 0, ""),
(55569, 1, 0, "/reload in den Chat eingeben", 1, 1, 55554, 0, 0, 0, 0, ""),
(55558, 2, 0, "Du kannst nicht lesen was du schreibst?", 1, 1, 55570, 0, 0, 0, 0, ""),
(55570, 1, 0, "/reload oder Wow komplett neu starten.", 1, 1, 55554, 0, 0, 0, 0, ""),
(55558, 3, 0, "Du kannst nicht lesen was andere schreiben?", 1, 1, 55571, 0, 0, 0, 0, ""),
(55571, 1, 0, "Relog oder /leave ........... (den bestimmten Channel) und wieder joinen.", 1, 1, 55554, 0, 0, 0, 0, ""),
(55558, 4, 0, "Du hast das AddOn RECOUNT installiert aber es regt sich nix?", 1, 1, 55572, 0, 0, 0, 0, ""),
(55572, 1, 0, "Relogen oder /script CombatLogClearEntries() in den Chat oder in ein Makro", 1, 1, 55554, 0, 0, 0, 0, ""),
(55558, 5, 0, "Wie kann ich sehen ob ein GM online ist?", 1, 1, 55573, 0, 0, 0, 0, ""),
(55573, 1, 0, ".gm i in den Chat eingeben und es wird der eine Liste der eingeloggten GM angezeigt", 1, 1, 55554, 0, 0, 0, 0, ""),
(55558, 6, 0, "Wenn man angeblich in einer Gruppe ist, aber die Gruppe schon verlassen.", 1, 1, 55574, 0, 0, 0, 0, ""),
(55574, 1, 0, "/script LeaveParty() in den Chat eingeben", 1, 1, 55554, 0, 0, 0, 0, ""),
(55558, 7, 0, "Zurueck", 1, 1, 55554, 0, 0, 0, 0, "");

INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`)
(55554, 5, 0, "Sonstiges", 1, 1, 55559, 0, 0, 0, 0, ""),
(55559, 1, 0, "Ich bin tot aber kein Geisterheiler in der Naehe", 1, 1, 55575, 0, 0, 0, 0, ""),
(55575, 1, 0, "1. Wow schlie√üen/LoL Starter √∂ffnen/Kreuz bei WDB-Ordner l√∂schen rein/Wow neu starten $B 2. auf die LoL-HP gehen/Portal klicken/Ruhestein benutzen $B 3. gehe auf - tiny.cc/geistheiler - dann einfach zu dem n‰chsten Geistheiler laufen", 1, 1, 55554, 0, 0, 0, 0, ""),
(55559, 2, 0, "Du hast eine Regelwidrigkeit entdeckt oder wurdest beleidigt?", 1, 1, 55576, 0, 0, 0, 0, ""),
(55576, 1, 0, "Screen/LoL-HP/Forenuebersicht/Team-Spieler-Regelverstieﬂe/Neues Thema und posten", 1, 1, 55554, 0, 0, 0, 0, ""),
(55559, 3, 0, "Woher bekomme ich AddOns?", 1, 1, 0, 0, 0, 0, 0, ""),
(55577, 1, 0, "Unter curseforge.com oder wowinterface.com findet ihr zahlreiche AddOns.$B Achtet auf die richtige Version (maximal Patch 3.3.5a)", 1, 1, 55554, 0, 0, 0, 0, ""),
(55559, 4, 0, "Zurueck", 1, 1, 55554, 0, 0, 0, 0, "");


