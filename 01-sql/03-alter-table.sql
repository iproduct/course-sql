ALTER TABLE `gamebar`.`employees` 
CHANGE COLUMN `id` `id` INT(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `gamebar`.`employees` 
CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `products` 
ADD INDEX `fk_category_idx` (`category_id` ASC) VISIBLE;
;

ALTER TABLE `products`
DROP FOREIGN KEY `fk_category`;

ALTER TABLE `products`
ADD CONSTRAINT `fk_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(45) NOT NULL DEFAULT '' AFTER `first_name`;

ALTER TABLE `employees`
CHANGE COLUMN `middle_name` `middle_name` VARCHAR(100) NOT NULL DEFAULT '' ;

ALTER TABLE `employees` DROP COLUMN `last_login_time`;

ALTER TABLE `employees` ADD COLUMN `last_login_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `employees` MODIFY COLUMN `last_login_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `employees`
CHANGE COLUMN `last_login_time` `last_login_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP; 