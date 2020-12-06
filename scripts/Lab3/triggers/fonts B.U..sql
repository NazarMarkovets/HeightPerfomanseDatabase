CREATE DEFINER=`root`@`localhost` TRIGGER `fonts_BEFORE_UPDATE` BEFORE UPDATE ON `fonts` FOR EACH ROW BEGIN
	if exists(select 1  from my.`services` s where s.fk_service_fonts = old.fonts_id) and old.fonts_id != new.fonts_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END