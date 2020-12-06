CREATE DEFINER=`root`@`localhost` TRIGGER `paper_iso_BEFORE_DELETE` BEFORE DELETE ON `paper_iso` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_to_iso = old.iso_id)
    
	then 
		signal sqlstate '45000' set message_text = 'can not delete data ';
	end if;
END