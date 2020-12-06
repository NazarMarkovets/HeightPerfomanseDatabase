CREATE DEFINER=`root`@`localhost` TRIGGER `user_BEFORE_UPDATE` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
		if not exists (select 1 from my.`role` where role_id = new.fk_user_to_role)
    then 
		signal sqlstate '45000' set message_text = 'can not update row. There is no the role_id';
	end if;
END