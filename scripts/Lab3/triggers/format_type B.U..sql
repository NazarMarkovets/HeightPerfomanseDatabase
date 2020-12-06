CREATE DEFINER=`root`@`localhost` TRIGGER `format_type_BEFORE_UPDATE` BEFORE UPDATE ON `format_type` FOR EACH ROW BEGIN
	if exists(select 1  from my.macket_to_print m where m.fk_macket_to_formatType = old.format_type_id)
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END