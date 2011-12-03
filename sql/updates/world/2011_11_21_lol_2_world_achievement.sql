-- Achievement: Pilgrim
UPDATE `achievement_reward` SET
`item` = '44810',   -- Turkey Cage
`sender` = '28951', -- Breanni
`subject` = 'A Gobbler not yet Gobbled',
`text` = 'Can you believe this Plump Turkey made it through November alive?! Since all his friends have been served up on Bountiful Tables with sides of Cranberry Chutney and Spice Bread Stuffing and... ooo... I''m getting hungry, But anyhow! He''s all alone, now, so I was hoping you might be willing to take care of him. There simply isn''t enough room left in my shop! Just keep him away from cooking fires, please. He gets this strange look in his eyes around them... --Breanni'
WHERE `entry` IN (3478,3656); -- source: http://www.wowwiki.com/Turkey_Cage
