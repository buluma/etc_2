CREATE TABLE IF NOT EXISTS `#__photos` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`client_id` VARCHAR(255)  NOT NULL ,
`imagepath` BLOB NOT NULL ,
`imagedate` VARCHAR(255)  NOT NULL ,
`manufacturer` VARCHAR(255)  NOT NULL ,
`brand` TEXT NOT NULL ,
`brandcode` TEXT NOT NULL ,
`submitter` INT(11)  NOT NULL ,
`user_id` INT(11)  NOT NULL ,
`store` TEXT NOT NULL ,
`store_id` TEXT NOT NULL ,
`store_server_id` TEXT NOT NULL ,
`remarks` TEXT NOT NULL ,
`created_on` DATETIME NOT NULL ,
`coordinates` VARCHAR(255)  NOT NULL ,
`client_modified_date` DATETIME NOT NULL ,
`first_insert_date` TIMESTAMP NOT NULL ,
`last_sync_date` VARCHAR(255)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

