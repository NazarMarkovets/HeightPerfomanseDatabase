CREATE DEFINER=`root`@`localhost` TRIGGER `user_BEFORE_DELETE` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
	if exists(select 2 from myisam.order where fk_User_ID = old.User_ID)
    then 
		update myisam.order
        Set fk_User_ID = null
        where fk_User_ID = old.User_ID;
	end if;
END