CREATE TABLE IF NOT EXISTS `#__planner` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`submitter` INT(11)  NOT NULL ,
`user_id` INT(11)  NOT NULL ,
`week` VARCHAR(255)  NOT NULL ,
`month` VARCHAR(255)  NOT NULL ,
`year` VARCHAR(255)  NOT NULL ,
`routeplan` TEXT NOT NULL ,
`inputdate` VARCHAR(255)  NOT NULL ,
`coordinates` VARCHAR(255)  NOT NULL ,
`first_insert` TIMESTAMP NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

