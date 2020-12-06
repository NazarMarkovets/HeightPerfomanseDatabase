CREATE DEFINER=`root`@`localhost` TRIGGER `user_BEFORE_DELETE` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
	if exists (select 1 from my.`order` o where o.fk_order_user = old.user_id)
    then 
		update my.`order` o
        set o.fk_order_user = null
        where o.fk_order_user = old.user_id;
	end if;
END