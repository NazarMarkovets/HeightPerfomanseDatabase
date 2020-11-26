CREATE DEFINER=`root`@`localhost` TRIGGER `role_BEFORE_DELETE` BEFORE DELETE ON `role` FOR EACH ROW BEGIN
	if exists(select 1  from my.`user` where fk_user_to_role = old.role_id)
	then 
		signal sqlstate '45000' set message_text = 'can not delete ';
	end if;
END