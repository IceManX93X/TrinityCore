UPDATE `gossip_menu_option` SET `option_id`=4, `npc_option_npcflag`=8192 WHERE `menu_id`=7939 AND `id` IN (0,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=7939 AND `SourceEntry`=1;   
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(15,7939,1,0,28,10140,0,0,0,'', 'Show gossip option 0 if player has Quest 10140 "Journey to Honor Hold"');