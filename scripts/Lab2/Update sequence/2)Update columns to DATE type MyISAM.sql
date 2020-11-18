Alter table `mu`.`fonts`
Change column `fontsDATA` `fontsDATA` DATE NOT NULL;

ALTER TABLE `mu`.`macket_to_print` 
CHANGE COLUMN `macketDATA` `macketDATA` DATE NOT NULL ;

ALTER TABLE `mu`.`order` 
CHANGE COLUMN `order_start` `order_start` DATE NOT NULL ,
CHANGE COLUMN `order_done` `order_done` DATE NOT NULL ;

ALTER TABLE `mu`.`paper` 
CHANGE COLUMN `paperDATE` `paperDATE` DATE NOT NULL ;

ALTER TABLE `mu`.`services` 
CHANGE COLUMN `serviceDATE` `serviceDATE` DATE NULL DEFAULT NULL ;

ALTER TABLE `mu`.`user` 
CHANGE COLUMN `registerDate` `registerDate` DATE NULL DEFAULT NULL ;
