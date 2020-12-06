CREATE DEFINER=`root`@`localhost` TRIGGER `macket_to_print_BEFORE_INSERT` BEFORE INSERT ON `macket_to_print` FOR EACH ROW BEGIN
if not exists 
( select 1 from my.format_type f where f.format_type_id = new.fk_macket_to_formatType) and new.fk_macket_to_formatType is not null
    then 
		signal sqlstate '45000' set message_text = 'Нельзя вставить запись. Отсутствие формата ';
	end if;
END