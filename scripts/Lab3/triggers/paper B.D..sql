CREATE DEFINER=`root`@`localhost` TRIGGER `paper_BEFORE_DELETE` BEFORE DELETE ON `paper` FOR EACH ROW BEGIN
if exists 
(select 1 from my.services where fk_service_paper = old.paper_id)
    then 
		signal sqlstate '45000' set message_text = 'Can not delete. There is a service uses this type';
	end if;
END