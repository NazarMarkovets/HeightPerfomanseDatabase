CREATE DEFINER=`root`@`localhost` TRIGGER `paper_density_BEFORE_UPDATE` BEFORE UPDATE ON `paper_density` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_to_density = old.density_id)
    and old.density_id != new.density_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END