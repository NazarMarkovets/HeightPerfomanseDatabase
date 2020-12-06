CREATE DEFINER=`root`@`localhost` TRIGGER `status_BEFORE_UPDATE` BEFORE UPDATE ON `status` FOR EACH ROW BEGIN
	if exists(select 1  from my.`order` where fk_order_to_stat = old.status_id) and old.status_id != new.status_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END