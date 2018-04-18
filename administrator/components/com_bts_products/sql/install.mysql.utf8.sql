CREATE TABLE IF NOT EXISTS `#__bts_products` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`product_code` VARCHAR(255)  NOT NULL ,
`product_name` VARCHAR(255)  NOT NULL ,
`product_sku` VARCHAR(255)  NOT NULL ,
`category` TEXT NOT NULL ,
`product_target` VARCHAR(255)  NOT NULL ,
`published` VARCHAR(255)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

