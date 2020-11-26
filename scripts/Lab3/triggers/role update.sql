CREATE DEFINER=`root`@`localhost` TRIGGER `role_BEFORE_UPDATE` BEFORE UPDATE ON `role` FOR EACH ROW BEGIN
	if exists(select 1  from my.`user` u where fk_user_to_role = old.role_id) and old.role_id != new.role_id
	then 
		signal sqlstate '45000' set message_text = 'can not update data ';
	end if;
END