CREATE TABLE IF NOT EXISTS `#__quality_issues` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`brand` TEXT NOT NULL ,
`brandcode` TEXT NOT NULL ,
`issue_type` VARCHAR(255)  NOT NULL ,
`rateofsale` VARCHAR(255)  NOT NULL ,
`expiry_date` DATE NOT NULL ,
`store` TEXT NOT NULL ,
`store_id` TEXT NOT NULL ,
`store_server_id` TEXT NOT NULL ,
`created_on` DATETIME NOT NULL ,
`remarks` TEXT NOT NULL ,
`client_id` VARCHAR(255)  NOT NULL ,
`coordinates` VARCHAR(255)  NOT NULL ,
`submitter` INT(11)  NOT NULL ,
`user_id` INT(11)  NOT NULL ,
`last_sync_date` VARCHAR(255)  NOT NULL ,
`first_insert_date` TIMESTAMP NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

