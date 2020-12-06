CREATE DEFINER=`root`@`localhost` TRIGGER `status_BEFORE_DELETE` BEFORE DELETE ON `status` FOR EACH ROW BEGIN
	if exists(select 1  from my.`order` o where o.fk_order_to_stat = old.status_id)
	then 
		signal sqlstate '45000' set message_text = 'can not delete data. There are fk to this status ';
	end if;
END