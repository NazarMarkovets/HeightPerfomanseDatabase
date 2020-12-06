CREATE DEFINER=`root`@`localhost` TRIGGER `services_BEFORE_UPDATE` BEFORE UPDATE ON `services` FOR EACH ROW BEGIN
if not exists 
(select 1 from my.fonts f where f.fonts_id = new.fk_service_fonts) or
not exists (select 1 from my.paper where paper.paper_id = new.fk_service_paper) 
    then 
		signal sqlstate '45000' set message_text = 'Нельзя вставить запись ';
	end if;
END