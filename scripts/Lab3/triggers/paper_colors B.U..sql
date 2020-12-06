CREATE DEFINER=`root`@`localhost` TRIGGER `paper_colors_BEFORE_UPDATE` BEFORE UPDATE ON `paper_colors` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_color = old.colors_id)
    and old.colors_id != new.colors_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END