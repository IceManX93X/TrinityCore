-- fix purchasing Dual Spec for 0g
UPDATE `gossip_menu_option` SET
    `option_text`   = "Purchase a Dual Talent Specialization",
    `box_money`     = 10000000,
    `box_text`      = "Are you sure you wish to purchase a Dual Talent Specialization?"
WHERE option_id = 18;