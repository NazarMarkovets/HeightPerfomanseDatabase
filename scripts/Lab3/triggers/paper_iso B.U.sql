CREATE DEFINER=`root`@`localhost` TRIGGER `paper_iso_BEFORE_UPDATE` BEFORE UPDATE ON `paper_iso` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_to_iso = old.iso_id)
    and old.iso_id != new.iso_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END