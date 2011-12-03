-- try to fix DK Ability: Heartstrike - Calculate default attack power coefficient. (`ap_bonus`= -1)
DELETE FROM `spell_bonus_data` WHERE `entry`=55050;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(55050,0,0,-1,0,'Death Knight - Heartstrike');