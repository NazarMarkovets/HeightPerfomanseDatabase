CREATE DEFINER=`root`@`localhost` TRIGGER `services_BEFORE_DELETE` BEFORE DELETE ON `services` FOR EACH ROW BEGIN
if  exists 
(select 1 from my.order_services os where os.fk_service_id = old.service_id) or
exists (select 1 from my.paper where paper.paper_id = old.fk_service_paper)
    then 
		signal sqlstate '45000' set message_text = 'Can not delete this service ';
	end if;
END