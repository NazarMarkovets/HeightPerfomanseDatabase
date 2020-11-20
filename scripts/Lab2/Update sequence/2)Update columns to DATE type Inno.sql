Alter table `inno`.`fonts`
Change column `fontsDATE` `fontsDATE` DATE NOT NULL;

ALTER TABLE `inno`.`macket_to_print` 
CHANGE COLUMN `macketDATE` `macketDATE` DATE NOT NULL ;

ALTER TABLE `inno`.`order` 
CHANGE COLUMN `order_start` `order_start` DATE NOT NULL ,
CHANGE COLUMN `order_done` `order_done` DATE NOT NULL ;

ALTER TABLE `inno`.`paper` 
CHANGE COLUMN `paperDATE` `paperDATE` DATE NOT NULL ;

ALTER TABLE `inno`.`services` 
CHANGE COLUMN `serviceDATE` `serviceDATE` DATE NULL DEFAULT NULL ;

ALTER TABLE `inno`.`user` 
CHANGE COLUMN `registerDate` `registerDate` DATE NULL DEFAULT NULL ;
