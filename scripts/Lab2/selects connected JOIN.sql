-- select 10 the more important persons, register date is also important for company
/*
use my;
select idUser, nameUser,snameUser, age, R.nameStatus
from user U
join user_role R on U.fk_user_to_role = R.idStatusUser
ORDER by idStatusUser, U.History ASC
limit 10;
*/

-- select top 10 the largest files from users
/*
use my;
select 
	idMacket_to_Print `ID`,
	concat(M.sizebyte,' MB') as Size,
    concat(M.height,' pxls') as height,
    concat(M.width,' pxls') as width,
    nameFormat
from macket_to_print M
join format_type F on M.fk_macket_to_formatType = F.idFormatType
ORDER by SizeByte desc
limit 10;

*/

-- Показать заказы отсортированые по цене со статусом "новый" включая название услуги и данные про макеты пользователей
/*
use my;
select 
	OM.id_order,
    O.order_start, O.total_price, OS.name_status, S.name_service,
    mp.`File`,
    concat(mp.height,' pxls') as height,
    concat(mp.width,' pxls') as width,
    concat(mp.sizebyte,' MB') as Size

from order_macket OM
	join `order` O using(id_order)
    join macket_to_print mp on mp.idMacket_to_Print = OM.id_macket
    join order_status OS On OS.id_order_status = O.fk_order_to_stat
	join order_services card on card.fk_order_id = O.id_order 
    join services S on S.idSerivces = card.fk_service_id
where OS.name_status = 'new'
Order by total_price desc;
*/

/* Показать все услуги с кодом начинающимся с #200, 
включая подробную информацию про бумагу с отбеливатилями больше 2-х грамм
отсортированное в порядке убывания*/

 /*
use my;
select 
	s.idSerivces,
    s.code_service,
    concat(p.height, ' см') AS `paper height`, concat(p.width, ' см') AS `paper width`,
    p.color, p.covering,
    concat(pb.brighnessLvl, ' гр/м') `Добавок отбеливания`,
    concat(pd.density_lvl, ' pp/м') `Добавок отбеливания`,
    s.name_service, s.`description`
from paper p
join paper_brightness pb on pb.idPaper_brightness = p.fk_paper_to_bright
join paper_density pd on pd.id_density = p.fk_paper_to_density
join services s on s.fk_service_paper = p.idPaper
where s.code_service like '#200%' and brighnessLvl > 2
Order by brighnessLvl desc;

*/

-- показать последние 5 заказов отсортированные по убыванию даты заключения, с цветом бумаги "черная" без типа покрытия
/*
use my;
select o.id_order, o.total_price ,o.order_start, os.name_status, s.code_service, s.Price, s.name_service, p.color, p.covering
from `order` o
join order_services card on card.fk_order_id = o.id_order
join services s on card.fk_service_id = s.idSerivces
left join paper p on p.idPaper = s.fk_service_paper
join order_status os on os.id_order_status = o.fk_order_to_stat

where p.color = 'black' and p.covering = 'none' 
order by o.order_start desc limit 5;
*/

