CREATE TABLE IF NOT EXISTS `#__clients` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`asset_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`client_logo` VARCHAR(255)  NOT NULL ,
`client_name` VARCHAR(255)  NOT NULL ,
`client_email` VARCHAR(255)  NOT NULL ,
`client_location` VARCHAR(255)  NOT NULL ,
`contact_person` VARCHAR(255)  NOT NULL ,
`contact_person_email` VARCHAR(255)  NOT NULL ,
`created_on` DATETIME NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

