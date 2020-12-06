CREATE DEFINER=`root`@`localhost` TRIGGER `order_macket_BEFORE_DELETE` BEFORE DELETE ON `order_macket` FOR EACH ROW BEGIN
if exists
(select 1 from my.`order` o where o.order_id = old.id_order) or 
 exists(select 1 from my.macket_to_print m where m.macket_id = old.id_macket)
    then 
		signal sqlstate '45000' set message_text = 'Нельзя удалить запись ';
	end if;
END