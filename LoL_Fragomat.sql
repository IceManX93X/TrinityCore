INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) 
VALUES(55554, 1, 0, "Allgemeine Informationen zum Server", 1, 1, 55555, 0, 0, 0, 0, ""),
(55555, 1, 0, "Ist der Server Blizzlike?", 1, 1, 55560, 0, 0, 0, 0, ""),
(55560, 1, 0, "Ja, aber die EP Raten liegen bei 120%, damit versuchen wir fehlerhafte Quests auszugleichen", 1, 1, 55554, 0, 0, 0, 0, ""),
(55555, 2, 0, "Wann ist immer Serverupdate?", 1, 1, 55561, 0, 0, 0, 0, ""),
(55561, 1, 0, "Serverupdate ist jeden Samstag Vormittag", 1, 1, 55554, 0, 0, 0, 0, ""),
(55555, 3, 0, "Wie lange ist immer Serverupdate?", 1, 1, 55562, 0, 0, 0, 0, ""),
(55562, 1, 0, "Das kann man schlecht sagen. Je nach Menge der Neuerungen kann es so 2 - 3 Stunden dauern. $B Abweichungen sind moeglich", 1, 1, 55554, 0, 0, 0, 0, ""),
(55555, 4, 0, "Zurueck", 1, 1, 55554, 0, 0, 0, 0, "");

INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`)
(55554, 2, 0, "Questfragen", 1, 1, 55556, 0, 0, 0, 0, ""),
(55556, 2, 0, "Buggy Quest? Was kann ich tun?", 1, 1, 55563, 0, 0, 0, 0, ""),
(55563, 1, 0, "Ins Mantis schreiben, bugs.landoflegends.de - Es ist ein extra Account noetig", 1, 1, 55554, 0, 0, 0, 0, ""),
(55556, 3, 0, "Questtexte / Items / Berufe nicht anklickbar?", 1, 1, 55564, 0, 0, 0, 0, ""),
(55564, 1, 0, "Rechtsklick auf den Chat-Reiter Allgemein/auf interaktiv machen klicken", 1, 1, 55554, 0, 0, 0, 0, ""),
(55556, 4, 0, "Du kannst keine Quests erledigen / Questitems einsammeln?", 1, 1, 55565, 0, 0, 0, 0, ""),
(55565, 1, 0, "Ueberpruefe das du in keinen Schlachtzug bist", 1, 1, 55554, 0, 0, 0, 0, ""),
(55556, 5, 0, "Ich sehe auf der Karte die Quests nicht mehr", 1, 1, 55566, 0, 0, 0, 0, ""),
(55566, 1, 0, "Eine andere Quest annehmen bzw eine abgeben, dann sollte es wieder funktionieren.", 1, 1, 55554, 0, 0, 0, 0, ""),
(55556, 6, 0, "Zurueck", 1, 1, 55554, 0, 0, 0, 0, "");