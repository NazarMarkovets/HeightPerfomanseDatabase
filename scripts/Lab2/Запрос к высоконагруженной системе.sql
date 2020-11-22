-- получить детальное описание всех услуг

use inno;
select 
	s.id,
	s.name_service,
    s.Price,
    p.name `paper name`,
    i.`name` `iso`,
    p.thickness,
    b.Lvl,
    d.lvl,
    col.`name` `Color`,
    cov.`name` `Covering`,
    f.`name` `Font`,
    f.padding `font padding`,
    f.size `font size`,
    f.spacing `font spacing`
from services s
	join paper p on p.id = s.fk_service_paper
    join paper_brightness b on b.id = p.fk_paper_to_bright
    join paper_colors col on col.id = p.fk_paper_color
    join paper_covering cov on cov.id = p.fk_paper_covering
    join paper_density d on d.id = p.fk_paper_to_density
    join paper_iso i on i.id = p.fk_paper_to_iso
    join fonts f on f.id = s.fk_service_fonts
Order by s.Price


-- Изменить статус заказа
