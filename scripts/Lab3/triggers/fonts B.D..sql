CREATE DEFINER=`root`@`localhost` TRIGGER `fonts_BEFORE_DELETE` BEFORE DELETE ON `fonts` FOR EACH ROW BEGIN
if exists(select 1  from my.`services` s where s.fk_service_fonts = old.fonts_id)
	then 
		signal sqlstate '45000' set message_text = 'can not delete data ';
	end if;
END