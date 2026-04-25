INSERT INTO `ref_country` (`version`, `date_created`, `enabled`, `name`, `un_code`) 
VALUES ('0', '2017-02-27 00:00:00', b'1', 'PAKISTAN', 'PK');

INSERT INTO `ref_city` (`name`, `version`, `code`, country_id, `date_created`, `enabled`) 
VALUES ('Lahore', '1', 'LHE', (SELECT rc1.id from ref_country rc1 where rc1.un_code LIKE 'PK'), '2017-02-27 00:00:00', b'1');

INSERT INTO `ref_city` (`name`, `version`, `code`, `country_id`, `date_created`, `enabled`) 
VALUES ('Islamabad', '1', 'ISB', (SELECT rc1.id from ref_country rc1 where rc1.un_code LIKE 'PK'), '2017-02-27 00:00:00', b'1');

INSERT INTO `ref_city` (`name`, `version`, `code`, `country_id`, `date_created`, `enabled`) 
VALUES ('Karachi', '1', 'KHI', (SELECT rc1.id from ref_country rc1 where rc1.un_code LIKE 'PK'), '2017-02-27 00:00:00', b'1');


