CREATE DEFINER=`root`@`localhost` TRIGGER `paper_BEFORE_UPDATE` BEFORE UPDATE ON `paper` FOR EACH ROW BEGIN
if 
exists (select 1 from my.paper_brightness where brightness_id = new.fk_paper_to_bright) or
exists(select 1 from my.paper_covering where covering_id = new.fk_paper_covering) or
exists(select 1 from my.paper_iso where iso_id = new.fk_paper_to_iso) or
exists(select 1 from my.paper_density where density_id = new.fk_paper_to_density) or
exists(select 1 from my.paper_colors  where colors_id = new.fk_paper_color)
    then 
		signal sqlstate '45000' set message_text = 'Нельзя вставить запись ';
	end if;
END