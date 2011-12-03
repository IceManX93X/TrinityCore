DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (7376,21178,25780,48263);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(7376,57339,2, 'Defensive Stance Passive - Tank Class Passive Threat'),
(21178,57339,2, 'Bear Form (Passive2) - Tank Class Passive Threat'),
(25780,57339,2, 'Righteous Fury - Tank Class Passive Threat'),
(48263,57340,2, 'Frost Presence - Tank Class Passive Threat');
