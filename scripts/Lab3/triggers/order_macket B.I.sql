CREATE DEFINER=`root`@`localhost` TRIGGER `order_macket_BEFORE_INSERT` BEFORE INSERT ON `order_macket` FOR EACH ROW BEGIN
if not exists
(select 1 from my.`order` o where o.order_id = new.id_order) or 
 not exists (select 1 from my.macket_to_print m where m.macket_id = new.id_macket)
    then 
		signal sqlstate '45000' set message_text = 'Can not insert new row';
	end if;
END