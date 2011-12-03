-- Fix Spell 56684 for Quest 13045

DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17 AND SourceEntry = 56684;

INSERT INTO conditions VALUES
(17,0,56684,0,30,192522,10,0,0,'',''),
(17,0,56684,0,29,30407,10,0,0,'','');
