UPDATE `role`
   SET `name` = 'Staff'
 WHERE `role`.`ROLE_ID` = 6;


INSERT INTO `requestmap`(`version`, `config_attribute`, `http_method`, `url`)
                 VALUES ('0', 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER,', NULL, '/restaurantDevice/loadServingTableList/**');
        
INSERT INTO `requestmap`(`version`, `config_attribute`, `http_method`, `url`)
                 VALUES ('0', 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_STAFF', NULL, '/customer/**');

UPDATE `customer` SET `CODE` = '9999999999' WHERE `customer`.`CUSTOMER_ID` = 1;
UPDATE `requestmap` SET `config_attribute` = 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_STAFF' WHERE `requestmap`.`id` = 41;
UPDATE `requestmap` SET `config_attribute` = 'ROLE_STAFF' WHERE `requestmap`.`id` = 15;