CREATE DEFINER=`root`@`localhost` TRIGGER `format_type_BEFORE_DELETE` BEFORE DELETE ON `format_type` FOR EACH ROW BEGIN
	if exists(select 1  from my.macket_to_print where fk_macket_to_formatType = old.format_type_id)
	then 
		update my.macket_to_print m
        set fk_macket_to_formatType = null
        where fk_macket_to_formatType = old.format_type_id;
	end if;
END