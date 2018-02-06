CREATE TABLE IF NOT EXISTS `#__products` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`product_code` VARCHAR(255)  NOT NULL ,
`product_name` VARCHAR(255)  NOT NULL ,
`category` TEXT NOT NULL ,
`product_classification` VARCHAR(255)  NOT NULL ,
`product_type` VARCHAR(255)  NOT NULL ,
`product_uom` VARCHAR(255)  NOT NULL ,
`product_price` VARCHAR(255)  NOT NULL ,
`product_size` VARCHAR(255)  NOT NULL ,
`product_cases` INT NOT NULL ,
`published` VARCHAR(255)  NOT NULL ,
`must_have` VARCHAR(255)  NOT NULL ,
`deleted` VARCHAR(255)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

