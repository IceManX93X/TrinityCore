-- INSERT INTO gossip_menu (`entry`, `text_id`) VALUES(55555, 55554);
-- UPDATE gossip_menu SET text_id = 55555 WHERE entry = 55555;
-- SELECT * FROM gossip_menu WHERE entry = 55555;
-- UPDATE gossip_menu SET text_id = 55554 WHERE entry = 55555;
-- DELETE FROM gossip_menu WHERE entry = 55555;
-- UPDATE creature_template SET gossip_menu_id = 55554 WHERE entry = 700000;
-- INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55555, 1, 0, "Buggy Quest? Was kann ich tun?", 1, 1, 0, 0, 0, 0, 0, "");
-- UPDATE gossip_menu_option SET id = 0 WHERE menu_id = 60000;
-- SELECT * FROM gossip_menu_option WHERE menu_id = 60000;
-- UPDATE gossip_menu_option SET action_menu_id = 60000 WHERE menu_id = 60000;
-- DELETE FROM gossip_menu_option WHERE menu_id = 55557;
-- INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55557, 1, 0, "Wie kann ich sehen ob ein GM online ist?", 1, 1, 55558, 0, 0, 0, 0, "");
-- UPDATE gossip_menu_option SET id = 1 WHERE menu_id = 55557;
-- SELECT * FROM gossip_menu_option WHERE menu_id = 55555;
-- INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55555, 2, 0, "Wie kann ich sehen ob ein GM online ist?", 1, 1, 0, 0, 0, 0, 0, "");
-- UPDATE gossip_menu_option SET option_text = "Wo finde ich einen Lehrer fuer meine Klasse bzw. fuer meine Berufe?" WHERE menu_id = 55555 AND id = 15;
-- DELETE FROM gossip_menu_option WHERE menu_id = 55555;
-- DELETE FROM npc_text WHERE ID = 55554;
-- INSERT INTO npc_text VALUES(55554, "Wie kann ich euch helfen?", "Wie kann ich euch helfen?", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
UPDATE creature_template SET scale = 0.2, modelid1 = 15363 WHERE entry = 700000;
-- INSERT INTO npc_text VALUES(55554, "Wie kann ich euch helfen?", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 12340);
-- SELECT * FROM npc_text WHERE ID = 55555;
-- UPDATE npc_text SET text0_0 = "Wie kann ich euch helfen?" WHERE ID = 55555;
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES(55555, 3, 0, "Wie lange ist immer Serverupdate?", 1, 1, 0, 0, 0, 0, 0, "");
