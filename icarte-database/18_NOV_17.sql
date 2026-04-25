START TRANSACTION;

INSERT INTO `requestmap`(`version`,
                                      `config_attribute`,
                                      `http_method`,
                                      `url`)
VALUES ('0',
        'ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_MANAGER',
        NULL,
        '/restaurantDevice/**');

UPDATE `requestmap`
   SET `config_attribute` =
          'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER'
 WHERE `requestmap`.`id` = 44;
 
--  DEVICE ID/ IMEI should be unique globally
ALTER TABLE restaurant_device
 ADD CONSTRAINT UK_RESTDEVICE_DEVICE_ID UNIQUE KEY (DEVICE_ID);

ALTER TABLE `restaurant_device` ADD INDEX(`REGISTRATION_CODE`);

-- Make manfacturer as optional
ALTER TABLE `restaurant_device`
   CHANGE `DEVICE_MANUFECTURER` `DEVICE_MANUFECTURER`VARCHAR(500)
      CHARACTER SET utf8
      COLLATE utf8_general_ci
      NULL;
      
ALTER TABLE `restaurant_device`
   CHANGE `ACTIVATED_ON` `BLOCKED_ON` DATE NULL DEFAULT NULL;

ALTER TABLE `restaurant_device`
   CHANGE `TABLE_REFERENCE` `SERVING_TABLE_ID` BIGINT(20) NULL DEFAULT NULL
      COMMENT 'This field will be populated only if the application_mode is 2 or 3';

ALTER TABLE restaurant_device
 ADD CONSTRAINT FK_RESTDEVICE_SRV_TBL FOREIGN KEY (SERVING_TABLE_ID) 
  REFERENCES serving_table(SERVING_TABLE_ID);
 
 
ALTER TABLE `account_type`
   ADD`DEVICE_NUM_ALLOWED` INT(4) NOT NULL DEFAULT '5' AFTER `NAME`;
   
ALTER TABLE `account_type`
   ADD`BRANCH_NUM_ALLOWED` INT(4) NOT NULL DEFAULT '1' AFTER `DEVICE_NUM_ALLOWED`;


-- Many-to-Many Item table to support multiple item categories in menu
CREATE TABLE `menu_item_category` (
  `MENU_ITEM_CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MENU_ID` bigint(20) NOT NULL,
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL,
  `IS_DELETED` bit(1) NOT NULL,
  PRIMARY KEY (`MENU_ITEM_CATEGORY_ID`),
  UNIQUE KEY
      `UK_MENU_CAT_IS_DELETED`
      (`MENU_ID`, `ITEM_CATEGORY_ID`, `IS_DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `menu_item_category`
   ADD CONSTRAINT `FK_MENU_CAT_MENU` FOREIGN KEY
          (`MENU_ID`)
          REFERENCES `menu`(`MENU_ID`)
             ON DELETE RESTRICT
             ON UPDATE RESTRICT;
             
ALTER TABLE `menu_item_category`
   ADD CONSTRAINT `FK_MENU_CAT_CAT` FOREIGN KEY
          (`ITEM_CATEGORY_ID`)
          REFERENCES `item_category`(`ITEM_CATEGORY_ID`)
             ON DELETE RESTRICT
             ON UPDATE RESTRICT;
             
-- Insert data into menu_item_category
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 1, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 4, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 7, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 8, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 9, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 10, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 11, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 12, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 13, 0);
INSERT INTO RESTAURANT.menu_item_category (MENU_ID, ITEM_CATEGORY_ID, IS_DELETED) VALUES (1, 14, 0);

-- Add indexes to common search columns
ALTER TABLE `item_variant_translation` ADD INDEX(`TITLE`);
ALTER TABLE `item_category_translation` ADD INDEX(`TITLE`);
ALTER TABLE `addon_translation` ADD INDEX(`TITLE`);
ALTER TABLE `cuisine_translation` ADD INDEX(`TITLE`);
ALTER TABLE `feedback_config_translation` ADD INDEX(`TITLE`);
ALTER TABLE `ingredient_translation` ADD INDEX(`TITLE`);
ALTER TABLE `restaurant_event_translation` ADD INDEX(`TITLE`);
ALTER TABLE `restaurant_translation` ADD INDEX(`TITLE`);
ALTER TABLE `special_deal_translation` ADD INDEX(`TITLE`);
ALTER TABLE `spice_type_translation` ADD INDEX(`TITLE`);
ALTER TABLE `variant_translation` ADD INDEX(`TITLE`);

