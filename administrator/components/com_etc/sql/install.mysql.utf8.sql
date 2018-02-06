CREATE TABLE IF NOT EXISTS `#__outlets` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`asset_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`account` VARCHAR(255)  NOT NULL ,
`shop_name` VARCHAR(255)  NOT NULL ,
`category` VARCHAR(255)  NOT NULL ,
`region` VARCHAR(255)  NOT NULL ,
`location` VARCHAR(255)  NOT NULL ,
`manager_name` VARCHAR(255)  NOT NULL ,
`manager_phone` VARCHAR(255)  NOT NULL ,
`submitter` INT NOT NULL ,
`last_sync_date` VARCHAR(255)  NOT NULL ,
`date_created` TIMESTAMP NOT NULL ,
`user_id` INT NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

