CREATE DEFINER=`root`@`localhost` TRIGGER `order_BEFORE_DELETE` BEFORE DELETE ON `order` FOR EACH ROW BEGIN
if  exists (select 1 from my.`user` u where u.user_id = old.fk_order_user) or old.fk_order_user is null 
    then 
		signal sqlstate '45000' set message_text = 'Can not delete order ';
	end if;
END