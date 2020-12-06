CREATE DEFINER=`root`@`localhost` TRIGGER `order_services_BEFORE_UPDATE` BEFORE UPDATE ON `order_services` FOR EACH ROW BEGIN
if exists
(select 1 from my.`order` o where o.order_id = new.fk_order_id) or 
exists (select 1 from my.`services` where service_id = new.fk_service_id)
    then 
		signal sqlstate '45000' set message_text = 'Can not update';
	end if;
END