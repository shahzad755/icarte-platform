-- 13/11/26 08:58 PM
-- ADDING NEW COUNTRY AND CITY
INSERT INTO `ref_country` (`version`, `date_created`, `enabled`, `name`, `un_code`) 
VALUES ('0', '2017-02-27 00:00:00', b'1', 'QATAR', 'QA');

INSERT INTO `ref_city` (`name`, `version`, `code`, `country_id`, `date_created`, `enabled`) 
VALUES ('Doha', '1', 'DOH', '2', '2017-02-27 00:00:00', b'1');

-- SQL CHANGE LOG to ADD BRANCH and MENU RELATION
ALTER TABLE `menu` ADD `BRANCH_ID` BIGINT(20) NOT NULL AFTER `RESTAURANT_ID`;
ALTER TABLE menu ADD CONSTRAINT FK_MENU_BRANCH FOREIGN KEY (BRANCH_ID) REFERENCES branch(BRANCH_ID);

UPDATE `menu` SET `BRANCH_ID` = '1' WHERE `menu`.`MENU_ID` = 1;
UPDATE `menu` SET `BRANCH_ID` = '11' WHERE `menu`.`MENU_ID` = 2;
UPDATE `menu` SET `BRANCH_ID` = '1' WHERE `menu`.`MENU_ID` = 3;

-- alter table staff drop constraint unique_branch_code;

-- SQL CHANGE LOG to ADD BRANCH and RESTAURANT DEVICE RELATION.
ALTER TABLE restaurant_device ADD `BRANCH_ID` BIGINT(20) NOT NULL AFTER `RESTAURANT_ID`;
ALTER TABLE restaurant_device ADD CONSTRAINT FK_REST_DEVICE_BRANCH FOREIGN KEY (BRANCH_ID) REFERENCES branch(BRANCH_ID);
