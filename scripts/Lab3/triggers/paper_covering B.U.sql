CREATE DEFINER=`root`@`localhost` TRIGGER `paper_covering_BEFORE_UPDATE` BEFORE UPDATE ON `paper_covering` FOR EACH ROW BEGIN
	if exists(select 1  from my.`paper` where fk_paper_covering = old.covering_id)
    and old.covering_id != new.covering_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END