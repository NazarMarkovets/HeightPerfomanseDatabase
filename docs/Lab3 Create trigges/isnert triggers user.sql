CREATE DEFINER=`root`@`localhost` TRIGGER `user_BEFORE_INSERT_1` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	if not exists(select 1 from myisam.gender where Gender_ID=new.fk_Gender_ID)
    then 
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Нельзя вставить запись';
	end if;
    if not exists (select 1 from myisam.role where Role_ID=new.fk_Role_ID)
    then 
		SIGNAL SQLSTATE '45000' SET message_text= 'Нельзя вставить запись';
	end if;
END