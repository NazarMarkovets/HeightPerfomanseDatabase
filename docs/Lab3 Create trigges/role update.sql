CREATE DEFINER=`root`@`localhost` TRIGGER `role_BEFORE_UPDATE` BEFORE UPDATE ON `role` FOR EACH ROW BEGIN
	if exists (select * from myisam.user where fk_Role_ID = old.Role_ID)
    and old.Role_ID != new.Role_ID
    then 
    signal sqlstate '45000' set message_text = 'Нельзя обновить данные';
    end if;
END