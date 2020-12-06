CREATE DEFINER=`root`@`localhost` TRIGGER `paper_brightness_BEFORE_DELETE` BEFORE DELETE ON `paper_brightness` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_to_bright = old.brightness_id)
	then 
		signal sqlstate '45000' set message_text = 'can not delete data ';
	end if;
END