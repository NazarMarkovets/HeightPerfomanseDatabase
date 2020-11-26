CREATE DEFINER=`root`@`localhost` TRIGGER `macket_to_print_BEFORE_DELETE` BEFORE DELETE ON `macket_to_print` FOR EACH ROW BEGIN
if exists 
(select 1 from my.order_macket om where om.id_macket = old.macket_id)
    then 
		signal sqlstate '45000' set message_text = 'Нельзя удалить запись ';
	end if;
END