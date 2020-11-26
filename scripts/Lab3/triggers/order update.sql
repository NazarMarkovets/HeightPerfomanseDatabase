CREATE DEFINER=`root`@`localhost` TRIGGER `order_BEFORE_UPDATE` BEFORE UPDATE ON `order` FOR EACH ROW BEGIN
if not exists 
	(select 1 from my.`status` s where s.status_id = new.fk_order_to_stat) AND
	(select 1 from my.`user` u where u.user_id = new.fk_order_user)
    then 
		signal sqlstate '45000' set message_text = 'Can not update data ';
	end if;
END