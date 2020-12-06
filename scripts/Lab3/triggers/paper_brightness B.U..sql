CREATE DEFINER=`root`@`localhost` TRIGGER `paper_brightness_BEFORE_UPDATE` BEFORE UPDATE ON `paper_brightness` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_to_bright = old.brightness_id)
    and old.brightness_id != new.brightness_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END